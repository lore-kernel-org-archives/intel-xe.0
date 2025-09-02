Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D33CA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA3E10E81A;
	Tue,  2 Sep 2025 18:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWwhkglF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671DF10E81A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756837202; x=1788373202;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QHno3sktl3K8T9NUWzVSuEzE8iPifi/ah2GSGIB3yj8=;
 b=hWwhkglFkiAu62iX01LmGONgO1f/OnIZIZVixtULNxkAmO7EySTAMk6I
 M4Ah4tHlEGANGZ5Xln0eqOhpWIj/37m7rBfJ8JexTO7An93spiAh9Qqqs
 BbmxHfaNj0aKipqVO1XAOE8v+0mz8cE/m8HstQey7bp5RisOnycPDJUFY
 kHl1uEmYSz0aHMABeTzCXt/AAi01DycLEmEOjoft/A31QVYWHSk5+fXLC
 iNkfrWBKDa8r5iYfPx51c70a1GCAwjC+Kdep2v+lYcYGQ9VVm8ty3d4/8
 UGJk4WoApQszrjC86iXZ2yfY+zJ+sfaJW8gL8Kvy3wJyctw63BlhYMNdk A==;
X-CSE-ConnectionGUID: PcbEtJ+TR2iV0Mt3xpHzmg==
X-CSE-MsgGUID: ygGS8YIbQPiJYUkTVQvWjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76570770"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="76570770"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:20:02 -0700
X-CSE-ConnectionGUID: zSD1VssDR7asblaJOAbDGQ==
X-CSE-MsgGUID: Ozb0Je/UQjmR5SnSfBbIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="202308206"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:20:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:20:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:20:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:20:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhqdqqpBgEz2p3fEMWFeFOV2IIkeF7x1KmWieJNGBUyCiXslYJWA2WmXjtKUBvLVhcyLwxqENAdV2icd4pI5UOvdTb5n2P5JS+oWibF0aeozI1lKjtGZZSoklEbDDXHLFj0BUcDQmu8qVM/c3vBq7jbuguA8l3dGZZm1RqQVYRd8yc/Bxv9T3xsZ+v58nneGXkRsWkqCNf7edMXO2gyqSaojPmRd3Kv/8ZK4Vv8M498YGG5VqJO718e8J245hb63MFxL7Mcu59mKQnJX1kulkzw+acd7D6+EvngrlbxcUouYnBa70oVDCemfytNQg/5UYSpKa4aUmkDgFNqGXi+fLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHno3sktl3K8T9NUWzVSuEzE8iPifi/ah2GSGIB3yj8=;
 b=Gp/FxXTq5yCe0wB296H6cs+tD4mcHh8QXFsoBPjwiR6Hb+h1nRtQ5M1uL+XboWD8qnEyDPy0PvLNjl9pZlKYQAlsLigECroK/lpRFDU9na6hX8asoGkcjhgGoUwy/5MPIqBwgFndukGS/pfPq22KihqTLcB82K5mT4CXoEZVqrVYgAlbv5AsJF+nybQVZ1DKncq08B4xqQVPwu6SYq/eC10T7BUxK2LJb4wzb0y5j+7osO2JogNVOtaTDI2IrWzoKxOb8gqDcG4ChswVDO3ilrOHbyh+uBApgc2SpMT15EllzjCsvxMrP6gWPF+QuvAkHHGPl5WrQUS3xVHAqbkFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB6970.namprd11.prod.outlook.com (2603:10b6:806:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 18:19:57 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 18:19:57 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/configfs: Don't expose survivability_mode if
 not applicable
Thread-Topic: [PATCH 3/3] drm/xe/configfs: Don't expose survivability_mode if
 not applicable
Thread-Index: AQHcHAwRkhi4+9m3EE+bnMkAX7wpy7SAJQkAgAAOJ4CAAAEWAA==
Date: Tue, 2 Sep 2025 18:19:57 +0000
Message-ID: <58d4a31ce4c535521fd1929fb81bdacfa9190a60.camel@intel.com>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-4-michal.wajdeczko@intel.com>
 <cb4d9b4ea275b9d8dfad37a7e078cea8477e9bda.camel@intel.com>
 <619ae479-8e0b-40ac-a1f4-a6086f19e896@intel.com>
In-Reply-To: <619ae479-8e0b-40ac-a1f4-a6086f19e896@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB6970:EE_
x-ms-office365-filtering-correlation-id: 48ef8659-0c76-4c70-7940-08ddea4d529e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WVh5R3ZZMDZCSXE5SWtNbTRxakFNTUdvejBjRVdOYmNOVzd0OTVNdDJmbVFr?=
 =?utf-8?B?NkNrZkIzZGowa0c3MmxpWHRPcXZLVGw2SzM0SkZxYm4zRktDSEZpNGlpNVFq?=
 =?utf-8?B?RjlIYTlWcm5vcHNMaFFMeEFmYTR6M2YwOWk3NkVQOVJ1QWhpdnk2dU5DZGgx?=
 =?utf-8?B?MXIyN2gzNnp5c1MvUUZIODNMcWprcUw3TDErclpkUDRkdHlnbUZNVEIyZDBZ?=
 =?utf-8?B?RjRENnBEdHk0Z2trck9oWkVZN2ZuSmprOGhWTldaN3dEVEcydkNQSXhKU2JB?=
 =?utf-8?B?YUw1SDlIYmI0OUlETWtmV1RGOFh1SVZNQzFOcXBmbXl4QndHVFQwWGVKUHpP?=
 =?utf-8?B?cEhXT08xQlFkTVlLUmtISFZ5RWtzKzNTQi9NK3cxeXluclJISHNrc2hzUEQw?=
 =?utf-8?B?VnducGlhTVVtR3gyT1QzUWszazF4Wm85RnFpTzNtZmpxRGNybXFWUm5kWDRy?=
 =?utf-8?B?TFZlaDNwdWpVRThpNHB3dWNQM01zcWhNWXRUeWNyVm41TU1qQldON2FTVkFR?=
 =?utf-8?B?bytRVVczSU0rL0ZUWGo5bGpsWHZVclRuQmNEd3BZT1NZRUZPdElNSUQ2SUNR?=
 =?utf-8?B?eHkxbW1iWTBIcTlubnFhSXpnQzhRc1VhYmo1S0E3Ly9hQy9iZy9NdHlSVGJP?=
 =?utf-8?B?bld4dEhoQ1hZQ2syWU9zUk1ST0JOUm1GekdCTEUrYmV5TXN6K1hMeGFDSVJp?=
 =?utf-8?B?R2h0bUE1U3J0RE44dVROVnpTYnlEcWpja0MzQzZqdk5SLzlXUHlWYTRMYnlE?=
 =?utf-8?B?bWFNcTRqbWMyM3M4bXpjVldua2thTkFzdDlGTjZOOE8vcDhwdVNGTU43d0ln?=
 =?utf-8?B?L2UvU2lPVmdlL2NiTm5LYzRQMmZ4cTQwN2p4RmgrNEdSeWNZbDBZaVNyUDFX?=
 =?utf-8?B?UDVVNVhqeG5rKzQyZE14QW1saTRJQkgzekYvb2U4THVlUStPSmp6dnFiMlRi?=
 =?utf-8?B?NWpHQlNodC9FUTllVW1MbTJjbGFIdjYzdHhrOGtUZElTQ1BhM0k3RUtLZlZn?=
 =?utf-8?B?dmtjTWVDajNXa0t6SkdDZ1h4Szk0cGtybkFGU3Bid1ZRR3cwT2kvbWUwUFdT?=
 =?utf-8?B?QzJvcnZ5Z3BxUUcrSWFkSUJiUk5iRm0zNlk1VXRueC94am51UmthZGpBN0gz?=
 =?utf-8?B?UndGMGlGUmx2OVl4Y3BSYUhlYkhOeXNodCs4ejJCVVl5OS80OTJvWjQ2R29L?=
 =?utf-8?B?akw4dmxBN0V5RnBoQWtkUW5RaEJncHRPbE5EOEtZdmxnMGEyYTBYemxFRmll?=
 =?utf-8?B?dTNNTEJOZVJxQ0J5NVE0Vlg0eDN1amxLcnVGZXdYK2s5eHBZeWNyTFJ6V0h3?=
 =?utf-8?B?Nk5qSWtuVzV2aE9IRCtCYTlNY21UdkNIdmRJY1E2bkg4TTN1NjRVWVJOMXI2?=
 =?utf-8?B?OVJ5Z3ExT01nbkZDSUlVK1haRGdGOW5IOTVielBrR2xUUGQrRTVaM09jbC91?=
 =?utf-8?B?aWI1YS9OdUd5TE1rQ3NwbE9rUUFtYzNmeE55NnlFNmxTdGR6YzJ2ZkZzK0ls?=
 =?utf-8?B?Rmp4b3NOcHduOXFKM2hpclNuRTdEVWYxZ0ExbFZoM3hwZ1VpR3REWGJibzRn?=
 =?utf-8?B?TDJTdk5XR3RBUTFGM1o3R0hja3FaWXVXQ0J1M3VFTTdIYk9rTHNIQzhLMk01?=
 =?utf-8?B?enJoMEN4aGtnRm9mT1hCWWNvMHlmeFFBaElOM0psVW94N0MvTno3Ui8wOVVz?=
 =?utf-8?B?VXV5NE9jWldSNFdvendmSmkyZVJtbWRlQngydHE2Tm5jeGlqOWNkaUhISUZ3?=
 =?utf-8?B?WmFWS2QvRENGcWx4NWpiNHNJV2I4UElOTElndWNuSUJtUDVMRHRITUUvNGt3?=
 =?utf-8?B?Tm9KOE8vOTkyNEZ4K1preGJ6VUpsbCsraDFRYTlwTkVzdmczaWhvMUhVY2FP?=
 =?utf-8?B?ZjZETkMySERSa0kwRVdQa2pNamRvK1ZkUCswZkw3dE9TU3dZWWZUbVg2Smx1?=
 =?utf-8?B?N0daTEhWeGpvZGVYaVVxQXFGS05NSCtDNUZVZ2ZBdytiMG0vTGhvMk1kc21K?=
 =?utf-8?Q?hDvrSQphm2v1KySjyXoGJsxelsln8c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVMraXZJSFYzdUcrMEtaN0JNQUo3K1RlV0U4VTFoeUhaQXFHaGZzSWIrTStm?=
 =?utf-8?B?eGpUSzJXUGswc1FoV05aWEt4SkxWTTRPbjB4TW5QUmpTYXNaYzF3NVN0cTdo?=
 =?utf-8?B?K0lWdVgxeFpYY0dweFJySGFEOVY5SWFOOXlBREZLVjFtOEJCREREdVFqR0FV?=
 =?utf-8?B?anEwSjdQeUJJWmxnanBjZUVNL2J0dzNGQmhoRGhsWEh5Ym54UmZKcjhwbERD?=
 =?utf-8?B?d25iUzhxQlRRemE3TlNBcnlKK0dZMXhMeDNhZ0VybmNoVXRuV2VOT0hXL2NW?=
 =?utf-8?B?TVc3SndUV1NnbnJBaHhRYnNQcjZqUEdVUFgzN2JmSHdwTXhFMkdiOFNJRVhO?=
 =?utf-8?B?UVUwQTNNYzNidFNOYVViR1JsRzB0S2VOQjJMOHpyQmMyb3VSRjNSN05DWURC?=
 =?utf-8?B?U3JGS2YwL054eUdGYmFFRThDNzNsaG0rQXFYZVJlTGtrL1Vicmpic0duWG9S?=
 =?utf-8?B?aTFxY1dOZTkyMG9nbkg4dGJXR1hzcllyR3ZJbEhaQUYrbEdkSFNwaXdwMXRw?=
 =?utf-8?B?amh5bWNkQXpwRWlhS2lyRVZLcnpSaW1mWEtDU2FnNmVSeVZvQ0ZLZmZKYmQr?=
 =?utf-8?B?WW92ejBQcjREcWZCU2RKZ2hNdGE1YndtMlg0aGM3V1hnd3ZXQ2VEYUd6MTRK?=
 =?utf-8?B?YlNBTkFEaW9WdEs3U3R4YlFyL3BlZHp3T2xocER2N0JmRFdmRnluRHhvM2M1?=
 =?utf-8?B?eWkzYk43WE9sS21jc3J1a0Y1cUx3SXZYZGxWN21SMHh1T3JCM2x1RHhvVHl3?=
 =?utf-8?B?VndpQU5QS3dRa2RBL2Jha0d1aVV1K3hnY0haNE5iZXJvNXM5b0h1R1lxYmgz?=
 =?utf-8?B?VjVhREMzNWpTU3Fxb2JVdS93dkJRK0NEYmNhNlFYTk4wZDB6WWdDNGZXQWkw?=
 =?utf-8?B?WUNWbXNLYW4vV29oQ1NYZGtaZFIya1F3dkdCTjRFTVNWYXBaUTc1ZEh1MExI?=
 =?utf-8?B?RjRwV0tqdG5sQllCdTZBNTBIWFpVUkZMSmhxU255UURNaWFqRWtVZS9oUEFV?=
 =?utf-8?B?aEpVWkp0a24vRm9sMDVrK2F6aUVUZGdXRld6OWVZalJzT3djK3cwNDVOQndh?=
 =?utf-8?B?TmY5Mjg2cHgxdDdtem0vNWVNdldGOEJxczBGWndpWDA5ZFBVdEhWV2hWSXZN?=
 =?utf-8?B?b01TNkY4MDZEZE8xRWEvMVd1WW5uVDlHbjVFVkxZam9HWTFJWEEzTUZXU3hm?=
 =?utf-8?B?RjRzbklZZG5remhIMi9PckpVWTFzR2dBU0pWNDdFMWF0eVhucW5heS9OamRz?=
 =?utf-8?B?bHpIS0pzSTNQTzBUMEJyNWt0bDFOeTQvWlBvOTRWREdIVVgwR3o2SXMvaGpy?=
 =?utf-8?B?QlV6cHp4TUF3N3MyREZBUGs4QUlVYnJRZ1RSK0V1dGFCVFZRY0hQUXVIU0l3?=
 =?utf-8?B?aGZkTGpMeXZPUSt2SFZibnEvUEJUZ3g2R2RYazdnNDlRS2tkMHFKWEtMYmk5?=
 =?utf-8?B?ejZ2cm5pUjhxNEVWa2d6QXRIRTlnbi9sN3JCYjNOY1hXUmMyckFMaDlsZHk2?=
 =?utf-8?B?ZHFidTlHK2NvdXNLcS92cERhdWNxak5MSU1yMFFZcGhadGtYalVqaTZXbExh?=
 =?utf-8?B?TTk2c0d5dGg3Q1pUcnQrZGJaN2hMaUdnMEVMOWZuM1crRjdFZWM5bVF5SmJ3?=
 =?utf-8?B?SG5wOUFDMklpMHY4dUl2N1E3QS9OVVR3RDVNaDQwUDRoMTJNQUZzNHkwMmZr?=
 =?utf-8?B?OC8rYXE0bVlRd0NmZ1dEQndaa2llZkxoeU1ETUZsaFptekxya0pDWW03RHg3?=
 =?utf-8?B?WXRQd0VCNjJhbjNENitRaE5MTWJ0eGZ2VWx4WFlLQzBTRDRsWFRzR3ltbXdP?=
 =?utf-8?B?YTdPYzJ5dlBkaldpNlFzbW1YaGdQc0g2RGNBemtuRGJBT1R6bk1DK2tsc3V1?=
 =?utf-8?B?MERKeFEwaFJhVnVZN202bmxyVnBsM3hwV0JYaElEZitwMWo1VEQ3TnpuaElt?=
 =?utf-8?B?REFLV1Z3WmFJTGlCWE8rMkZmekwxNVpvNUpjdktWM0NTa0w2RTh6aXZ0cGxM?=
 =?utf-8?B?TlBoQTJaMGtabWJldkdua283VGVGUmdKY0grYk5ETEJtdzl4VUZaZFhBcnBo?=
 =?utf-8?B?S0E0RFhscEpxWkxMRVl4R2tYVW94RG5Pa2dOSDJPdUhrTjRmS0pxMit1Ky9p?=
 =?utf-8?B?dDZEd0hyaUFxekN6eUlwM2xLcCs4NUY3WitGME5JK2VVUE5uejYvcnNJc0xw?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F52F1C0A1D4BA41B666DD6537F99C63@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ef8659-0c76-4c70-7940-08ddea4d529e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 18:19:57.5457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdFXjIUUvOSiWku7UYs4FuVFvyjue7qvZOHRVFpLr3KUCrMVmoAX89PBoxjTV9EQEC49ybdPiZWe7cmZynNZzj3dIVUtUdx9O6KWspijlpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6970
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI1LTA5LTAyIGF0IDIwOjE2ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDkvMi8yMDI1IDc6MjUgUE0sIFN1bW1lcnMsIFN0dWFydCB3cm90ZToN
Cj4gPiBPbiBUdWUsIDIwMjUtMDktMDIgYXQgMTU6MTcgKzAyMDAsIE1pY2hhbCBXYWpkZWN6a28g
d3JvdGU6DQo+ID4gPiBUaGUgc3Vydml2YWJpbGl0eV9tb2RlIGF0dHJpYnV0ZSBpcyBhcHBsaWNh
YmxlIG9ubHkgZm9yIERHRlggYW5kDQo+ID4gPiBwbGF0Zm9ybXMgbmV3ZXIgdGhhbiBCQVRUTEVN
QUdFLiBVc2UgLmlzX3Zpc2libGUoKSBob29rIHRvIGhpZGUNCj4gPiA+IHRoaXMgYXR0cmlidXRl
IHdoZW4gYWJvdmUgY29uZGl0aW9ucyBhcmUgbm90IG1ldC4gUmVtb3ZlIGNvZGUNCj4gPiA+IHRo
YXQNCj4gPiA+IHdhcyB0cnlpbmcgdG8gZml4IHN1Y2ggY29uZmlndXJhdGlvbiBkdXJpbmcgdGhl
IHJ1bnRpbWUuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXYWpkZWN6a28g
PG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiA+ID4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8
bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IFJpYW5hIFRhdXJvIDxyaWFuYS50
YXVyb0BpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2NvbmZpZ2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDI0ICsrKysrKy0tLS0tLS0tLS0NCj4g
PiA+IC0tLS0NCj4gPiA+IC0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdm
cy5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jIHwgMTEgKy0tLS0tLS0tLQ0KPiA+ID4gwqAzIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+ID4gaW5kZXggNDNmMDAwMjYw
NzUyLi4wMzM3ODExODY0Y2QgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfY29uZmlnZnMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2Zz
LmMNCj4gPiA+IEBAIC0zNjksNyArMzY5LDEyIEBAIHN0YXRpYyBib29sDQo+ID4gPiB4ZV9jb25m
aWdfZGV2aWNlX2lzX3Zpc2libGUoc3RydWN0DQo+ID4gPiBjb25maWdfaXRlbSAqaXRlbSwNCj4g
PiA+IMKgew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9jb25maWdfZ3JvdXBfZGV2
aWNlICpkZXYgPQ0KPiA+ID4gdG9feGVfY29uZmlnX2dyb3VwX2RldmljZShpdGVtKTsNCj4gPiA+
IMKgDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gZGV2LT5kZXNjOyAvKiBzaGFsbCBiZSBh
bHdheXMgdHJ1ZSAqLw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGF0dHIgPT0gJmF0dHJfc3Vy
dml2YWJpbGl0eV9tb2RlKSB7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKCFkZXYtPmRlc2MtPmlzX2RnZnggfHwgZGV2LT5kZXNjLT5wbGF0Zm9ybSA8DQo+ID4gPiBY
RV9CQVRUTEVNQUdFKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiAr
DQo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsNCj4gPiANCj4gPiBXaHkgY2hhbmdl
IHRoZSByZXR1cm4gaGVyZT8gQ2FuIHdlIGVpdGhlciBsZWF2ZSB0aGlzIGFzIGRldi0+ZGVzYw0K
PiA+IG9yDQo+ID4gb3RoZXJ3aXNlIHVzZSByZXR1cm4gdHJ1ZSBmb3IgdGhlIGluaXRpYWwgaW1w
bGVtZW50YXRpb24gKHByZXZpb3VzDQo+ID4gcGF0Y2gpPw0KPiANCj4gdGhlIHJlYXNvbiBpcyBz
aW1wbGU6IGluIHBhdGNoIDIvMyBJIGp1c3Qgd2FudGVkIHRvIHNob3cgaG93IHRvDQo+IG9idGFp
bg0KPiB0aGUgZGV2aWNlIHhlIGRldmljZSBkZXNjIGhlcmUgdG8gbWFrZSBzb21lIGRlY2lzaW9u
cyBiYXNlZCBvbiB0aGF0Lg0KPiANCj4gd2l0aCBwbGFpbiAicmV0dXJuIHRydWUiIGluIDIvMyBJ
IHdvdWxkIGhhdmUgdG8gbWFyayBkZXNjIHZhciBhcw0KPiAibWF5YmVfdW51c2VkIg0KPiANCj4g
YW5kIE9UT0ggbGVhdmluZyAicmV0dXJuIGRlc2MiIGhlcmUgaW4gMy8zIGlzIHJlZHVuZGFudCBz
aW5jZSB3ZQ0KPiBhbHJlYWR5IG1pZ2h0IGhhdmUgZGUtcmVmZXJlbmNlZCB0aGUgcG9pbnRlcg0K
PiANCj4gc28gdGhpcyBvbmUgZXh0cmEgbGluZSBpbiBkaWZmIHdhcyBJTU8gbWluaW1hbCBjb3N0
IHRvIGhhdmUgdHdvDQo+IHNlcGFyYXRlIHBhdGNoZXMNCj4gKGFzIEkgZGlkbid0IHdhbnQgdG8g
Y29tYmluZSBzdXJ2aXZhYmlsaXR5X21vZGUgY2hhbmdlIHdpdGgNCj4gaW50cm9kdWN0aW9uIG9m
IGlzX3Zpc2libGUpDQoNClllYWggaXQgbWFrZXMgc2Vuc2UgdG8gbWUgdG9vLiBMZXQncyBnbyB3
aXRoIHdoYXQgeW91IGhhdmUgaGVyZS4NCg0KRm9yIHRoZSBzZXJpZXM6DQpSZXZpZXdlZC1ieTog
U3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCg0KSSB3YXMgYnJpZWZs
eSB3b25kZXJpbmcgaWYgaXQgbWFrZXMgc2Vuc2UgdG8ga2VlcCB0aGUgcHJpbnQgbWVzc2FnZSB3
ZQ0KaGFkIGZyb20gYmVmb3JlLCBidXQgZ2l2ZW4gd2UncmUgdXNpbmcgdGhlIHN0YW5kYXJkIGlu
dGVyZmFjZSBmb3INCmNvbmZpZ2ZzIG5vdyB0byBjaGVjayB0aGUgdmlzaWJpbGl0eSwgYW55IGVy
cm9yIGhhbmRsaW5nIHNob3VsZCBiZSBkb25lDQphdCB0aGUgaW50ZXJmYWNlIGRlZmluaXRpb24g
cG9pbnQgYW5kIG5vdCBpbiB0aGUgZHJpdmVyIGxpa2Ugd2UgaGFkDQpiZWZvcmUgd2l0aCB0aGUg
ZXhwbGljaXQgY2hlY2suIFNvIGxvb2tzIGdvb2QgdG8gbWUgd2hhdCB5b3UgaGF2ZS4NCg0KVGhh
bmtzLA0KU3R1YXJ0DQoNCj4gDQo+ID4gDQo+ID4gRXZlcnl0aGluZyBlbHNlIGluIHRoZSBzZXJp
ZXMgbG9va3MgZ29vZCB0byBtZS4gVGhpcyBkb2VzIHNlZW0gbGlrZQ0KPiA+IGENCj4gPiBiZXR0
ZXIgd2F5IHRvIGFwcHJvYWNoIHRoaXMuDQo+IA0KPiB0aGFua3MsDQo+IA0KPiA+IA0KPiA+IFRo
YW5rcywNCj4gPiBTdHVhcnQNCj4gPiANCj4gPiA+IMKgfQ0KPiA+ID4gwqANCj4gPiA+IMKgc3Rh
dGljIHN0cnVjdCBjb25maWdmc19ncm91cF9vcGVyYXRpb25zDQo+ID4gPiB4ZV9jb25maWdfZGV2
aWNlX2dyb3VwX29wcyA9DQo+ID4gPiB7DQo+ID4gPiBAQCAtNTU4LDIzICs1NjMsNiBAQCBib29s
DQo+ID4gPiB4ZV9jb25maWdmc19nZXRfc3Vydml2YWJpbGl0eV9tb2RlKHN0cnVjdA0KPiA+ID4g
cGNpX2RldiAqcGRldikNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gbW9kZTsNCj4gPiA+
IMKgfQ0KPiA+ID4gwqANCj4gPiA+IC0vKioNCj4gPiA+IC0gKiB4ZV9jb25maWdmc19jbGVhcl9z
dXJ2aXZhYmlsaXR5X21vZGUgLSBjbGVhciBjb25maWdmcw0KPiA+ID4gc3Vydml2YWJpbGl0eSBt
b2RlDQo+ID4gPiAtICogQHBkZXY6IHBjaSBkZXZpY2UNCj4gPiA+IC0gKi8NCj4gPiA+IC12b2lk
IHhlX2NvbmZpZ2ZzX2NsZWFyX3N1cnZpdmFiaWxpdHlfbW9kZShzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCj4gPiA+IC17DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfY29uZmlnX2dyb3Vw
X2RldmljZSAqZGV2ID0NCj4gPiA+IGZpbmRfeGVfY29uZmlnX2dyb3VwX2RldmljZShwZGV2KTsN
Cj4gPiA+IC0NCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICghZGV2KQ0KPiA+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gPiA+IC0NCj4gPiA+IC3CoMKgwqDCoMKg
wqDCoGd1YXJkKG11dGV4KSgmZGV2LT5sb2NrKTsNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGRldi0+
Y29uZmlnLnN1cnZpdmFiaWxpdHlfbW9kZSA9IDA7DQo+ID4gPiAtDQo+ID4gPiAtwqDCoMKgwqDC
oMKgwqBjb25maWdfZ3JvdXBfcHV0KCZkZXYtPmdyb3VwKTsNCj4gPiA+IC19DQo+ID4gPiAtDQo+
ID4gPiDCoC8qKg0KPiA+ID4gwqAgKiB4ZV9jb25maWdmc19nZXRfZW5naW5lc19hbGxvd2VkIC0g
Z2V0IGVuZ2luZSBhbGxvd2VkIG1hc2sNCj4gPiA+IGZyb20NCj4gPiA+IGNvbmZpZ2ZzDQo+ID4g
PiDCoCAqIEBwZGV2OiBwY2kgZGV2aWNlDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2NvbmZpZ2ZzLmgNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZp
Z2ZzLmgNCj4gPiA+IGluZGV4IDU4YzhjMzE2NDAwMC4uMTQwMmU4NjNiNzFjIDEwMDY0NA0KPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmgNCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5oDQo+ID4gPiBAQCAtMTUsNyArMTUsNiBAQCBp
bnQgeGVfY29uZmlnZnNfaW5pdCh2b2lkKTsNCj4gPiA+IMKgdm9pZCB4ZV9jb25maWdmc19leGl0
KHZvaWQpOw0KPiA+ID4gwqB2b2lkIHhlX2NvbmZpZ2ZzX2NoZWNrX2RldmljZShzdHJ1Y3QgcGNp
X2RldiAqcGRldik7DQo+ID4gPiDCoGJvb2wgeGVfY29uZmlnZnNfZ2V0X3N1cnZpdmFiaWxpdHlf
bW9kZShzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+ID4gPiAtdm9pZCB4ZV9jb25maWdmc19jbGVh
cl9zdXJ2aXZhYmlsaXR5X21vZGUoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPiA+ID4gwqB1NjQg
eGVfY29uZmlnZnNfZ2V0X2VuZ2luZXNfYWxsb3dlZChzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+
ID4gPiDCoGJvb2wgeGVfY29uZmlnZnNfZ2V0X3BzbWlfZW5hYmxlZChzdHJ1Y3QgcGNpX2RldiAq
cGRldik7DQo+ID4gPiDCoCNlbHNlDQo+ID4gPiBAQCAtMjMsNyArMjIsNiBAQCBzdGF0aWMgaW5s
aW5lIGludCB4ZV9jb25maWdmc19pbml0KHZvaWQpIHsNCj4gPiA+IHJldHVybg0KPiA+ID4gMDsg
fQ0KPiA+ID4gwqBzdGF0aWMgaW5saW5lIHZvaWQgeGVfY29uZmlnZnNfZXhpdCh2b2lkKSB7IH0N
Cj4gPiA+IMKgc3RhdGljIGlubGluZSB2b2lkIHhlX2NvbmZpZ2ZzX2NoZWNrX2RldmljZShzdHJ1
Y3QgcGNpX2Rldg0KPiA+ID4gKnBkZXYpIHsNCj4gPiA+IH0NCj4gPiA+IMKgc3RhdGljIGlubGlu
ZSBib29sIHhlX2NvbmZpZ2ZzX2dldF9zdXJ2aXZhYmlsaXR5X21vZGUoc3RydWN0DQo+ID4gPiBw
Y2lfZGV2DQo+ID4gPiAqcGRldikgeyByZXR1cm4gZmFsc2U7IH0NCj4gPiA+IC1zdGF0aWMgaW5s
aW5lIHZvaWQgeGVfY29uZmlnZnNfY2xlYXJfc3Vydml2YWJpbGl0eV9tb2RlKHN0cnVjdA0KPiA+
ID4gcGNpX2RldiAqcGRldikgeyB9DQo+ID4gPiDCoHN0YXRpYyBpbmxpbmUgdTY0IHhlX2NvbmZp
Z2ZzX2dldF9lbmdpbmVzX2FsbG93ZWQoc3RydWN0IHBjaV9kZXYNCj4gPiA+ICpwZGV2KSB7IHJl
dHVybiBVNjRfTUFYOyB9DQo+ID4gPiDCoHN0YXRpYyBpbmxpbmUgYm9vbCB4ZV9jb25maWdmc19n
ZXRfcHNtaV9lbmFibGVkKHN0cnVjdCBwY2lfZGV2DQo+ID4gPiAqcGRldikgeyByZXR1cm4gZmFs
c2U7IH0NCj4gPiA+IMKgI2VuZGlmDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYw0KPiA+ID4gaW5kZXggNzk0MjZlYTQ2ODYxLi4xOWExNzMy
ZTMzZDQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJp
bGl0eV9tb2RlLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmls
aXR5X21vZGUuYw0KPiA+ID4gQEAgLTI4NywxOSArMjg3LDEwIEBAIGJvb2wNCj4gPiA+IHhlX3N1
cnZpdmFiaWxpdHlfbW9kZV9pc19yZXF1ZXN0ZWQoc3RydWN0DQo+ID4gPiB4ZV9kZXZpY2UgKnhl
KQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBkYXRhOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oGJvb2wgc3Vydml2YWJpbGl0eV9tb2RlOw0KPiA+ID4gwqANCj4gPiA+IC3CoMKgwqDCoMKgwqDC
oGlmICghSVNfREdGWCh4ZSkgfHwgSVNfU1JJT1ZfVkYoeGUpKQ0KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgaWYgKCFJU19ER0ZYKHhlKSB8fCBJU19TUklPVl9WRih4ZSkgfHwgeGUtPmluZm8ucGxhdGZv
cm0NCj4gPiA+IDwNCj4gPiA+IFhFX0JBVFRMRU1BR0UpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsNCj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgc3Vydml2YWJpbGl0eV9tb2RlID0NCj4gPiA+IHhlX2NvbmZpZ2ZzX2dldF9zdXJ2aXZh
YmlsaXR5X21vZGUocGRldik7DQo+ID4gPiAtDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoeGUt
PmluZm8ucGxhdGZvcm0gPCBYRV9CQVRUTEVNQUdFKSB7DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKHN1cnZpdmFiaWxpdHlfbW9kZSkgew0KPiA+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJyKCZwZGV2LT5kZXYs
ICJTdXJ2aXZhYmlsaXR5IE1vZGUNCj4gPiA+IGlzDQo+ID4gPiBub3Qgc3VwcG9ydGVkIG9uIHRo
aXMgY2FyZFxuIik7DQo+ID4gPiAtDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgeGVfY29uZmlnZnNfY2xlYXJfc3Vydml2YWJpbGl0eV9tb2RlKHBk
ZXYpOw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7DQo+ID4gPiAtwqDCoMKgwqDC
oMKgwqB9DQo+ID4gPiAtDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLyogRW5hYmxlIHN1cnZpdmFi
aWxpdHkgbW9kZSBpZiBzZXQgdmlhIGNvbmZpZ2ZzICovDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKHN1cnZpdmFiaWxpdHlfbW9kZSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIHRydWU7DQo+ID4gDQo+IA0KDQo=
