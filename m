Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1414AC5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 12:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADB510E547;
	Tue, 10 Jun 2025 12:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSRC/NN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3351510E547
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749560346; x=1781096346;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5s6pjhtM2Rm8elJmps3FtrJvMinecsoXQF9L0OIZMMA=;
 b=cSRC/NN49qylz/cenHgDwhgo/oJqWNboh+xvJPQapWEgv1vN2vwuMdUd
 ydMXgBz3cLtZrWWGkaVrZQRYw8z8vMK3qNY1hOKEsDdrgml8xHuM6M/z3
 1StnmyNsHjFXJGcP4K2p6EfacBSiQOc/2a3UM5g1d5726z34IHbbbAdX1
 hAUTf5pJa90tDLmkq80kdiLA0ug29o1TmhVIBwx2YkMeDY1XgBJQf3+Sz
 Kdy+/Gtq0NaqbRcFgajXp6gKfX5lEAaVrit0Mwx8LMj/1I3Nl011ppUSM
 HF8VcN1yYjHTDf7tJIlUdCPN1n9VJfADDIoeph2fsKA4Kc2ulHwjLyuaN A==;
X-CSE-ConnectionGUID: 9XvKSMfIRKmKq939IzCjrQ==
X-CSE-MsgGUID: 1wOmYf1cRKeT6zVt3gZnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="39286062"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="39286062"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 05:59:05 -0700
X-CSE-ConnectionGUID: SFishxZzTAS0QzYcNCyeSQ==
X-CSE-MsgGUID: ypyEImwsQHmahtEgyHaVJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="150666478"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 05:59:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 05:59:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 05:59:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.68)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 05:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLE6NMnPQwnCQ/KAgRntgc9YPnC4yUiE/wCT5X3g439YGKOVH8QSAmz9j6Z4mCDEgyfomhCIylgmaNYbW2TPrJmXONBInH20uO7Id2awwfq+OdV4eb/tlzkQTLswPLXTtNi6gvNVh7QGVu6KgNJ6BniJU3vWowmxL65HWLhclUYm75WHosAK0py6nXEVgVGExWRupwk7bysisUFH2Symd0c5l5HdyMay6nk0gxAnvDKto7GXMDyUDe7GPP7xZHCEUntajr7+dn/psK3+0OXCxJy1ErK+1UQV/E/q1mPz9OW/p0hrKdgOm+RKeAGnAYtTOvnxqdTUFlfvdIYFIu4A9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5s6pjhtM2Rm8elJmps3FtrJvMinecsoXQF9L0OIZMMA=;
 b=sqsbsUDloNdnnpxbwShzDh8+OJduuZP0wesEq76eyQ0ZUeSWAkC9VXYl5lqwxgICcfAoabnFjllpa3FYGnLKbL4OiNs9b4tEVDFI1HjgFpIY2qAAW4eP54gUDdn8FJlU9/xqhiU4J0C24b101+X9TUCLP/tp/OMjft8TeFPquifnlS1eBnHacrZDQNnL8lNL3w2Bzw1wG6xFZuBsoSTYPUXnzgaIuHcPOyGQz8Xbek5unIrvFa0oydgE4y32xG+ms3LvPXRMr4uwnu5oMplHFyF/Gys5Z3wHGYuGR37QnqxX4TBo7YnUreCaFu/l0TKLjJcG6aK7FQSbJbu7DSoJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS4PPF399DBF572.namprd11.prod.outlook.com (2603:10b6:f:fc02::1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 10 Jun
 2025 12:58:59 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 12:58:59 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk, Konstantin"
 <konstantin.sinyuk@intel.com>, "Avizrat, Yaron" <yaron.avizrat@intel.com>,
 "Haimovski, Moti" <moti.haimovski@intel.com>, "Freiman, Didi"
 <didi.freiman@intel.com>
Subject: RE: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Thread-Topic: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Thread-Index: AQHb2SVLujqcDk+u/E+Zym8zlU5c4LP630AwgAFFWgCAADb3oA==
Date: Tue, 10 Jun 2025 12:58:59 +0000
Message-ID: <SJ1PR11MB620443CA7F483CE7F4995250816AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <SJ1PR11MB6204EF8ECD2EAE0F8F5AB93C816BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <47547e84-4d10-4037-9f9b-d1b02fa3fbac@intel.com>
In-Reply-To: <47547e84-4d10-4037-9f9b-d1b02fa3fbac@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS4PPF399DBF572:EE_
x-ms-office365-filtering-correlation-id: 48a66a4a-66c8-41cb-b8fd-08dda81e9114
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eExSY2RuK29vcERJdXVWb2QxTWQyZWpTMmN4ZUhxM1BLZDlqOWliS3lOYTQ3?=
 =?utf-8?B?eDJiQlM5bW9Fbkl6WHR1QzB6eU8yVm1QT3V6c2I4RmhDQVd0RjQyK0FVcHlL?=
 =?utf-8?B?MTQxb1BzRFZvWU9iS243cHJoSlNaWHl3SlFsbkVRY0FyZFBLUDBlSkhsU0NJ?=
 =?utf-8?B?MWJ3dXRqbkttR3l2c2NCT0prTW1GRmlNS3o0OWMzUTk5elBtNWt4SnlhekhB?=
 =?utf-8?B?bkpNanI4dHdsZ211Ulpob2dVNHRsbVFNTTJTeHZWVlV6V1M2MVFDY2R1QVpk?=
 =?utf-8?B?RTVTdTVGdGI1NGpQUk5nUWFRUjBYcFE2akpwUkNDREZrWTg4aDJoT2lSNnFB?=
 =?utf-8?B?aGJBRTM4dUx3Z1NteXZNbFpIK2hJUEk1b0s2a0NLY3pUai92Y1cwUlZJb3Zk?=
 =?utf-8?B?dkNkSnVDcFpaZXQrY2M4SU9ycXpyVm96emU2Ny9XNnRtTnF6T0diUEQzemIy?=
 =?utf-8?B?Q21vT09zcmpRWndHMFRJdDlDK2FtVE52cXVKM09qeTllTnBycnJVdmJhYnNo?=
 =?utf-8?B?UW9hMjI4L2R0ZUdnU09CV25GSXZXemJLUXhCbG1XWmhMcENzSUhzVkhSS2w1?=
 =?utf-8?B?YlBJQjR2T1lXRHFwMzF1RlNwMWhrMUpMeFdYWjZuTHNYcEI3ckZEb2MxZ01k?=
 =?utf-8?B?T3YrUEYrdFBtdEtRemovZ2JKTkd0dTRmb3NTeHNGeVdwS29rY0lja01ReFhv?=
 =?utf-8?B?OW4xMkVYWUlCYzN1MnNSUGNvbDF2MkE5cDc2bHFZdXJYZEMwTndINEFaNjRD?=
 =?utf-8?B?ODZVT2ZlcFdRQlFidjh3K2UzVEY0ZU5lTXRLM2pHWS8vK1ZOTXlnMVlrZmc2?=
 =?utf-8?B?N21FVlZET09QWTlxeWR1TlYyUzVoYUJ0NFNxa1BKTFpCaitwb0NhK3pXaVhS?=
 =?utf-8?B?d3lQR01uajJLNWJnYVJpTlpMU2FQTVFBaDE1bnNaTzh0T3pKeTJRS2ZHd3FG?=
 =?utf-8?B?WGI3ZzBMYVVJUk42UXN5ZEZDK3YrMHpycG9iUUNyWWxPQTh1dEpMTGVkYzJC?=
 =?utf-8?B?VEhGT3VwSnFWZzZrTno3QTNyc1FZNmxhVEYvQTdjMm9kWlJjaWQzSWRDMEQ0?=
 =?utf-8?B?V0szZXRMei95Q3ZNMkFscEhzRDQ3ZEhkc2dhNFlFclBHY1lGa1l6ZjY0RUs4?=
 =?utf-8?B?bFpybllRS0F0c3EzNEdPNjJZQmFTbDJtMTRxTkx2NTFvK25Qc1NrYzlESHF1?=
 =?utf-8?B?eFl1aUJmRUkrdCsrS3hpd0tMbEVoUVFFS1hTMTNLQnd6OWU1cDlkV0k2ajFi?=
 =?utf-8?B?d2VkZXEvVTRVbDZ4REZ0cHRILzZTWG1zS1BYWnJ5NjBjd09ZWGI3bGptTTBh?=
 =?utf-8?B?MkxhaG9Ha0RSQXRWL0w1KzRUcGJHS1g3WE95ZklpYXVOM0pWOXhKK01vWnJa?=
 =?utf-8?B?RG9DL1lGTnl0S2VDMWhMQm4xWksyZE1NSGR4RVlVcEZIRXg0K1MxTkZmb1FG?=
 =?utf-8?B?WjdYdDZ4dW54UGVYRTVYdU15LzRGL2pBWUZlOVlqMU1Vdm1wcUNhVUJDcFFB?=
 =?utf-8?B?WEhjbkdXL05FQ3I2VUZBSFRtbHNuT05mb1NYNkk5SkxyblhwSWNNRmdWV0NJ?=
 =?utf-8?B?cVdPZzArZWdOWW9WdTNUOVVOZ2diZCsxTmRNcVJ2WmloN0ozRzkrVGZ2WUsv?=
 =?utf-8?B?VnFDbnNwRVhNZHYxSEg4OGZVcjlTL0NoaWxQbjJ0UFluQ2xFVkhsbElnV3N2?=
 =?utf-8?B?SVNpaVpMdm9RUXlJQy9wKzhld0RmREpRY1dQelhvVFFNcFNsTE5EbSs5SENM?=
 =?utf-8?B?Q2V4UEtrdHNzNHlxbThGelRIdmRkQzRjcXc0TG5jMkVXYWViSVRqVlNNTXZS?=
 =?utf-8?B?NTBJQmt2OHNxUkxoR3I3ZTRMY2tMNTcxWE50UDlzQmtLbHBPSE1Zelp1WHFo?=
 =?utf-8?B?MGdiUjE5ek1XdTFIalZNbDQ4RDh5YnViMDVkYktBL1V2b3NNc01rTzkybmUv?=
 =?utf-8?B?UElBMWh5WUlVMUYrZUdjRjZMR3Ztd0p6dXhnWWM2ZWU2dDlxaXhWQndiUXZC?=
 =?utf-8?Q?qm4Uim4E08NVv7gFnfXMUCrA+17xzY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FQdHVmYnV0SzhEejJlbjFEUG5UamJGZ0I1a01hZmtjWUZ6Vms5cVBCSXRZ?=
 =?utf-8?B?YVRUK1djaXZ6UGpRWnBUVnJLNFBFeHU5SWtkT2xMQUZodW40dHQzOXhGUlBD?=
 =?utf-8?B?bGJMQU1NSlIvbm5IZWNuZUdNaXVoZkgvMW1KNGdUbUo0dVEyZVk4UW8zQ2lr?=
 =?utf-8?B?NytUOE8wQysxUHZNQW95ZXNGTHR3aU44NlRkcERENWdkTUMzcXB0bys5VTNV?=
 =?utf-8?B?d3VXZTU3Tk0zUWwxaUcvUmdCZUNMWVU2WS9valZLekgvNnNrVllhZ2tIcEdT?=
 =?utf-8?B?UGo0QVByLytmcEQwdnk4a3JXcUxONExBaklDLzR3eUk5YTBvT3draE0vQk1j?=
 =?utf-8?B?MTNvWFRNanp0cVdoa2J3aDc4bnlYaUJnY1dEbEp2eHBPckdaVzZZOS9zTG1h?=
 =?utf-8?B?UmE2QTRvYkc2YTR4N284a0NRM2hYemUwcGxrbUp3MkU1bzZ2R0hGcnAyb2h3?=
 =?utf-8?B?WFZiQWh2MEJ5QWtyWkNEYnRBTUJxZkhzY2ljYnM3bWpIYUFZclc2TWVmY2tz?=
 =?utf-8?B?bkxDMnZoUkhGajZCbndWa0Jad2RUbGhVMnFldlBXdTVVTjhvaWo5OE8yQVF3?=
 =?utf-8?B?RWc5S2dTWm1oZWJrd3kwbGEybGdHcGM1bWxjTVUvbEdyYlE5WGJFdDROUnhm?=
 =?utf-8?B?MmNCTVlGUytDSHNMcWdqTUZOLzNucFBJL3hKOHl6Q3dVL3hTZUdaTERaLzRx?=
 =?utf-8?B?NXN3bERtMWJjT0gyMTRWekRiT1dObzNDa0w4MlpGVE5xOW8vVVBOUGpSaEc2?=
 =?utf-8?B?QkVkblYvWE5ERjNvblZ4NHhJOVFXc0djdmk2c0RSeWk2eU1xOW9XZ09LMlRk?=
 =?utf-8?B?SGZRRGd0L3JvNEQ2UmoveVhqR3Njd3NhTURCOGpFMEE2Nlp0RTFQZjFocU1L?=
 =?utf-8?B?ZFY3WmRmVDRUVTAvaW9nNk5WU1FXeThtbldzODBYVnAyVkFtQWt6b2M5c3d2?=
 =?utf-8?B?NlNXQ3RjZ1JhOTJlRVBnV1pvOWFVdG8rMzc1YW5PTzFiNEpjS1M4SWpUVEJI?=
 =?utf-8?B?dml4bUJyMTA0QnZVeUhvQ3lSUjk3QWZueEhjV05TTVU0cExVZnF4U0FiSFhv?=
 =?utf-8?B?dVRNRWRlS0VmUmR6RnRRSDJkaU9jTitEQUxKQmpFSFoyWXl3ZnNnOEpqdEV0?=
 =?utf-8?B?cE5HQTNlSEhFNHN6dC9hcGI0U0RCb1hUbGp0MzEyVjU3ZnZnZ0hLdWoxYmpR?=
 =?utf-8?B?SlJLbWxJZFhMNEFxYkNXc245VjkxVTFlVnN5bEJZTlA1K2RKMGtFZU5XcGJT?=
 =?utf-8?B?VjU1djUzK3AxZzJFZXI0ZDJzUXc3K0pvTmxoOWg4Q3RCU0JiUzg5bkJtQjBh?=
 =?utf-8?B?TXVLclJLQ2ptYVNxR3JsTitvSEd5NlVMNzJHUVh0WFBJVlNnZks3WE5kSWs2?=
 =?utf-8?B?U2N2M3RsWldQZUw3bkRYVzh3VktNbnlrbFArNVNidmkrMnVzVkVQcit5ZDAw?=
 =?utf-8?B?ZGtEYWRxZWNQNDZqZGM4ejFWWC95VEZQMTBqL3YwQ3h3RVR3dXFOQUtCWUhz?=
 =?utf-8?B?OU1BZVhxNnNhYnZucExTWHNYT1REVlBFQzRZQ2ZqWFo2cms2d1BkUUIvbFlV?=
 =?utf-8?B?MWhURE1VQ2srRkJ4elo1RDBqQTNza29RVkNzMWRYQlJkUmNDaks0RGppV0hD?=
 =?utf-8?B?d0FHWUVFY1FpelYrTzVKWWM5SVhmUlBtOFlNQXkxNG5GVk1FV0dMY2k3SUFN?=
 =?utf-8?B?TGhiRytLVitMOHEzbjAxRUZZcnVxTkVmSVludHZ1dEJ0eFc5cjJ2T0NoRk84?=
 =?utf-8?B?dlMxbDhJdlIyVnoxWk1BVEg4REg5TWwvNHNmZmoyS1VMeEIvOXI0YmhGVDR5?=
 =?utf-8?B?ZGRPdFRTYU5tSVU4VXNmTGlOZ2JiNi9IODBSRzlqSGZqM2hkTEh6UklKaGth?=
 =?utf-8?B?Z05ZWlBhZnRvSU85MkprS0p3cXl2bVRpQWhaaSsrVGplS3JEdHAzeVJPZysv?=
 =?utf-8?B?aDJobCtNWjBqKzNGVFRSbGE2cTNXZHFhWDhhM2tqVlZNMjVITGxmZFJyd1BG?=
 =?utf-8?B?dEFoTEpEME1sd3l2eEd1RTZiK0V0VGVrRTZyNGRRZXY1VXc5ZjdYM2wxajVU?=
 =?utf-8?B?bFo5eUoyeTB6M2NYZlNNdk9OK3VweXo3Z29aTnV2THhNRjVzOHlWVFdLM2d0?=
 =?utf-8?Q?jb1kPaWh2Q+t0KWEoO1MJ4ljb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a66a4a-66c8-41cb-b8fd-08dda81e9114
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 12:58:59.2915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: InQ31uoqRQ9nJcU19A/7zImW/Pt59KdSfUwfM6Cc9l0H8AMP7KK8MH4EQXKDh29IvALkRZBfgvg2M7mbv77Fy0tjGCX2juVKsOtppC+NmEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF399DBF572
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGV2aSwgSWxpYSA8aWxp
YS5sZXZpQGludGVsLmNvbT4NCj4gU2VudDogMTAgSnVuZSAyMDI1IDE1OjA5DQo+IFRvOiBVcGFk
aHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEVsYmF6LCBLb2J5IDxrb2J5LmVsYmF6QGludGVsLmNv
bT47IFNpbnl1aywgS29uc3RhbnRpbg0KPiA8a29uc3RhbnRpbi5zaW55dWtAaW50ZWwuY29tPjsg
QXZpenJhdCwgWWFyb24gPHlhcm9uLmF2aXpyYXRAaW50ZWwuY29tPjsNCj4gSGFpbW92c2tpLCBN
b3RpIDxtb3RpLmhhaW1vdnNraUBpbnRlbC5jb20+OyBGcmVpbWFuLCBEaWRpDQo+IDxkaWRpLmZy
ZWltYW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm0veGU6IFN1cHBv
cnQgZm9yIG1tYXAtaW5nIG1taW8gcmVnaW9ucw0KPiANCj4gT24gMDkvMDYvMjAyNSAxNzoyMCwg
VXBhZGh5YXksIFRlamFzIHdyb3RlOg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4+IElsaWEgTGV2aQ0KPiA+PiBTZW50OiAwOSBKdW5l
IDIwMjUgMTU6MzANCj4gPj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+
PiBDYzogTGV2aSwgSWxpYSA8aWxpYS5sZXZpQGludGVsLmNvbT47IEVsYmF6LCBLb2J5DQo+ID4+
IDxrb2J5LmVsYmF6QGludGVsLmNvbT47IFNpbnl1aywgS29uc3RhbnRpbg0KPiA+PiA8a29uc3Rh
bnRpbi5zaW55dWtAaW50ZWwuY29tPjsgQXZpenJhdCwgWWFyb24NCj4gPj4gPHlhcm9uLmF2aXpy
YXRAaW50ZWwuY29tPjsgSGFpbW92c2tpLCBNb3RpDQo+ID4+IDxtb3RpLmhhaW1vdnNraUBpbnRl
bC5jb20+OyBGcmVpbWFuLCBEaWRpIDxkaWRpLmZyZWltYW5AaW50ZWwuY29tPg0KPiA+PiBTdWJq
ZWN0OiBbUEFUQ0ggdjJdIGRybS94ZTogU3VwcG9ydCBmb3IgbW1hcC1pbmcgbW1pbyByZWdpb25z
DQo+ID4+DQo+ID4+IEFsbG93IHRoZSBkcml2ZXIgdG8gZXhwb3NlIGhhcmR3YXJlIHJlZ2lzdGVy
IHNwYWNlcyB0byB1c2Vyc3BhY2UNCj4gPj4gdGhyb3VnaCBHRU0gb2JqZWN0cyB3aXRoIGZha2Ug
bW1hcCBvZmZzZXRzLiBUaGlzIGNhbiBiZSB1c2VmdWwgZm9yDQo+ID4+IHVzZXJzcGFjZS0gZmly
bXdhcmUgY29tbXVuaWNhdGlvbiwgZGVidWdnaW5nLCBldGMuDQo+ID4+DQo+ID4+IHYyOiBNaW5v
ciBkb2MgZml4IChDSSkNCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogSWxpYSBMZXZpIDxpbGlh
LmxldmlAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2VfdHlwZXMuaCB8ICAxNCArKysNCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlv
LmMgICAgICAgICB8IDE0Mg0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmggICAgICAgICB8ICAgNCArDQo+ID4+ICAzIGZpbGVz
IGNoYW5nZWQsIDE2MCBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPj4gaW5kZXggYWMyNzM4OWNjYjhiLi43ODU0MmRlMGQ0
OGQgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMu
aA0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPj4g
QEAgLTEwLDYgKzEwLDcgQEANCj4gPj4NCj4gPj4gICNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5o
Pg0KPiA+PiAgI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPg0KPiA+PiArI2luY2x1ZGUgPGRybS9k
cm1fZ2VtLmg+DQo+ID4+ICAjaW5jbHVkZSA8ZHJtL2RybV9wYWdlbWFwLmg+DQo+ID4+ICAjaW5j
bHVkZSA8ZHJtL3R0bS90dG1fZGV2aWNlLmg+DQo+ID4+DQo+ID4+IEBAIC0xNjEsNiArMTYyLDE5
IEBAIHN0cnVjdCB4ZV9tbWlvIHsNCj4gPj4gIAl1MzIgYWRqX29mZnNldDsNCj4gPj4gIH07DQo+
ID4+DQo+ID4+ICsvKioNCj4gPj4gKyAqIHN0cnVjdCB4ZV9tbWlvX2dlbSAtIEdFTSB3cmFwcGVy
IGZvciB4ZV9tbWlvDQo+ID4+ICsgKg0KPiA+PiArICogQSBHRU0gb2JqZWN0IGZvciBleHBvc2lu
ZyB4ZV9tbWlvIGluc3RhbmNlIHRvIHVzZXJzcGFjZSB2aWEgbW1hcC4NCj4gPj4gKyAqLw0KPiA+
PiArc3RydWN0IHhlX21taW9fZ2VtIHsNCj4gPj4gKwkvKiogQGJhc2U6IEdFTSBvYmplY3QgYmFz
ZSAqLw0KPiA+PiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdCBiYXNlOw0KPiA+PiArDQo+ID4+ICsJ
LyoqIEBtbWlvOiBUaGUgTU1JTyByZWdpb24gdG8gZXhwb3NlICovDQo+ID4+ICsJc3RydWN0IHhl
X21taW8gbW1pbzsNCj4gPj4gK307DQo+ID4+ICsNCj4gPj4gIC8qKg0KPiA+PiAgICogc3RydWN0
IHhlX3RpbGUgLSBoYXJkd2FyZSB0aWxlIHN0cnVjdHVyZQ0KPiA+PiAgICoNCj4gPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbW1pby5jIGluZGV4IDczNTc0NThiYzBkMi4uNmJmYTkxNWE5NjAyDQo+ID4+IDEw
MDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5jDQo+ID4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMNCj4gPj4gQEAgLTQwOCwzICs0MDgsMTQ1IEBA
IGludCB4ZV9tbWlvX3dhaXQzMl9ub3Qoc3RydWN0IHhlX21taW8NCj4gKm1taW8sDQo+ID4+IHN0
cnVjdCB4ZV9yZWcgcmVnLCB1MzIgbWFzaywgdTMyIHZhICB7DQo+ID4+ICAJcmV0dXJuIF9feGVf
bW1pb193YWl0MzIobW1pbywgcmVnLCBtYXNrLCB2YWwsIHRpbWVvdXRfdXMsIG91dF92YWwsDQo+
ID4+IGF0b21pYywgZmFsc2UpOyAgfQ0KPiA+PiArDQo+ID4+ICsvKioNCj4gPj4gKyAqIERPQzog
RXhwb3NpbmcgTU1JTyByZWdpb25zIHRvIHVzZXJzcGFjZQ0KPiA+PiArICoNCj4gPj4gKyAqIElu
IGNlcnRhaW4gY2FzZXMsIHRoZSBkcml2ZXIgbWF5IGFsbG93IHVzZXJzcGFjZSB0byBtbWFwIGEN
Cj4gPj4gK3BvcnRpb24gb2YgdGhlDQo+ID4+IGhhcmR3YXJlIHJlZ2lzdGVycy4NCj4gPj4gKyAq
DQo+ID4+ICsgKiBUaGlzIGNhbiBiZSBkb25lIGFzIGZvbGxvd3M6DQo+ID4+ICsgKiAxLiBEZWZp
bmUgYW4geGVfbW1pbyBpbnN0YW5jZSB0aGF0IHJlcHJlc2VudHMgdGhpcyBwb3J0aW9uLg0KPiA+
PiArICogMi4gQ2FsbCB4ZV9tbWlvX2dlbV9jcmVhdGUoKSB0byBjcmVhdGUgYSBHRU0gb2JqZWN0
IHdpdGggYW4NCj4gPj4gKyBtbWFwLWFibGUNCj4gPj4gZmFrZSBvZmZzZXQuDQo+ID4+ICsgKiAz
LiBVc2UgZHJtX3ZtYV9ub2RlX29mZnNldF9hZGRyKCkgb24gdGhlIGNyZWF0ZWQgR0VNIG9iamVj
dCB0bw0KPiA+PiByZXRyaWV2ZSB0aGUgZmFrZSBvZmZzZXQuDQo+ID4+ICsgKiA0LiBQcm92aWRl
IHRoZSBmYWtlIG9mZnNldCB0byB1c2Vyc3BhY2UuDQo+ID4+ICsgKiA1LiBVc2Vyc3BhY2UgY2Fu
IGNhbGwgbW1hcCB3aXRoIHRoZSBmYWtlIG9mZnNldC4gVGhlIGxlbmd0aA0KPiA+PiArIHByb3Zp
ZGVkIHRvDQo+ID4+IG1tYXANCj4gPj4gKyAqICAgIG11c3QgbWF0Y2ggdGhlIHNpemUgb2YgdGhl
IHhlX21taW8gaW5zdGFuY2UuDQo+ID4+ICsgKiA2LiBXaGVuIHRoZSByZWdpb24gaXMgbm8gbG9u
Z2VyIG5lZWRlZCwgY2FsbA0KPiA+PiArIHhlX21taW9fZ2VtX2Rlc3Ryb3koKSB0bw0KPiA+PiBy
ZWxlYXNlIHRoZSBHRU0gb2JqZWN0Lg0KPiA+PiArICoNCj4gPj4gKyAqIExpbWl0YXRpb25zOiBU
aGUgZXhwb3NlZCB4ZV9tbWlvIG11c3QgYmUgcGFnZS1hbGlnbmVkIHdpdGgNCj4gPj4gKyByZWdh
cmRzIHRvDQo+ID4+IGl0cyBCQVIgb2Zmc2V0IGFuZCBzaXplLg0KPiA+PiArICoNCj4gPj4gKyAq
IFdBUk5JTkc6IEV4cG9zaW5nIE1NSU8gcmVnaW9ucyB0byB1c2Vyc3BhY2UgY2FuIGhhdmUgc2Vj
dXJpdHkgYW5kDQo+ID4+IHN0YWJpbGl0eSBpbXBsaWNhdGlvbnMuDQo+ID4+ICsgKiBNYWtlIHN1
cmUgbm90IHRvIGV4cG9zZSBhbnkgc2Vuc2l0aXZlIHJlZ2lzdGVycy4NCj4gPj4gKyAqLw0KPiA+
PiArDQo+ID4+ICtzdGF0aWMgdm9pZCB4ZV9tbWlvX2dlbV9mcmVlKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqKTsgc3RhdGljIGludA0KPiA+PiAreGVfbW1pb19nZW1fbW1hcChzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKiwgc3RydWN0IHZtX2FyZWFfc3RydWN0DQo+ICopOw0KPiA+PiArDQo+ID4+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHZtX29wcyA9IHsNCj4gPj4g
Kwkub3BlbiA9IGRybV9nZW1fdm1fb3BlbiwNCj4gPj4gKwkuY2xvc2UgPSBkcm1fZ2VtX3ZtX2Ns
b3NlLA0KPiA+IFNob3VsZCB5b3UgcmVtYXAgaW4gZmF1bHQgaGFuZGxlciwgdG8gbWFrZSBzdXJl
IG1hcHBpbmcgaXMgdGhlcmUgYWx3YXlzPw0KPiANCj4gDQo+IEhtbSwgZG8geW91IHNlZSBhbnkg
YmVuZWZpdCBmb3IgbGF6eSBtYXBwaW5nIGhlcmU/DQo+IFdoZW4gYSB1c2VyIG1hcHMgSFcgcmVn
aXN0ZXJzIChwcmVzdW1hYmx5IGEgcGFnZSBvciBzbyAtIG5vdCBtdWNoIG1vcmUpIEkNCj4gdGhp
bmsgaXQgd291bGQgYmUgb2sgdG8gZG8gdGhlIG1hcHBpbmcgaW1tZWRpYXRlbHkgb24gbW1hcC4g
QnV0IGxldCBtZQ0KPiBrbm93IGlmIEknbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLg0KPiAtIEls
aWENCg0KSW4gY2FzZSB1c2VyIGlzIGRvaW5nIHNvbWUgbWVtb3J5IHIvdyBhbmQgc29tZSBldmVu
dCBsaWtlIGhvdHVucGx1ZyBvciBzaW1pbGFyIHdvdWxkIGhhcHBlbiB5b3UgbWF5IG5lZWQgc29t
ZSBkdW1teSBwYWdlIG1hcCBpbiBvcmRlciBhbGxvdyBzbW9vdGhlciBleGl0IGZvciB1c2VyLiBB
bHNvIGZvciBhbnkgb3RoZXIgY2FzZSBtYXBwaW5nIGRpc2FwcGVhcnMgZmF1bHQgaGFuZGxlciB3
b3VsZCBoZWxwIHJlZXN0YWJsaXNoIG1hcHBpbmcgaWYgZGV2aWNlIGlzIHdvcmtpbmcgZmluZS4N
Cg0KVGVqYXMNCj4gDQo+IA0KPiA+DQo+ID4+ICt9Ow0KPiA+PiArDQo+ID4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIHhlX21taW9fZ2VtX2Z1bmNzID0gew0KPiA+
PiArCS5mcmVlID0geGVfbW1pb19nZW1fZnJlZSwNCj4gPj4gKwkubW1hcCA9IHhlX21taW9fZ2Vt
X21tYXAsDQo+ID4+ICsJLnZtX29wcyA9ICZ2bV9vcHMsDQo+ID4+ICt9Ow0KPiA+PiArDQo+ID4+
ICtzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZV9tbWlvX2dlbSAqdG9feGVfbW1pb19nZW0oc3RydWN0
DQo+ID4+ICtkcm1fZ2VtX29iamVjdA0KPiA+PiArKm9iaikgew0KPiA+PiArCXJldHVybiBjb250
YWluZXJfb2Yob2JqLCBzdHJ1Y3QgeGVfbW1pb19nZW0sIGJhc2UpOyB9DQo+ID4+ICsNCj4gPj4g
K3N0YXRpYyBpbmxpbmUgcGh5c19hZGRyX3QgeGVfbW1pb19waHlzX2FkZHIoc3RydWN0IHhlX21t
aW8gKm1taW8pIHsNCj4gPj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHRpbGVfdG9feGUobW1p
by0+dGlsZSk7DQo+ID4+ICsNCj4gPj4gKwkvKg0KPiA+PiArCSAqIEFsbCBNTUlPIGluc3RhbmNl
cyBhcmUgY3VycmVudGx5IG9uIFBDSSBCQVIgMCwgc28gd2UgY2FuIGRvIHRoZQ0KPiA+PiB0cmlj
ayBiZWxvdy4NCj4gPj4gKwkgKiBJbiB0aGUgZnV0dXJlIHdlIG1heSB3YW50IHRvIHN0b3JlIHRo
ZSBwaHlzaWNhbCBhZGRyZXNzIGluDQo+ID4+ICtzdHJ1Y3QNCj4gPj4geGVfbW1pby4NCj4gPj4g
KwkgKi8NCj4gPj4gKwlyZXR1cm4gcGNpX3Jlc291cmNlX3N0YXJ0KHRvX3BjaV9kZXYoeGUtPmRy
bS5kZXYpLA0KPiA+PiBHVFRNTUFEUl9CQVIpICsNCj4gPj4gKwkJKHVpbnRwdHJfdCkobW1pby0+
cmVncyAtIHhlLT5tbWlvLnJlZ3MpOyB9DQo+ID4+ICsNCj4gPj4gKy8qKg0KPiA+PiArICogeGVf
bW1pb19nZW1fY3JlYXRlIC0gRXhwb3NlIGFuIE1NSU8gcmVnaW9uIHRvIHVzZXJzcGFjZQ0KPiA+
PiArICogQG1taW86IHhlX21taW8gaW5zdGFuY2UNCj4gPj4gKyAqIEBmaWxlOiBEUk0gZmlsZSBk
ZXNjcmlwdG9yDQo+ID4+ICsgKg0KPiA+PiArICogVGhpcyBmdW5jdGlvbiBjcmVhdGVzIGEgR0VN
IG9iamVjdCB3aXRoIGFuIG1tYXAtYWJsZSBmYWtlIG9mZnNldA0KPiA+PiArdGhhdCB3cmFwcw0K
PiA+PiArICogdGhlIHByb3ZpZGVkIHhlX21taW8gaW5zdGFuY2UuDQo+ID4+ICsgKg0KPiA+PiAr
ICogU2VlOiAiRXhwb3NpbmcgTU1JTyByZWdpb25zIHRvIHVzZXJzcGFjZSINCj4gPj4gKyAqLw0K
PiA+PiArc3RydWN0IHhlX21taW9fZ2VtICoNCj4gPj4gK3hlX21taW9fZ2VtX2NyZWF0ZShzdHJ1
Y3QgeGVfbW1pbyAqbW1pbywgc3RydWN0IGRybV9maWxlICpmaWxlKSB7DQo+ID4+ICsJc3RydWN0
IHhlX2RldmljZSAqeGUgPSB0aWxlX3RvX3hlKG1taW8tPnRpbGUpOw0KPiA+PiArCXNpemVfdCBz
aXplID0gbW1pby0+cmVnc19zaXplOw0KPiA+PiArCXN0cnVjdCB4ZV9tbWlvX2dlbSAqb2JqOw0K
PiA+PiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqYmFzZTsNCj4gPj4gKwlpbnQgZXJyOw0KPiA+
PiArDQo+ID4+ICsJaWYgKCh4ZV9tbWlvX3BoeXNfYWRkcihtbWlvKSAlIFBBR0VfU0laRSAhPSAw
KSB8fCAoc2l6ZSAlDQo+ID4+IFBBR0VfU0laRSAhPSAwKSkNCj4gPj4gKwkJcmV0dXJuIEVSUl9Q
VFIoLUVJTlZBTCk7DQo+ID4+ICsNCj4gPj4gKwlvYmogPSBremFsbG9jKHNpemVvZigqb2JqKSwg
R0ZQX0tFUk5FTCk7DQo+ID4+ICsJaWYgKCFvYmopDQo+ID4+ICsJCXJldHVybiBFUlJfUFRSKC1F
Tk9NRU0pOw0KPiA+PiArDQo+ID4+ICsJYmFzZSA9ICZvYmotPmJhc2U7DQo+ID4+ICsJYmFzZS0+
ZnVuY3MgPSAmeGVfbW1pb19nZW1fZnVuY3M7DQo+ID4+ICsJb2JqLT5tbWlvID0gKm1taW87DQo+
ID4+ICsNCj4gPj4gKwlkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQoJnhlLT5kcm0sIGJhc2Us
IHNpemUpOw0KPiA+PiArDQo+ID4+ICsJZXJyID0gZHJtX2dlbV9jcmVhdGVfbW1hcF9vZmZzZXQo
YmFzZSk7DQo+ID4+ICsJaWYgKGVycikNCj4gPj4gKwkJZ290byBmcmVlX2dlbTsNCj4gPj4gKw0K
PiA+PiArCWVyciA9IGRybV92bWFfbm9kZV9hbGxvdygmYmFzZS0+dm1hX25vZGUsIGZpbGUpOw0K
PiA+PiArCWlmIChlcnIpDQo+ID4+ICsJCWdvdG8gZnJlZV9nZW07DQo+ID4+ICsNCj4gPj4gKwly
ZXR1cm4gb2JqOw0KPiA+PiArDQo+ID4+ICtmcmVlX2dlbToNCj4gPj4gKwl4ZV9tbWlvX2dlbV9m
cmVlKGJhc2UpOw0KPiA+PiArCXJldHVybiBFUlJfUFRSKGVycik7DQo+ID4+ICt9DQo+ID4+ICsN
Cj4gPj4gK3N0YXRpYyB2b2lkIHhlX21taW9fZ2VtX2ZyZWUoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpiYXNlKSB7DQo+ID4+ICsJc3RydWN0IHhlX21taW9fZ2VtICpvYmogPSB0b194ZV9tbWlvX2dl
bShiYXNlKTsNCj4gPj4gKw0KPiA+PiArCWRybV9nZW1fb2JqZWN0X3JlbGVhc2UoYmFzZSk7DQo+
ID4+ICsJa2ZyZWUob2JqKTsNCj4gPj4gK30NCj4gPj4gKw0KPiA+PiArLyoqDQo+ID4+ICsgKiB4
ZV9tbWlvX2dlbV9kZXN0cm95IC0gRGVzdHJveSB0aGUgR0VNIG9iamVjdCB3cmFwcGluZyB4ZV9t
bWlvDQo+ID4+ICsgKiBAZ2VtOiB0aGUgR0VNIG9iamVjdCB0byBkZXN0cm95DQo+ID4+ICsgKg0K
PiA+PiArICogVGhpcyBmdW5jdGlvbiByZWxlYXNlcyByZXNvdXJjZXMgYXNzb2NpYXRlZCB3aXRo
IHRoZSBHRU0gb2JqZWN0DQo+ID4+ICtjcmVhdGVkIGJ5DQo+ID4+ICsgKiB4ZV9tbWlvX2dlbV9j
cmVhdGUoKS4NCj4gPj4gKyAqDQo+ID4+ICsgKiBTZWU6ICJFeHBvc2luZyBNTUlPIHJlZ2lvbnMg
dG8gdXNlcnNwYWNlIg0KPiA+PiArICovDQo+ID4+ICt2b2lkIHhlX21taW9fZ2VtX2Rlc3Ryb3ko
c3RydWN0IHhlX21taW9fZ2VtICpnZW0pIHsNCj4gPj4gKwl4ZV9tbWlvX2dlbV9mcmVlKCZnZW0t
PmJhc2UpOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICtzdGF0aWMgaW50IHhlX21taW9fZ2VtX21t
YXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpiYXNlLCBzdHJ1Y3QNCj4gPj4gK3ZtX2FyZWFfc3Ry
dWN0ICp2bWEpIHsNCj4gPj4gKwlzdHJ1Y3QgeGVfbW1pb19nZW0gKm9iaiA9IHRvX3hlX21taW9f
Z2VtKGJhc2UpOw0KPiA+PiArCXN0cnVjdCB4ZV9tbWlvICptbWlvID0gJm9iai0+bW1pbzsNCj4g
Pj4gKw0KPiA+PiArCWlmICh2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQgIT0gYmFzZS0+c2l6
ZSkNCj4gPj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4+ICsNCj4gPj4gKwkvKg0KPiA+PiArCSAq
IFNldCB2bV9wZ29mZiAodXNlZCBhcyBhIGZha2UgYnVmZmVyIG9mZnNldCBieSBEUk0pIHRvIDAg
YW5kIG1hcA0KPiA+PiB0aGUNCj4gPj4gKwkgKiB3aG9sZSBidWZmZXIgZnJvbSB0aGUgc3RhcnQu
DQo+ID4+ICsJICovDQo+ID4+ICsJdm1hLT52bV9wZ29mZiA9IDA7DQo+ID4gSSBhbSBub3Qgc3Vy
ZSwgYnV0IGlzIGl0IGNvbmZpcm1lZCB0aGlzIG9mZnNldCB3b250IGJlIHVzZWQgYnkgYW55dGhp
bmcgZWxzZT8NCj4gDQo+IA0KPiBZZXMsIEkgYmVsaWV2ZSBpdCBpcyB1c2VkIHRvIGxvb2t1cCB0
aGUgR0VNIG9iamVjdCBpbiBkcm1fZ2VtX21tYXAgYW5kDQo+IHRoYXQncyBpdC4NCj4gDQo+IEFs
c28gbWFueSAobWF5YmUgYWxsPykgZHJpdmVycyBkbyBleGFjdGx5IHRoaXMsIGZvciBleGFtcGxl
IHNlZToNCj4gbXRrX2dlbV9vYmplY3RfbW1hcA0KPiBleHlub3NfZHJtX2dlbV9tbWFwX2J1ZmZl
cg0KPiByb2NrY2hpcF9kcm1fZ2VtX29iamVjdF9tbWFwDQo+IF9fdGVncmFfZ2VtX21tYXANCj4g
DQo+IC0gSWxpYQ0KPiANCj4gDQo+ID4+ICsJdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9u
Y2FjaGVkKHZtYS0+dm1fcGFnZV9wcm90KTsNCj4gPj4gKw0KPiA+PiArCXZtX2ZsYWdzX3NldCh2
bWEsIFZNX0lPIHwgVk1fUEZOTUFQIHwgVk1fRE9OVEVYUEFORCB8DQo+ID4+IFZNX0RPTlREVU1Q
IHwNCj4gPj4gKwkJICAgICBWTV9ET05UQ09QWSB8IFZNX05PUkVTRVJWRSk7DQo+ID4gRG8geW91
IHdhbnQgdG8gYWxsb3cgY293X21hcHBpbmc/DQo+IA0KPiANCj4gR29vZCBxdWVzdGlvbi4uLiBJ
IHByb2JhYmx5IHNob3VsZCBlbmZvcmNlIHRoYXQgdGhlIHVzZXIgcGFzc2VkDQo+IE1BUF9TSEFS
RUQsIHRoYW5rcyENCj4gLSBJbGlhDQo+IA0KPiANCj4gPg0KPiA+IFRlamFzDQo+ID4+ICsNCj4g
Pj4gKwlyZXR1cm4gcmVtYXBfcGZuX3JhbmdlKHZtYSwgdm1hLT52bV9zdGFydCwNCj4gPj4geGVf
bW1pb19waHlzX2FkZHIobW1pbykgPj4gUEFHRV9TSElGVCwNCj4gPj4gKwkJCSAgICAgICBiYXNl
LT5zaXplLCB2bWEtPnZtX3BhZ2VfcHJvdCk7IH0NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9tbWlvLmgNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5o
IGluZGV4IGMxNTFiYTU2OTAwMy4uMjk5MGJiY2VmMjRkDQo+ID4+IDEwMDY0NA0KPiA+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW1pby5oDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9tbWlvLmgNCj4gPj4gQEAgLTgsNiArOCw3IEBADQo+ID4+DQo+ID4+ICAjaW5jbHVk
ZSAieGVfZ3RfdHlwZXMuaCINCj4gPj4NCj4gPj4gK3N0cnVjdCBkcm1fZmlsZTsNCj4gPj4gIHN0
cnVjdCB4ZV9kZXZpY2U7DQo+ID4+ICBzdHJ1Y3QgeGVfcmVnOw0KPiA+Pg0KPiA+PiBAQCAtNDIs
NCArNDMsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZV9tbWlvDQo+ID4+ICp4ZV9yb290X3Rp
bGVfbW1pbyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPj4gIAlyZXR1cm4gJnhlLT50aWxlc1sw
XS5tbWlvOw0KPiA+PiAgfQ0KPiA+Pg0KPiA+PiArc3RydWN0IHhlX21taW9fZ2VtICp4ZV9tbWlv
X2dlbV9jcmVhdGUoc3RydWN0IHhlX21taW8gKm1taW8sDQo+IHN0cnVjdA0KPiA+PiArZHJtX2Zp
bGUgKmZpbGUpOyB2b2lkIHhlX21taW9fZ2VtX2Rlc3Ryb3koc3RydWN0IHhlX21taW9fZ2VtICpn
ZW0pOw0KPiA+PiArDQo+ID4+ICAjZW5kaWYNCj4gPj4gLS0NCj4gPj4gMi40My4wDQo+IA0KDQo=
