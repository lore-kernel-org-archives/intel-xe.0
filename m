Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E9D7236B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 10:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3260710EA9F;
	Fri, 23 Jan 2026 10:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSDc3M0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D48C10EA9F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769164181; x=1800700181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vfJ/vHqsXhJ/DDcGjrXMoylqYDIU9jViSXkP0ykdNL4=;
 b=cSDc3M0ccfnMD1RB+F6zNfjoJhKoh9Qveb+VF7LmFx/omensdNcpiXGr
 7W3as+lPzNloB3wSpLsqtq9gmkS3H2i+pJTRIQsf2tZj5c0ffSlwLGEPO
 6u9fvqgb629ZYrPz1ut3z9sGzj0HkiYyRHCPEbYNly7ktHnnwOiFOeo7m
 0M/xSfchdnkQqbLl7tAQt37LWy4ukr+p8f1C3Y93ZDMy755K014YoB+Ss
 C6x3PJe3qSSc+8b/0DaEdoAnHnbXIHQcyuup9KzVO9lSUWyCPbFkgX997
 tym3Jydpz3Ih/OO7G9RP90QbqCpCZ6zh8zDZCzbcEaqaLWj729v5y/Y1l g==;
X-CSE-ConnectionGUID: M9emL/mwT8GgH5VteaeXFw==
X-CSE-MsgGUID: FNNP6ODCQa2HOS4KgAipFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70505985"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70505985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 02:29:41 -0800
X-CSE-ConnectionGUID: iPBlxVMVRTahiXA9fo1mHQ==
X-CSE-MsgGUID: YkaT0kMMQjuIAXeUtt+5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206600084"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 02:29:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 02:29:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 02:29:40 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 02:29:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szOVIIx93CjHjStl0TSTJ0AOdFzeDCgw6mOspCGbJN0vQTklsVbgAjq+FpNENzJ4AjOq1/gLh8oRwswL9qhlMTyiHbMWEsd+cIqhbLyBL9PVP8W4cicrSUYKpSYOaCRdRKQSkXeQCY2dIFYLQC065RGd4uH+ASOb1xyV/YzHGIl3fUdqqxbzOrPbJqUuzZMvaCqHmLUO1euW+bWkLkQybESBgFh7rt/7rhQtaJ3vKoAgQpeB3YtlAA46/w1CREOkiLVunXZzoIhGpFBPgYeAap/dSjVKCRLD7SkzAWLyBVT5EeQY+Kbo/glFENwLYMFLeMHyTiP9gpydc8ABbDvkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doTh+LS4WxF0EmgLjgm2u/dDjXLWY1WaRyyN4HHkANY=;
 b=eSOFSYfyoCAi5tOsux9YyoHUHemtIh/OCLjCNOeHcH3M6iWD+z5iYqoUNJjRyP0p2WEoS6r/6hrnuvWxG6xS3pMs7g9ZyvhYRR6TIoFdp8VRXncplsD4zyJk/8JRqml1QeWk+VknUSKDgy+cMT2NcwHHkvRSW6AAzYx4hwIfG2AxJXdT/ppO0h9Yl3uwtzh9xcr1WpxivI+pjwIZRvfFerAuj4tJ3SJdfGAbj2Hl41dbXItrb64k4eeMpKI2VtkhIx19DuTs8xPENd9FjUeHTATadxjFktAAzBhwNqYGpc6P1Aj11U8fvJgHU7RKhrsMsPSLkDGl1xAoTpCJkQZk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB4988.namprd11.prod.outlook.com (2603:10b6:806:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:29:39 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 10:29:38 +0000
Date: Fri, 23 Jan 2026 11:29:36 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe/configfs: Use proper notation for local include
Message-ID: <20260123102936.xoxexlomwcp5iq3n@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
 <20260121214218.2817-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121214218.2817-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU6P191CA0064.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB4988:EE_
X-MS-Office365-Filtering-Correlation-Id: 94097bbe-7668-42aa-61db-08de5a6a4fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVdsNlRKckZNYjR6cnpJN2dIRndZbjBCL3hBSmNILzVhOU52bnFZcVlyMHVC?=
 =?utf-8?B?UGdkRWtIQllQOW1LNDlFeVRHa09TYk9iRFZEOEt3Tmd6aWtFdlY4QTQybkZ3?=
 =?utf-8?B?N2RkNWYwYlFZRWtmVEwxVXVNdXhFamlkekljazU2VFh2V0VrMEVuSWc1c2Vo?=
 =?utf-8?B?Z2RVRW02cG5DV25MRTdJS1lrRDlPTkpkMjZvM1puc0JuVWNmblAra0xQc2lm?=
 =?utf-8?B?MW5iRXVCSkQ3NjdoZ3FhN0VvWFEwNEN5Q0QyK3VycDRSSU44bmdzaldDUVgy?=
 =?utf-8?B?czhBM1NteWw0cUZ5ZVlrSGpYUmdhR0lPVXpSWUxsRGdFWHY0bEhMK1F3d2NB?=
 =?utf-8?B?Z3VJUzVJeGNPV2pNTWIvenQybzJlUnR3cERLd1BUTkNUS1JMODY2bzNsQ1Rq?=
 =?utf-8?B?SkFSd25wR0xheHl4OUo0TytTWVZPOGZkV2VidTA2RUVDM1Z2SW91RGNrajZL?=
 =?utf-8?B?S3V3bUVYUllFV2tyaXh4VXVmNnpSVGZiekIwUHNxQWVSLzlkTXZqa1RyVDIy?=
 =?utf-8?B?Uy9kZEsxOCtBTlluUmNRMmc4N1VIcmU0b1JpbGpUMm1FR295dFFHSXRFZG9a?=
 =?utf-8?B?VkRXbjM4WDhDU29Nb0NwZExVdEplSFhOU3RoYmpWbUFGaldsNWdwaVc3ZHRT?=
 =?utf-8?B?U1Vvem0wQ0VqOCt5bjhrY2JZS1lGMzIybm5ISE16dk5QRWZWMzBOdG85YkVh?=
 =?utf-8?B?WHBQdWppT2NDcDNYdEpzK0l3cEtXcW5LblVPbnZGbTNQYkNCK255bjVZcWdi?=
 =?utf-8?B?eHliUU0zK25sZEhCQXBHekRIM3BsZ2gyUVhVS2tma0FQR3lvYzRFQWtaZEFt?=
 =?utf-8?B?OVNMUlVZWklwamgxa3RXbUZtZ3lNVTFFais2Mk5wcnlNSm1ibnlPUy9McTlI?=
 =?utf-8?B?OGpzMy9DNThzK1JXaytlNVZPR0Q3RFREVVg0ZkNQQVUwUjljbzBhMXlZc2Rs?=
 =?utf-8?B?TzQ1ajNZL0M5em9QNHViU3RMTEJoSHhRRDV3cVJYL25rc0tIa1o2THBMVWFy?=
 =?utf-8?B?U1krdkxNNW1IRFBIekRoTElhSDRYUFF5R1NSa0o1MHJEZ085Vkprcit3dHl3?=
 =?utf-8?B?WFU4dWFKb0MyaGY5R2d2NStXRGVxZXlnL2FKZVRPK2NoQ0lVTWhqU3k5a2JK?=
 =?utf-8?B?Mm9yeS90bHA0cXZwZkRESHFMdFYvdTkveUtkT1hybDJFTlhpd0p6ZUIzcFZC?=
 =?utf-8?B?dkd5cUsybmpGaHhSamxEQjhFMEpva3ZSR3VBUGJuU3E1eUprTzl1VXZ5cmgv?=
 =?utf-8?B?YjNtSmxUSWtvYlV0NFhqYzBQYUZBQkh4Smd3cDZXNjB2cmMrM1Z5Y1Q4Vzcz?=
 =?utf-8?B?cUNnM0QrcnI1WHI0dmpqZ3owTiswNklRbldmS1dYVDlyRFFoWGJVOW0zOGxX?=
 =?utf-8?B?a2x1S3VOelpCbDFXWGNNdU9nTkFaRFFhcGN3UlU4ZmlwbGFGT0lLSUV5U05J?=
 =?utf-8?B?TTZKU3o3VmIwRTc4dHZRaGdjakFtUFBnZTFkTzk0c2pTMnN4QjBnMU1EOHdK?=
 =?utf-8?B?SGpKWm1rbDVLajFjWEw4blJ1YVBpSUwvNzg5a0R2dVVCYTYyWlpBM2tOVUU5?=
 =?utf-8?B?a0x3Y3VweGh6aE1DWHJyZVNJM2ZlMnhsVG40c0JuSTgyUk1WNFdFVW4rV0Ux?=
 =?utf-8?B?Skd6a0trM0djMWltNEQ5Q3dCb0cydXpHMW5jajdGWHFvUHhMejlvOFdweWJZ?=
 =?utf-8?B?V3pOZlBUSFBNcThZT0ZTUENGUnpERTJaTUE3UEV3WGlCQ2N2ajU4MnlxZXo0?=
 =?utf-8?B?a3M4bElKelloTG5MdkFpTVV6STJ6UDRKQTRFWE1oenB5cVBBUWhLdzR1OFM0?=
 =?utf-8?B?OWtudktrS2dTQ3phbzd2Y1doYnhMY0VET0l1dmlvc2RNWnVwYmNzbmpoT0pC?=
 =?utf-8?B?TEZ5MW9pK1RIbjM3cnVQRkpVcnBMUXd6ZXozSk5EdjA5SlJOdHc1cFNUMHB1?=
 =?utf-8?B?SUoxUjNHRFlpdlhOcnMra1N2bUZheFd1Yy96RE9BYXpXU1VuaS8yTUdsbVRp?=
 =?utf-8?B?eENyOUpRZ3QrcENyYVp5NERlWXhYc21SWEtFUlB4SS9rbWJ2c1FEZjduSkd1?=
 =?utf-8?B?K3JEei9CVHRFYWVSdzFZaS9vOC9lOGVDc2dwS0w4bDUxdS9ZeEc1ZFEzOHRZ?=
 =?utf-8?Q?qHhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDlaQlprNW9OeFpHZzFRZUFuZTJFUk5SWGFsQmNDVDkwWktSUmNhYjUzSW5q?=
 =?utf-8?B?ei9PNzZtR0cwTzlvM3hDQ2NRUzhHUkYwb0FyL2xVNEN1Yi9oOU5uN2JCUXV6?=
 =?utf-8?B?alk0TWJLMzZiK3BVaFExcEh0eThXeGtQV1BUMjdQdGZ2a1dINGZ0MHN5a1Zk?=
 =?utf-8?B?N3VmakVmY1ZtZHdjaXp4cmhubk1qU3BzUUlOL3V4Q1RFYytpUjNMeTlwZitQ?=
 =?utf-8?B?cFQwWDhVcFhZQ3pJNUtOUjN2K1BUanpNazZIK3k3S2JzcUNVaENyQ2pram82?=
 =?utf-8?B?VWEwTDJLeGdpbVdoUmwxQUIrSU5ZeVBSNDJKK2xXd1d0TFVXWWFpczFsZlZB?=
 =?utf-8?B?MjdoaGlyeHpLTVRhQ2ZQVXFUVzYrcUYxTUpOQmcrdko5RVFEVllzY3NHSSsr?=
 =?utf-8?B?cjhnRUNXcU9sN21RVFFFOFlKZWNTaUdiMFVOOXEwUHpHclVoU2xjU2lMNTRP?=
 =?utf-8?B?RUtIWVFxeFBqRGNqbnMwaHdlQkp4UUUrR01IeWxxNkZpSjdGaTVwUm5Zc3Rr?=
 =?utf-8?B?NnVBeXI5ODFmNE5rUnVNdDFKZ0llS0RadzU1NEFud2piSTZzU1RmUXBZa2kr?=
 =?utf-8?B?QUFlYkhmNHcwUUsvWnZPdHYrbHhsMk83NHphOHVSemdnYW9aSVhiVWZyNEhj?=
 =?utf-8?B?aXF3RklCNDNjQjFVWS9OcDdWc21YSmtIOFNoMlBqSEYvU3UrL3dsQkx1UER3?=
 =?utf-8?B?SnIwR1RrOWpTbGdFVjRrcWtJL0xnaXNkNXd1c0NGS1lBWlFRSjRKNkdiZXBm?=
 =?utf-8?B?SXRTZExYbUdPMkd3aGxBekgzUzNnM0pRclR6WVhnZ1pVekhnV0hnNU5MbWFl?=
 =?utf-8?B?TEd3N2xoU0NrUjB6V0hZMm12c2p5MndETmlUeTJwa3d4TVpJN1BGV25zOWcw?=
 =?utf-8?B?S3Q3YWJxb0pxYzg4N2pMMWFkUlFRcUcrcHBiZnVFd2tWQ3ppSVZIVnNuN3lp?=
 =?utf-8?B?eGtzMlFjajZhbmM3TlppMXkwOVRwTU56U2RiL0VPRjlXZksvcWRQOGpvZ1Vy?=
 =?utf-8?B?a1ZYQjUrZWVmc000cnJ0SmNVYVlkS3Vsek9xZGM4elBiTE5PbExMMXZncFBo?=
 =?utf-8?B?SE5XemF3M3FVOUs3SXlmRXltV0VWdVl2U1ZsL2psMGQ0cnZiYldiVVVLQVRB?=
 =?utf-8?B?WmtiQlJvZFRhQmtxVVFrUXZzRFlrM3hHSmRETHppdVR2UHd0aHhQaWFGOWt2?=
 =?utf-8?B?WGZPSE1OZVdKTHkvYm5uT2dqZE1tT2k4VTZoVkZERTRZMVpvZk9KTThiZ3dE?=
 =?utf-8?B?T0ZwWEZwWjh0T3FsMENGN3lkVTdMdjBFamJTT2FXUGpieFlHb0VqLzQ0d0Ji?=
 =?utf-8?B?ang2QjJXby8vcHBSS1o1VGJPVlQ3ZmR4YUhGRDN4K0p5cFc0cGs0VHlRajVL?=
 =?utf-8?B?WlVZZklSekFtdnhMbzN4T0ZObjNRRHhPNDVBSjQ2b0R5NXJHbFQ1R2lrYTFH?=
 =?utf-8?B?WFFXZ0xacEduTE9jY0EzN1owUVVTM1lzQWNaRXRvYnVTMDZ2R25MaW9YajVP?=
 =?utf-8?B?MnRHekplTWpLVzdWOUZjQTAwVVNubFZFSEV5blJKQTR6OTI1OEhtOXBxNjU5?=
 =?utf-8?B?VVdRSGVFVFBsQkJ0M1Z2U21ZcDhIRXdlbDdKTTU0dlFVY1MwaUJvYUlKeFJC?=
 =?utf-8?B?VVBBTEV1STdMMUI5aFJJSVZsdmZYSE5CYUs3YWJUL3l2RWx4LzNiWDd1T1Vw?=
 =?utf-8?B?Qmtidisxa3luSDRoV0xSWUdNS2FzSjVnM3VqY3ROTVlJQXQ2aENpZEVpVTRB?=
 =?utf-8?B?N2xSSXE0eExhdlJST24vTkRmZVJ1Y3dHeStqcDA0bDJKZ0pZUXREakt2Mkxr?=
 =?utf-8?B?dzZpSW9jODZSaUlJbWR4ZHRaYVdvVmpDa0RPSkp5OTlQVVNnU3dhaEhrdm1i?=
 =?utf-8?B?UFovSVVxRnpNdFJWazU0QVNmT21oUVlBWFFid1dkdk9qVjdUSW5KVzVWS2I5?=
 =?utf-8?B?RlRPUGRFMElGdzFsNE5aTmVPcUNCRlZoZTc2cDkzd2lXaDN0ekNmbUhrRDQr?=
 =?utf-8?B?RFZuMDZvL0hKeU0yV0pHRDMzLytjV0RZaFR4bUhjbFBObUJmY2xJdCtiWkIv?=
 =?utf-8?B?amQ2eEt3VjJUVVMzM1NSaG9rQzd6STJuVERTV1JmOWI2SDk0MjRITG1JcjBk?=
 =?utf-8?B?QVFHSkhGeWd5KzVnbytYaXZHQTNQQXlyTDduUGpGQURxeXg1Y1MzZmQ3REtL?=
 =?utf-8?B?S0hlSVpMUk43Z0JvVWM1UnlpTWhheEpnMGhYaUJVNHZCNFFzOHFBOWJvdHY4?=
 =?utf-8?B?RzcxNHQ1WXdEd0hQTzFqa1ZIZFh4bEYvWnBtbzNzWkV5NzAyUStWOFhqZ1d2?=
 =?utf-8?B?RUY0TERGQ3hSNU82a1U0VkFWdFJFZzBUSjlxRHBPMDkxR2h0QjRDSkcrb29J?=
 =?utf-8?Q?dIELojhykGeCnETk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94097bbe-7668-42aa-61db-08de5a6a4fea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:29:38.8677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bV0Bp65ZakF89J3PfkhZI/8cNKDdaANZw6N+d+h1I4B+t++L3ZcRMx9zZZiKAV2a+kt6Jteo57/QuPRZANPLgUegn0xqscQjHkydlKb/3SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-sty-21 22:42:13 +0100]:
> For local includes we should use "" notation, not <>.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index fed57be0b90e..510888354a7c 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -8,7 +8,7 @@
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> -#include <xe_hw_engine_types.h>
> +#include "xe_hw_engine_types.h"
>  
>  struct pci_dev;
>  
> -- 
> 2.47.1
> 

-- 
