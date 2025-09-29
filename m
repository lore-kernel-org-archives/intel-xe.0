Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E32DCAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 16:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1331510E466;
	Mon, 29 Sep 2025 16:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOu7g8Ld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606610E467
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759162316; x=1790698316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G4rYhib6FqMynDLJIf2rQicA8PA+28rRojrTdWWXdqY=;
 b=jOu7g8LdwWC4l3VjUsg7eEBn8PGYQEtjzHDF+oXseBzDOZJNpq5st0Gd
 tdnOJS67ODImNVsAuUy6zb8AbxLeG+7TzN2Ni8ArzL6JYEDt1rODbYAQL
 VKvS4RemT5DGRdcNQWnezUeTe8B2muSaqz82UKk/sc7FyS0J6EuDbSCFy
 6IwsjMC48qZJxfaMHStSPL5j1cosDxCFeYILCDvzO4WGyv0L4zV/1KHTp
 FlT45WervCQItT42jjU8mmgtYzXHLxJ807nGs79csUF8dBnhXNJ1BDntt
 0fQ3gxSUYHVu/hetUA765Txx9KfBczilJPv2tADO7GdSvXixJxrw16Z0W A==;
X-CSE-ConnectionGUID: wyhPH+hNRvyeydSHmIrlQg==
X-CSE-MsgGUID: ekRX1M2AQYSDRnv9alQQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72020377"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="72020377"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 09:11:54 -0700
X-CSE-ConnectionGUID: Oylgx0fkTJGN584Ceruc6Q==
X-CSE-MsgGUID: 4vE4WlP8Tai3NpV8e53BfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177877438"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 09:11:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 09:11:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 09:11:51 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 09:11:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4J2iMHE4tcsTwQQXaiBIe3LQ/N4B4FRie+ldpDhv1t2ZfeHFU+T6BIHXcZeDgcpN6KgPkTm80L1rfLfEcfgq3y/lgWxg3p/h5zPNoW4usM3veTdc9PUnIZdjSk/2Dm0zHUhFd8sG2PWtDGjqyjgXBcSCgG7Ue7hnwENhfKgzNa2+pVwzpxqxmC6sfNuac26KfC5DH2YDmZxq+217nGl+s50cK91JRVM/1GPE13gCLuF6jiVWf3XBZ3BGRfXd+pBwk2KDOy0Apfsmm08YZ9HoJgrTDeej4/C6ElPeeClwpnBOuuY6zD1zzZ6FUqu/g4MfMMO+mVxararUMM0z7ME2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4rYhib6FqMynDLJIf2rQicA8PA+28rRojrTdWWXdqY=;
 b=VT/SeO7eBnKEqdVldXtyhjouud4CxfdMQ0lAJG923FNyE8hXA13i/DKTugmJnzbfvopLzmJQZ5j5G9F1w63vg9TCAghNX3oW5BAmEvouBqFtHN2jRgLTd+eATrCD11GkMaUA0lTpqoq609qgqb+FcY04m3R1gEhr7j6EO/mzZCxFQzaCpFOADo3+9lKFBhpmstEVVUzMwIVUKxXI1o66NpKlCxrhCdCD7bzUJdNV+4p5gEywCIwn96JfCYo/Omqe3qf8BQmsE8PpDLiNtK9mvz8hPILEoylvHB1y05kMu5d4CDv+cm0Ahq+WWb+eK3ikdjvaHzom1uQJ0X3r8cKBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 16:11:39 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 16:11:39 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Update GuC log buffer type value
Thread-Topic: [PATCH v3] drm/xe/guc: Update GuC log buffer type value
Thread-Index: AQHcLjPuv87b7a/Kw0qUEV/5M8e9wbSqWw6A
Date: Mon, 29 Sep 2025 16:11:39 +0000
Message-ID: <f8c0257b696a789f0c347e855f54a6f43813cc18.camel@intel.com>
References: <20250925154849.681901-1-zhanjun.dong@intel.com>
In-Reply-To: <20250925154849.681901-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ1PR11MB6227:EE_
x-ms-office365-filtering-correlation-id: cd05e643-d010-45bb-13a5-08ddff72df41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QzNHSW9yVFRoNjVGWW5BZXRpeWk0VEtPd3pkanJPd0wxeHVYWEFXUVhndDhG?=
 =?utf-8?B?Unh2YUVzNHpYVzZnWVNUbTRzNElxcHI1T2IyeW5iK05hQm9sUnYwQU9WSER3?=
 =?utf-8?B?NDRobm5lYWp0ZWVmUkNuOXVGWm1TUHhRUlRWSFJjSjBuaGt0N0tDWlVCQTNu?=
 =?utf-8?B?bkZ1L0dZZDJpa09TOGRGeC9mWHY1WEE0UTBpenhEd1NWUkJJT0l3Vzc4akdM?=
 =?utf-8?B?VWVYRnFVRkN4dmY5Y1RVTWJuODM3WVJiaWNGeUduQktHbUIxaVlaYzY2ZTVn?=
 =?utf-8?B?MFE5NXpUT1FUQ2NySm05bHVSdExIc1QybS9WY21LanlwSkhXblgxM2JIeTBT?=
 =?utf-8?B?T09RaXZGU3FRVFBYS3pkVm9ySjlheG5DWkZtV3BZNDBOUE5lWWVQT05QOUxv?=
 =?utf-8?B?bXdNRWdqdzA0UE1tcmtPL2E1WUs0Rm1JMS9URVBmMkw3Nlg1V0FXNU1rSVBq?=
 =?utf-8?B?eCtDZWJYcGZPZkswRUkvSjVBZ0xIOTIwUHZzR0hFKzFjT1IrQ0t3d3RDaHpF?=
 =?utf-8?B?aUszSjV2b25rOXV6TWRjdDBhOTU1S2V2N1Q5aGN6NHpkUUZGdWhtaXUyMGlt?=
 =?utf-8?B?eDlPaHNpUHIzMWNqZGJHWnlLRGF6Q1UvSHZLRHM3Nnk3V0VSNVd1Y3AraTU2?=
 =?utf-8?B?Z3kxNGhwcHE4VlZReFVCTGFvSHNQWEhDb0hPSkZOZU41VzMweTZDSjI3aDdF?=
 =?utf-8?B?ZFV3VE5VaXFSUGdQOWhZVHJGS3ZDRjZVVmoxbjgrVGk0WmE1ODN0ZlBUejN6?=
 =?utf-8?B?NXFsd0VvRVdrdDA0dUlpZXBhUHdQeFhyTGxJeTRoc0JCcjZxQldnNGFBSTdZ?=
 =?utf-8?B?eDYxTWNnS0I3a28wTFdDbDgwdTFFaVhabzVxaS82Ni93VUNTNkNGNlFraC9a?=
 =?utf-8?B?bzBjT2NjQ0dLUG5hai9hTnJvY0hGWVovS1ZONEgxM3J2R0IxT0RLQnJuWEZt?=
 =?utf-8?B?bkt2RFlCS0xMY1JvZEUydkdqMjdPcjF3SXdlREZyOW53K1hsZUl3eG9BT0dB?=
 =?utf-8?B?SjF6ZmhvTVo2dzNYVno3cHdZbFZpUkV5QldaYXBGbStHLy94LzdJaW5VcVY3?=
 =?utf-8?B?cUFBcjQySmpzYi9oZXYwQ1FLNEdPcFBSb0prUzBqakdadW9RYXpMMXZWZW1m?=
 =?utf-8?B?VEFqQ2tZVE11aHhuOWQ3clhzVy9LMnNpLzVPRU1taGJiOVNOQkRscTFQUEw3?=
 =?utf-8?B?U1g4ZmlRMUlHTTJhZGttRk9KOTk5Q2JlSXNSYkJkQXVCNFZaQWc1YTBZajdU?=
 =?utf-8?B?ZWVObE1NQk5paStneUdsL2h5R1VxczE2Z3VXRWc2VTgvZFZ3cVBOR1prOVFl?=
 =?utf-8?B?T0Z0dE9yMnBNVzhualhIL2M1UHI3YUdyOUVrYXBUeG1wK25yKzNyNFBlRFBH?=
 =?utf-8?B?T21KZUo1SWN5RmlCQ2phdFlCRlVEZngwUjlDV0c2RmtaNkxWN0FzSjFTNW9w?=
 =?utf-8?B?c0t0bmo2SDFxOGNSTFdGOU9iMk1oT1hHc1cyb3dVSVdQTFBTK09Mb1ZkYVoy?=
 =?utf-8?B?RHVPemFkOVpWMkNxSUs4eG9iTm50Nko3eC8vM0RoNS93eEhnMWhmTE1JTDNW?=
 =?utf-8?B?TUJwd2M3Y1lENnE3ZkVTU2VUQ1Nmc1VZODBNWllYU2x6b1Z3K0h0YVYrbURk?=
 =?utf-8?B?RFR2ZlhFKzN3WFNkVEprNU9TQ1d1NTVNcEV2Sy9xbDZmK0lEUi9aSW1rTHY5?=
 =?utf-8?B?bkVjT1dwdmNLeWZFOHVFVXYvcXdQNnhOdmM0V2ZteE1ucktoN2NBMUJUcGJa?=
 =?utf-8?B?aHhkaDlvTVFlclNsVDVQUnlpOHU0NFJJajVqNElsZTBacDMySnZBa2QxS0Rv?=
 =?utf-8?B?RG1GVXl5NzJyVkdQS0luQ0tUWHo0MndESnVJQ1ZlVk56YUthTFNkdHd5RDZP?=
 =?utf-8?B?WjFwVmxGL3JvVnJuQUtwZmpBTkdyaHl1cXdDWGJrWFVuOHJNZVJTaUVYa3Mv?=
 =?utf-8?B?emwyRDZCcFh3OTF4V2ZDd3A5RVMrMGt0T1ZxZnRORTR2cktIem1RaDJsVFNL?=
 =?utf-8?B?eDRMdXZJU2hJN1AxOEYxZ1c4TGRWUHRCTmgzV20vRk1YNzUvaUNlb1N6TnFX?=
 =?utf-8?Q?KR0geV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VndCK2xaZ2k5Sm04dTYzN04vekN1dG4xbVV0Q3B6QW1MS2F4T2Rkamdra2k2?=
 =?utf-8?B?Yy9yRnhlVncyR1J4R3FEdXdrK0Y0VTEvcDZqOFpiMUJaM0N6N0VKR0NZaWZq?=
 =?utf-8?B?MXp4QU5NTWwrbWhTTHFndmF2UnJXQXBxL0FjQmJsUlJlaDlDMXNGTlhhanI4?=
 =?utf-8?B?WXRYVnBPUTJvMzBYVWR4a1FuM1FnTzg3RTBjc3pTYnRtRk4xS0NBeWpIQ1d0?=
 =?utf-8?B?Qy9pcmxxVU5BL1BGcDVSbGtpeW1xTDVOSEg5TlZXd0tpUUZnaFYwN1kzbFVU?=
 =?utf-8?B?ZkJPYXZPV2hpWm5yS1lXS0hNMGRxNnNaOFNGVC9WL0EweURqUDRhaG1HMC94?=
 =?utf-8?B?MUt1cVF0cS9vTmRIekNNSVNlWnRKNllJNENqWWk1Q3B5ZkUzRkttV0dMQVNK?=
 =?utf-8?B?VUxzR3ljMDZTSHJBbFhpVzl4SStBVDUzQXlQdHhnTndqdVFGYXhuYWI4dFVY?=
 =?utf-8?B?RHoxMlUxUWY4R29BRDFOZnRUOHJ5UlVidExIaUcwZ0VlNS9KQTFEcEhsQlpz?=
 =?utf-8?B?U1g4QStMYVpxS0JJbVNNM1lEY1FwQ1A1eCtlUllHTWxxcm1CUXFYUzk5Ykcy?=
 =?utf-8?B?RVFhOGRSTHlhcy9TYTJCUWtxdnl0UmNXM1RTVjJhYVpTUE1nQWtYdnl5ekJi?=
 =?utf-8?B?VHY5YlFYMjB1S0tuMGtGSk44Q2RpVmo2Zm5hMFdZZmY4WUlIR0RvRXpGUGkz?=
 =?utf-8?B?OXpsdTh1K2dWZlpHTlhZaTNtTk92U2ZaY3Q1ZS9BUnA0MW9TZUpZejgxVDAw?=
 =?utf-8?B?dEhaY2NmckJLNVQydHU0YU4zZUJrQXljWjFndGg0RmZPUHVxWitzNHhGYll5?=
 =?utf-8?B?cWhFbEg2R1N5eHBmTElwY3BpYWRnK1luN3Q1Sm02S2N4MzRVRVVsdnpuSFNK?=
 =?utf-8?B?eTZ3QWtOYjVuSS9CSmU0Q3FqYnp4SUZOYmpQcjd5RDQwOVAvV0JVU2xXSGVw?=
 =?utf-8?B?TnJMM0JJSWdiTFkwYWFTay9xVEx3NWRLcUtNZ3l2ZDlwbzFnQmVwRGhXY1RX?=
 =?utf-8?B?WVlqNFRWbWJqS2J4ZnczQXBJb3dzVFJLclFyeVhMODZBMGh4TkF3anJUaGN6?=
 =?utf-8?B?Wlg0bkRQZFBSNWE0M2ttZU4rSmE5UXp3OURmaVpEOEJWc05qcGJnUjZaem41?=
 =?utf-8?B?TDJMeVZoc0JySGUwVG9FbUtjZGY0ZmNUcDZUQ1h2OHJZUE5lYkxWV0tYNDlB?=
 =?utf-8?B?YU5UR25DMXJWb3VmTXg4bU96R0lFblorckg1QmxwRTF3WGQ4V2NFTy9ZaXky?=
 =?utf-8?B?VkJTZzFGUy8vUDBkODZPcTNheTRoQnpVK1dKaHRJWlI5RXIwK1MzcHlEci94?=
 =?utf-8?B?NHpPcGpXcllLRlM0RjNiamtxYlFxd0tnbnBUY2QwR1hYa2MxZE5rQjZuMDdL?=
 =?utf-8?B?YmQwTG1aZGxRMVJ1UVU4TjRIM0N3ZTlKNzJMWEszRm52MEd2bkdXc1VQM0hG?=
 =?utf-8?B?MzNzb3ZWd1ZOT3F3b1U3a0w2Q0tOdEJiWUFia0pqL3NsYXR6V3ZhNW1iQUdK?=
 =?utf-8?B?Mnh5ZHZqVkYvQkZoNEhGWnBpUHVSektwc1hPdXFEeEwwbERzTHFxdXpJamRP?=
 =?utf-8?B?UElGeGxRaVR4WEdtazJpR3ZNNTk1eFhoVERiUVp3VHZDN3BGSlRkZTBEb0lm?=
 =?utf-8?B?Vk9lSWZWaDZzc091Rm16RStiUk0waUlvb0V6ODVtN0R1UTA3a1lOalRSU3ZU?=
 =?utf-8?B?MnZISkFDRlFaK1N6NEpnLzFpdlJqZE0zQnpQaGFZSHJKSktMcTR5VkduOWtO?=
 =?utf-8?B?TXBSQlI0d0tYZVljYVk2Y3YwQ2w3aWJkU1lYaTJqYmVSUm40dUVVd2twMjRH?=
 =?utf-8?B?djhMT3NvOHl2elVDaFlidDE4SlIvY3RCaENySkhPZ2lwVHRVQm9DejJkTmZy?=
 =?utf-8?B?c2p5T1o0aGFsaHdMcnNjVEZ0bUxDZXpwbmh6UmVKM3U1YjBqRzFpeG8zRXFD?=
 =?utf-8?B?OTB5aDc0UHJOUThsN284dy9BNEdLbzhoT1lLQlJreU1yS0RGS2dDaHJiVGdk?=
 =?utf-8?B?WnlkcEZlbFdCWUJMeUVGdCtyc2Uya1RZWFE1N0d6R3ZFZmJnWjQ2MTFyVGJB?=
 =?utf-8?B?L3owSWNuYTZtT1lRd29jMjhBb1FCR1ZPVnQ1RmhFNHBxQUhRTFpqYTVvN2V2?=
 =?utf-8?B?WklkU2tBcnlJRVhLdXhOZGZ5SXJVS2NXOWZtekhvQlByeitTV0hzVnN6TFFv?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54F1D749FA426C4F8BC60C9B6D943841@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd05e643-d010-45bb-13a5-08ddff72df41
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 16:11:39.3270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W9myFgwmj5gUEWW5teLxbU9kwz2oCP1lJPsnd2WYeLLroEkwdCGhHAnfDVHjsQK6w9dWiqDC3giQfQjMBuMNTPekUBtGVCtptbn9e33CIT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
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

T24gVGh1LCAyMDI1LTA5LTI1IGF0IDExOjQ4IC0wNDAwLCBaaGFuanVuIERvbmcgd3JvdGU6Cj4g
VXBkYXRlIEd1QyBsb2cgYnVmZmVyIHR5cGUgdmFsdWUsIHRvIGFsaWduIHdpdGggdGhlIEd1Qwo+
IHNwZWNpZmljYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25nIDx6aGFuanVu
LmRvbmdAaW50ZWwuY29tPgo+IC0tLQo+IENoYW5nZSBsaXN0Ogo+IHYzOiBVcGRhdGUgY29tbWVu
dHMKPiB2MjogVXNlIFNaXzRLLCBpbnN0ZWFkIG9mIFBBR0VfU0laRQo+IMKgwqDCoCBFeHBhbmQg
Zm9yIGxvb3Agd2l0aCBzd2l0Y2ggYW5kIGZhbGx0aHJvdWdoCj4gLS0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUvYWJpL2d1Y19sb2dfYWJpLmggfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfbG9nLmPCoMKgwqDCoMKgIHwgMjQgKysrKysrKysrKysrKystLS0tLS0tLS0tCj4g
wqAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvYWJpL2d1Y19sb2dfYWJpLmgKPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xvZ19hYmkuaAo+IGluZGV4IDU1NDYzMGI3Y2NkOS4u
YjE4MTk2NzlmYTM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xv
Z19hYmkuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2xvZ19hYmkuaAo+IEBA
IC0xMCw4ICsxMCw4IEBACj4gwqAKPiDCoC8qIEd1QyBsb2dnaW5nIGJ1ZmZlciB0eXBlcyAqLwo+
IMKgZW51bSBndWNfbG9nX2J1ZmZlcl90eXBlIHsKPiAtwqDCoMKgwqDCoMKgwqBHVUNfTE9HX0JV
RkZFUl9DUkFTSF9EVU1QLAo+IMKgwqDCoMKgwqDCoMKgwqBHVUNfTE9HX0JVRkZFUl9ERUJVRywK
PiArwqDCoMKgwqDCoMKgwqBHVUNfTE9HX0JVRkZFUl9DUkFTSF9EVU1QLAoKTG9va3MgZ29vZCAt
IHZlcmlmaWVkIHRoaXMgbWF0Y2hlcyB0aGUgc3BlYy4KCj4gwqDCoMKgwqDCoMKgwqDCoEdVQ19M
T0dfQlVGRkVSX0NBUFRVUkUsCj4gwqB9Owo+IMKgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfbG9nLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nLmMK
PiBpbmRleCBjMDFjY2IzNWRjNzUuLjkwMTdhYmYxMTJiZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2xvZy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19sb2cuYwo+IEBAIC01MCwxNSArNTAsMTUgQEAgc3RhdGljIHNpemVfdCBndWNfbG9nX3NpemUo
dm9pZCkKPiDCoMKgwqDCoMKgwqDCoMKgICrCoCB8wqDCoMKgwqAgQ2FwdHVyZSBzdGF0ZSBoZWFk
ZXLCoMKgwqDCoMKgIHwKPiDCoMKgwqDCoMKgwqDCoMKgICrCoCArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsgOTZCCj4gwqDCoMKgwqDCoMKgwqDCoCAqwqAgfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gLcKgwqDC
oMKgwqDCoMKgICrCoCArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSsgUEFHRV9TSVpF
ICg0S0IpCj4gLcKgwqDCoMKgwqDCoMKgICrCoCB8wqDCoMKgwqDCoMKgwqAgQ3Jhc2ggRHVtcCBs
b2dzwqDCoMKgwqDCoMKgwqAgfAo+IC3CoMKgwqDCoMKgwqDCoCAqwqAgKz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0rICsgQ1JBU0hfU0laRQo+ICvCoMKgwqDCoMKgwqDCoCAqwqAgKz09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0rIDRLQgo+IMKgwqDCoMKgwqDCoMKgwqAgKsKg
IHzCoMKgwqDCoMKgwqDCoMKgwqAgRGVidWcgbG9nc8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiDC
oMKgwqDCoMKgwqDCoMKgICrCoCArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSsgKyBE
RUJVR19TSVpFCj4gK8KgwqDCoMKgwqDCoMKgICrCoCB8wqDCoMKgwqDCoMKgwqAgQ3Jhc2ggRHVt
cCBsb2dzwqDCoMKgwqDCoMKgwqAgfAo+ICvCoMKgwqDCoMKgwqDCoCAqwqAgKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0rICsgQ1JBU0hfU0laRQo+IMKgwqDCoMKgwqDCoMKgwqAgKsKg
IHzCoMKgwqDCoMKgwqDCoMKgIENhcHR1cmUgbG9nc8KgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gwqDC
oMKgwqDCoMKgwqDCoCAqwqAgKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0rICsgQ0FQ
VFVSRV9TSVpFCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiBQ
QUdFX1NJWkUgKyBDUkFTSF9CVUZGRVJfU0laRSArIERFQlVHX0JVRkZFUl9TSVpFICsKPiArwqDC
oMKgwqDCoMKgwqByZXR1cm4gU1pfNEsgKyBERUJVR19CVUZGRVJfU0laRSArIENSQVNIX0JVRkZF
Ul9TSVpFICsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoENBUFRVUkVfQlVGRkVS
X1NJWkU7Cj4gwqB9Cj4gwqAKPiBAQCAtMzI3LDEzICszMjcsMTcgQEAgdTMyIHhlX2d1Y19nZXRf
bG9nX2J1ZmZlcl9zaXplKHN0cnVjdAo+IHhlX2d1Y19sb2cgKmxvZywgZW51bSBndWNfbG9nX2J1
ZmZlcl90eXBlCj4gwqAgKi8KPiDCoHUzMiB4ZV9ndWNfZ2V0X2xvZ19idWZmZXJfb2Zmc2V0KHN0
cnVjdCB4ZV9ndWNfbG9nICpsb2csIGVudW0KPiBndWNfbG9nX2J1ZmZlcl90eXBlIHR5cGUpCj4g
wqB7Cj4gLcKgwqDCoMKgwqDCoMKgZW51bSBndWNfbG9nX2J1ZmZlcl90eXBlIGk7Cj4gLcKgwqDC
oMKgwqDCoMKgdTMyIG9mZnNldCA9IFBBR0VfU0laRTsvKiBmb3IgdGhlIGxvZ19idWZmZXJfc3Rh
dGVzICovCj4gK8KgwqDCoMKgwqDCoMKgdTMyIG9mZnNldCA9IFNaXzRLOyAvKiAxc3Qgc2VjdGlv
biBzaXplICovCgpBZ3JlZWQuCgo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgZm9yIChpID0gR1VDX0xP
R19CVUZGRVJfQ1JBU0hfRFVNUDsgaSA8Cj4gR1VDX0xPR19CVUZGRVJfVFlQRV9NQVg7ICsraSkg
ewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoaSA9PSB0eXBlKQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9mZnNldCArPSB4ZV9ndWNfZ2V0X2xvZ19idWZmZXJf
c2l6ZShsb2csIGkpOwo+ICvCoMKgwqDCoMKgwqDCoHN3aXRjaCAodHlwZSkgewo+ICvCoMKgwqDC
oMKgwqDCoGNhc2UgR1VDX0xPR19CVUZGRVJfQ0FQVFVSRToKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgb2Zmc2V0ICs9IHhlX2d1Y19nZXRfbG9nX2J1ZmZlcl9zaXplKGxvZywKPiBH
VUNfTE9HX0JVRkZFUl9DUkFTSF9EVU1QKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZmFsbHRocm91Z2g7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBHVUNfTE9HX0JVRkZFUl9DUkFT
SF9EVU1QOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvZmZzZXQgKz0geGVfZ3Vj
X2dldF9sb2dfYnVmZmVyX3NpemUobG9nLAo+IEdVQ19MT0dfQlVGRkVSX0RFQlVHKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZmFsbHRocm91Z2g7Cj4gK8KgwqDCoMKgwqDCoMKg
Y2FzZSBHVUNfTE9HX0JVRkZFUl9ERUJVRzoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYnJlYWs7CgpUYWtlIGEgcXVpY2sgbG9vayBhdCB0aGUgQ0kgcmVzdWx0IGJlZm9yZSBtZXJn
aW5nLCBidXQgb3RoZXJ3aXNlIHRoZXNlCmNoYW5nZXMgbG9vayBnb29kOgpSZXZpZXdlZC1ieTog
U3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KCj4gwqDCoMKgwqDCoMKg
wqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gb2Zmc2V0OwoK
