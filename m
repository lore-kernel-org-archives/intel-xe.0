Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C84CAC5B9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 03:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A13E10E26C;
	Tue, 30 Sep 2025 03:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H06cICbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3526610E26C
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 03:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759202943; x=1790738943;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=rbXGiha9RuZMvwR9H+cyU88JJO7G21COO7KjUVAKDDQ=;
 b=H06cICbeYC7Ui1jUvgJbUY5KDowIhH1Xszh4aA9Hydfd0ndC44Ep52TZ
 TMhI8UrEsZ3K5CcmJPuY897fKaExEMVlkfq5jIGo01tFK6whGpVibnRgw
 GywKkAhCdsYvMCt2K49TPh1Kaj6kBm6L0gqgtX23ewfuwNfLpnSbKnugp
 BhspnIBCi4uV0dlFNLB2QHfY4pNBhoYKm5htOpGzazTB2PJWncye8DGyd
 EAHgcY0oO56fpCBBNnQNIx0kSiZVA/Km/hTVKxEQGXLo8e5gmTgKg5Luw
 C/Fogw9ywzuDCXMxGNYDmyfmCDMGFWs50LtYgQxNVoJbWPjv6uX6vNwng g==;
X-CSE-ConnectionGUID: SSMN4uaYRCCOZ8kqOxPhbA==
X-CSE-MsgGUID: IigWUeuGS1C3XImOh/HxyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65271606"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="65271606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 20:29:02 -0700
X-CSE-ConnectionGUID: rSQproiCTnqr8fk9bcxEEw==
X-CSE-MsgGUID: x76sqn2gTxyYeogBdWeg6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
 d="scan'208,217";a="182815172"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 20:29:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 20:29:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 20:29:01 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 20:29:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtxN/fZ+XSQVZYqBTPhZxe+zOj96MjojBB4z83vykPrn+K/BO4XFbm4QFZN7LSK85/cEZ4aCYykI+D8qZshtjThIU1LOcLrg5Walmvy/pzfX1iLrJvLcKihCyuOEKL5RdEQiccHOrmsJEXlczvR5aNSo1DeDJHoBzqly3Ikgsfsz7nwrzHt6yhhOrVYYaceorbVf8nSbrzbdrOzksej9ctr4ssLnMyO7MML8ie87xyuoiOIu73zPBzUDe3V2/CEhsBLoz2e8HK91OpsvXOnxZbXjYWqTRAjZLQqkHre5PSkrQqBKSAeBH7GuBYUNnK6eF9NDfyG+oNTte4qSk4NHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7IlgCTYIHPqRfcruKCb8d6BH1WLBx9LkRNXETly960=;
 b=GCQY1pL1o3668MLuHu0WE0xA73KLJ2oGCfCEZjnqRjqACkrwNT4Tc6S9KmoUs1cgAcQago5K9fLdwGrBIqEhEmIwxLuMlNYzkemRRQ/U3XPnhxgz5d3CDvRVo1UsD7Du4X5EKrORENODDIGXO4qx3QR3wlAP283mHr+kaZ8s0LbOnozdem/THJYBrEP4aTkeEjAXqItmYYPfQM0Ga3I72NQjqhj86F/ZjcxQ6guTiCj2Fd8upahdBa/30tQE4uCDSwwK7IfC0VUGPw+hwvk4WHWFl2ZfhJKTiRYMb8Mq4wk+bqs9CAgLrOyDWYnjZcwBB4fPDD9R5WwEYuZfxZT9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by IA4PR11MB9057.namprd11.prod.outlook.com (2603:10b6:208:55d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 30 Sep
 2025 03:28:58 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 03:28:58 +0000
Content-Type: multipart/alternative;
 boundary="------------39sFFHoeWLS7A1yGL9lTQNKl"
Message-ID: <a0b50db8-77bd-481e-bf80-2e8b762a1de5@intel.com>
Date: Tue, 30 Sep 2025 05:28:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/36] drm/xe/guc: Document GuC submission backend
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-12-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-12-matthew.brost@intel.com>
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|IA4PR11MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: e44cd2c2-b328-46b8-5739-08ddffd17df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0dUNWlMTTYrYWdncWJFWDBCTXhZcnljZHhkYktlSUdBOEtGTXBjb0xpYnd1?=
 =?utf-8?B?emZ1ZTNHenJjdmFVUlJSaHFOaFpDeHpkS1FLQWdNWk5SUEc5UGlyZDU2Tlov?=
 =?utf-8?B?Y081VGhPUnJTbzFySU1pTnJTYWlzNVlqZng5dzBERWVXR0ZVVU5ucFR4UzMr?=
 =?utf-8?B?OTBUWGZpbjQ3MCtUcm4rL3Z6akcvVUxBRXdDeVpxOFNVZXNKVkcramc1SHAz?=
 =?utf-8?B?N0tkRjJoOTRrVDB2M1hkcWkvZnhXTTI2bkVPUkVuWG10SUUrNmMvMG12ck9r?=
 =?utf-8?B?UG8yUjUxV3JEQVNZbjgzc3A4QVluRWV2Mk42QXIzV1o2SlVnZlVwYUwyL0Yz?=
 =?utf-8?B?RFpxSnBTeG9jZ3ZTUlNPMVFvcHk2M2UvTkNHbUVtSG1yYm5RSlJzaXplWUdT?=
 =?utf-8?B?eW5sZjJzakp2OEQwdHdDb1VpdnBwQWkxa2c2Smo1dHZUK2tiVEthSkJjNC9s?=
 =?utf-8?B?VUtCVE1MSkJGWk1rSGd6bkloVGN5TnBONTNWNjhKa2FhWHhkeGVNUmNhNk9T?=
 =?utf-8?B?YUVDSklON0Q0aVAxZzNqQUxFSllyUERqcXNZUXVvMUQ5eVhEY3l0VUdmdkRQ?=
 =?utf-8?B?MGNQdVVjUHY3azZMbTVDVzV3cWhwWG5iZmUvZW9SMEJLNmpnUnVqcy9tRUpt?=
 =?utf-8?B?cWlnTkxmbUtpNnhsd0RsQVpMeXUvZGFUaCtzcGs3T05MN1haazZkaFArVFZX?=
 =?utf-8?B?TnNySnNIbmo1RXBDcG1DWGVXVGVPa3Y4cjF5citmdmh4c3p3dkdPdFVtcGUy?=
 =?utf-8?B?cDRmb0YweGZzRmticDg3YTBla3JuS0dLa0xHNGZqYXFNWkhYd0VGYllibXlT?=
 =?utf-8?B?UjMvaEtBSmM5M2tvWXN1b1gwWHdHUGE3M3VSVTlhQnJvZEU2WDZqV2VDOXQ2?=
 =?utf-8?B?RzJaQzhrOFFScGp0Uy9yc2J0Q3NoVm13Z1NISzFRMFVKbXNlOTVKeGdoVTBU?=
 =?utf-8?B?RWdJalBjTFBYWlhOb09lSjB4VDUxd1hhR3V3aEhpdVZ1ZDcyTGwrdi9FaTA3?=
 =?utf-8?B?emJBbXZ2Mjlxc1M5UytYZnFFS3BxQVd0blljbUJZV016UitqU0sxdnZSQ0FN?=
 =?utf-8?B?cEFTcmpnWGx3b21SWjJQaTFMbEYyN1ZLdHQ1TXBpeGI1bE9meHp5dUNIaFY2?=
 =?utf-8?B?bm9PNjFRczVlaC9IY1J1WDFEYkhWalBjUHRKTmVhTjJBSFA3bUl2dmk2ZUll?=
 =?utf-8?B?Wm5UQWRYcWNEYXFCVzg3bjlaODNxRlNvMWd5dmFKa1dva2ZrcTFhUUxoMU03?=
 =?utf-8?B?MUpISyt2S2oyRXA3NzgxRzRQV0NUMGFRU29VbHp3N3dpdXkyVk13L2JIWStO?=
 =?utf-8?B?TnFqamY3ZG50VGFzOGduazR0L1lIOFhISSt0TjJqQnc5VGdzakR6RzArK2hw?=
 =?utf-8?B?ZFgxMlFXWmVJM0M0REZIN0RlaS93UzhqYmEzV0d2QWhuczY5VEdQTVlkN1Fs?=
 =?utf-8?B?ZjdrbUhtaVNIL3JPL1pLc3MwNHhOdE5mbUF3dDk5VVhieis1TFV6SHpDNFNM?=
 =?utf-8?B?a24ySHZXMndQbnRSS0RkOEdJNTJyc0MrZVhiVU5VYVZxTTdTcTZISU5yYWFo?=
 =?utf-8?B?bEFlYVNoN29Qc0VOeVVWbHN0WU9Hc0tCb1Z1cFZ0ejFGMTRqTVQ0Y2ZKVVJr?=
 =?utf-8?B?dnFtN0U5ZmxmQWlxWTlmZ2lGbmVvdFprNXlqbnMxZWY4V1VRclhJcWYwaE5Y?=
 =?utf-8?B?YTRScExRSzRGalhUN21aMmt1WHUyQzN4V0pRU1U2Y0pYWEZNZFlBZytBcG1O?=
 =?utf-8?B?L05YYWxuaGdrSlYvVExTVXUwRERrKzQyT01Cb1hVdnh4ejNvZDM5bVRBNWhH?=
 =?utf-8?B?ZWo5YlBPTWxNODFpY0Y2eWcyS3labzNaYStJWklLVVlDK3dUZXZINlR0b3RV?=
 =?utf-8?B?Q3MrODk2Q29PLzkzaUE2b1I0d2tRTXdzQW9vTGZNajFEYnk1cytCTlJNYmI3?=
 =?utf-8?Q?7ZneWy+teEPbOyf/Q46NTwaKOigx5wKY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVNSaTIvcUUxZG5CbFZWRVBacnZiczlpQndncWNUQnZBcWV4WGdpUHRlWXo2?=
 =?utf-8?B?ejBvS1owc0dXMkU0c3pKWFVJTTFiR3JBQ3N4emtUbXUxZ1J3d0x6RW45WkZk?=
 =?utf-8?B?WnpMc2hmZjFnMnQra2txMHFRNFdqOEhZejdmTXFSU1VObTU3U015WkZycjE0?=
 =?utf-8?B?MVRhQnh1bzg2OVB5WUF4REV6bDdYZ1o0Q0daWTd1SHViVFJWYkNHTE5ydUJ0?=
 =?utf-8?B?OFExd01SMEFSKzRsWGtNZnhPK3MxNnlrSk4zdGxyS09pSk1MTTNKS3ZUeE9j?=
 =?utf-8?B?b1gwYzY4Wkk0MWt3ZXBxSW45c3pzdHBwaWdscFBQQy9UMnVaeHJ3N0hpQmZr?=
 =?utf-8?B?N21rNno1ZXBkV3VaWkR0RGNjVWR3VjIxemw4T2JjR2FWdXdKOWdzT0JSMWJO?=
 =?utf-8?B?R2RTK2lmQkNFeGRCTmhQUWZSZXQxQkQ2UGhUUjhld3hXU0s3ZzN6NDZUeGdp?=
 =?utf-8?B?b1ZlRXhDS2RUOVZSV0tqTHo3TWluNFlCcjlMazhhQ3VlT2UxRXRtTTIvMHgr?=
 =?utf-8?B?aVdSaUhqNWdrZStHeUNyQTlEMFVvOWUzNHFmK2lUWEF5aFVSWnhyWDV5a3JW?=
 =?utf-8?B?NFhhbzF6MDcvMWJ4NHJ0OXZxc29aSWt5ZjZvdk96UE8yUVJGN3ZoTGRoRm9E?=
 =?utf-8?B?b0g3REZabzlJb20vSkVMSmJsSCsvT09obEt1UERHd25rVDZ6VVFOOTBVMGg2?=
 =?utf-8?B?ZE1SWE5mL3Jjajg1VHFHVW9HdHRiOFcwaWdZZzh0RGp0b29CQ0N4U2hybHlQ?=
 =?utf-8?B?Zmg0ZjBNRTJCcWh3VlE3SldVaXFZYWgzV0NmRjZ4MjdnV3BjWGlrOWdpd25a?=
 =?utf-8?B?L3BlaXNpRU9GalJqcmRramNOdGpSa0lnVUxBOVE0eXdtdjRxSU1PS2I0d2J3?=
 =?utf-8?B?TGREQmJKS25kVjlFak1paVI3YVgxOVFSNURJa2tyYjUxR2dhRmdyZW5sQ01p?=
 =?utf-8?B?MitpQ3ZraG0rUStNc01hK28yTU5qYmtYeVNnRDZ6akh1WFArMUJMeWI2Y2VJ?=
 =?utf-8?B?Y0VUQlJwZ2hIQUdhbE95WFZnaFNXOGNqNTAvT0YrcXE1bWJGWjZSamlPOUdw?=
 =?utf-8?B?MWRxL053YTQyMG1MZ0xnbFFBd29iMkJ2S051ZHJjRDV4dFJvRlBEaTRFNk12?=
 =?utf-8?B?UnZKaE1KSU53SnExcFh3SDlmQUR3dHQyRFY5T0RuODJ5azR4Q0hnUnp6S2ln?=
 =?utf-8?B?TFVHSnBHZHdOeVh2T2xZMzlkZkxVSURsNHRqQ25kbmxpV0xSOFlnZjZidXNz?=
 =?utf-8?B?QnJGNzRReWR2eUR5Q3ltY3dSdWJDVzdvekpRK0ZLQ2FtT2NBTUFwV0hsMldz?=
 =?utf-8?B?Z2p1U0hoUUc4cEFrRU1iY2RmYnZDYzZEdUIrS0xadzBkbDVEWnpBUUIzOFZp?=
 =?utf-8?B?emVBSXBqRjNFTkx0bzlKS3hscWtQNk9NUEsydFVrQnc1VFBKeWltWXRraFd6?=
 =?utf-8?B?R2w0aWllU2owYUEyc3BISjZxRUhCSUtKSER3TjNvQnZPa3VUaHRUWEpsRHRM?=
 =?utf-8?B?aDJwWGVVUVVGWUtnT041VkpYSUFYVDJCVElaa1ZKQk5PcEI3YXIvTlp2SkVR?=
 =?utf-8?B?MTVNZ01yWFJoM1NNcno2YUZEUnlTdGtsWU43R3hiWkZSL1hza2FwWlBpZ25N?=
 =?utf-8?B?TGdYL3NlV0xVbms4WkwrTjdXMWpvWW5XMURBbGFvdW1xemMwbjhUbzE2N2tG?=
 =?utf-8?B?L3RhenZRTWlUWFFCVE1HUHdBUmdXTmlmVTZEK2t1Y0VWR21OWWFPNGt6bHkw?=
 =?utf-8?B?UTNBRjg5K1lqWmNOUE5oaVlLdkJBRlloa3Vwb1RkNnNmSG43OEIzNVJXTXoz?=
 =?utf-8?B?Z2tHR0Zna01pMHlpUFRnMmczMVMrck8zSTRXWVlaMGM1RGpiZndjaGxWdHJm?=
 =?utf-8?B?NnVjNkdnOCtrRkcyNCsvWThaT3pDSm41eDBPek9Tc3htdTlhQytzejdkbHcw?=
 =?utf-8?B?dVV2dXVBV2dDeDhhOFpPcU0zbVBhMldyMUVYVU1razhYZnVuQWZjNkh2WDJo?=
 =?utf-8?B?Q2xMeXRDWVRTWlgyYVYzUWNVV1hSNXkxUEhyNFRVZnJiMnlwZXM2Nng5S215?=
 =?utf-8?B?SkIwZmt1MG1GWVBNVEcrRStMOSsySTFZdDhGeUg5Q2FTdlltYUFocVJsUnpT?=
 =?utf-8?Q?j4JzTeSW1ukVJfeITIugSuT9T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e44cd2c2-b328-46b8-5739-08ddffd17df3
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 03:28:58.5433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNox4VLpyWdvvaPyiAecBY9bAFU4vJniOjnFKAy4uO0qLBLcKvsAqi6ID8/VnoLYmUOyL6UrixF14BCVDfkgkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
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

--------------39sFFHoeWLS7A1yGL9lTQNKl
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> Add kernel-doc to xe_guc_submit.c describing the submission path,
> the per-queue single-threaded model with pause/resume, the driver shadow
> state machine and lost-H2G replay, job timeout handling, recovery flows
> (GT reset, PM resume, VF resume), and reclaim constraints.
>
> v2:
>   - Mirror tweaks for clarity
>   - Add new doc to Xe rst files
> v3:
>   - Clarify global vs per-queue stop / start
>   - Clarify VF resume flow
>   - Add section for 'Waiters during VF resume'
>   - Add section for 'Page-faulting queues during VF migration'
>   - Add section for 'GuC-ID assignment'
>   - Add section for 'Reference counting and final queue destruction'
> v4:
>   - s/VF resume/VF post migration recovery (Tomasz)
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   Documentation/gpu/xe/index.rst     |   1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c | 282 +++++++++++++++++++++++++++++
>   2 files changed, 283 insertions(+)
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 88b22fad880e..692c544b164c 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -28,3 +28,4 @@ DG2, etc is provided to prototype the driver.
>      xe_device
>      xe-drm-usage-stats.rst
>      xe_configfs
> +   xe_guc_submit
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 70306f902ba5..cd5e506527fe 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -46,6 +46,288 @@
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   
> +/*
> + * DOC: Overview
> + *
> + * The GuC submission backend is responsible for submitting GPU jobs to the GuC
> + * firmware, assigning per-queue GuC IDs, tracking submission state via a
> + * driver-side state machine, handling GuC-to-host (G2H) messages, tracking
> + * outstanding jobs, managing job timeouts and queue teardown, and providing
> + * recovery when GuC state is lost. It is built on top of the DRM scheduler
> + * (drm_sched).
> + *
> + * GuC ID assignment:
> + * ------------------
> + * Each queue is assigned a unique GuC ID at queue init. The ID is used in all
> + * H2G/G2H to identify the queue and remains reserved until final destruction,
> + * when the GuC is known to hold no references to it.
> + *
> + * The backend maintains a reverse map GuC-ID -> queue to resolve targets for
> + * G2H handlers and to iterate all queues when required (e.g., recovery). This
> + * map is protected by submission_state.lock, a global (per-GT) lock. Lockless
> + * lookups are acceptable in paths where the queue’s lifetime is otherwise
> + * pinned and it cannot disappear underneath the operation (e.g., G2H handlers).
> + *
> + * Basic submission flow
> + * ---------------------
> + * Submission is driven by the DRM scheduler vfunc ->run_job(). The flow is:
> + *
> + * 1) Emit the job's ring instructions.
> + * 2) Advance the LRC ring tail:
> + *    - width == 1: simple memory write,
> + *    - width  > 1: append a GuC workqueue (WQ) item.
> + * 3) If the queue is unregistered, issue a register H2G for the context.
> + * 4) Trigger execution via a scheduler enable or context submit command.
> + * 5) Return the job's hardware fence to the DRM scheduler.
> + *
> + * Registration, scheduler enable, and submit commands are issued as host-to-GuC
> + * (H2G) messages over the Command Transport (CT) layer, like all GuC
> + * interactions.
> + *
> + * Completion path
> + * ---------------
> + * When the job's hardware fence signals, the DRM scheduler vfunc ->free_job()
> + * is called; it drops the job's reference, typically freeing it.
> + *
> + * Control-plane messages:
> + * -----------------------
> + * GuC submission scheduler messages form the control plane for queue cleanup,
> + * toggling runnability, and modifying queue properties (e.g., scheduler
> + * priority, timeslice, preemption timeout). Messages are initiated via queue
> + * vfuncs that append a control message to the queue. They are processed on the
> + * same single-threaded DRM scheduler workqueue that runs ->run_job() and
> + * ->free_job().
> + *
> + * Lockless model:
> + * ---------------
> + * ->run_job(), ->free_job(), and the message handlers execute as work items on
> + * a single-threaded DRM scheduler workqueue. Per queue, this provides built-in
> + * mutual exclusion: only one of these items can run at a time. As a result,
> + * these paths are lockless with respect to per-queue state tracking. (Global
> + * or cross-queue data structures still use their own synchronization.)
> + *
> + * Stopping / starting:
> + * --------------------
> + * The submission backend supports two scopes of quiesce control:
> + *
> + *  - Per-queue stop/start:
> + *    The single-threaded DRM scheduler workqueue for a specific queue can be
> + *    stopped and started dynamically. Stopping synchronously quiesces that
> + *    queue's worker (lets any in-flight item finish and prevents new items from
> + *    starting), yielding a stable snapshot while an external operation (e.g.,
> + *    job timeout handling) inspects/updates state and performs any required
> + *    fixups. While stopped, no submission, message, or ->free_job() work runs
> + *    for that queue. When the operation completes, the queue is started; any
> + *    pending items are then processed in order on the same worker. Other queues
> + *    continue to run unaffected.
> + *
> + *  - Global (per-GT) stop/start:
> + *    Implemented on top of the per-queue stop/start primitive: the driver
> + *    stops (or starts) each queue on the GT to obtain a device-wide stable
> + *    snapshot. This is used by coordinated recovery flows (GT reset, PM resume,
> + *    VF post migration recovery). Queues created while the global stop is in
> + *    effect (i.e., future queues) initialize in the stopped state and remain
> + *    stopped until the global start. After recovery fixups are complete, a
> + *    global start iterates queues to start all eligible ones and resumes normal
> + *    submission.
> + *
> + * State machine:
> + * --------------
> + * The submission state machine is the driver's shadow of the GuC-visible queue
> + * state (e.g., registered, runnable, scheduler properties). It tracks the
> + * transitions we intend to make (issued as H2G commands), marking them pending
> + * until acknowledged via G2H or otherwise observed as applied. It also records
> + * the origin of each transition (->run_job(), timeout handler, explicit control
> + * message, etc.).
> + *
> + * Because H2G commands and/or GuC submission state can be lost across GT reset,
> + * PM resume, or VF post migration recovery, this bookkeeping lets recovery
> + * decide which operations to replay, which to elide, and which need fixups,
> + * restoring a consistent queue state without additional per-queue locks.
> + *
> + * Job timeouts:
> + * -------------
> + * To prevent jobs from running indefinitely and violating dma-fence signaling
> + * rules, the DRM scheduler tracks how long each job has been running. If a
> + * threshold is exceeded, it calls ->timeout_job().
> + *
> + * ->timeout_job() stops the queue, samples the LRC context timestamps to
> + * confirm the job actually started and has exceeded the allowed runtime, and
> + * then, if confirmed, signals all pending jobs' fences and initiates queue
> + * teardown. Finally, the queue is started.
> + *
> + * Job timeout handling runs on a per-GT, single-threaded recovery workqueue
> + * that is shared with other recovery paths (e.g., GT reset handling, VF
> + * resume). This guarantees only one recovery action executes at a time.
> + *
> + * Queue teardown:
> + * ---------------
> + * Teardown can be triggered by: (1) userspace closing the queue; (2) a G2H
> + * queue-reset notification; (3) a G2H memory_cat_error for the queue; or (4)
> + * in-flight jobs detected on the queue during GT reset.
> + *
> + * In all cases teardown is driven via the timeout path by setting the queue's
> + * DRM scheduler timeout to zero, forcing an immediate ->timeout_job() pass.
> + *
> + * Reference counting and final queue destruction:
> + * -----------------------------------------------
> + * Jobs reference-count the queue; queues hold a reference to the VM. When a
> + * queue's reference count reaches zero (e.g., all jobs are freed and the
> + * userspace handle is closed), the queue is not destroyed immediately because
> + * the GuC may still reference its state.
> + *
> + * Instead, a control-plane cleanup message is appended to remove GuC-side
> + * references (e.g., disable runnability, deregister). Once the final G2H
> + * confirming that GuC no longer references the queue is eligible for
> + * destruction.
> + *
> + * To avoid freeing the queue from within its own DRM scheduler workqueue (which
> + * would risk use-after-free), the actual destruction is deferred to a separate
> + * work item queued on a dedicated destruction workqueue.
> + *
> + * GT resets:
> + * ----------
> + * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
> + * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
> + * as follows:
> + *
> + * 1) Quiesce:
> + *    - Stop all queues (global submission stop). Per-queue workers finish any
> + *      in-flight item and then stop; newly created queues during the window
> + *      initialize in the stopped state.
> + *    - Abort any waits on CT/G2H to avoid deadlock.
> + *
> + * 2) Sanitize driver shadow state:
> + *    - For each queue, clear GuC-derived bits in the submission state machine
> + *      (e.g., registered/enabled) and mark in-flight H2G transitions as lost.
> + *    - Convert/flush any side effects of lost H2G.
> + *
> + * 3) Decide teardown vs. replay:
> + *    - If a queue's LRC seqno indicates that a job started but did not
> + *      complete, initiate teardown for that queue via the timeout path.
> + *    - If no job started, keep the queue for replay.
> + *
> + * 4) Resume:
> + *    - Start remaining queues; resubmit pending jobs.
> + *    - Queues marked for teardown remain stopped/destroyed.
> + *
> + * The entire sequence runs on the per-GT single-threaded recovery worker,
> + * ensuring only one recovery action executes at a time; a runtime PM reference
> + * is held for the duration.
> + *
> + * PM resume:
> + * ----------
> + * PM resume assumes all GuC state is lost (the device may have been powered
> + * down). It reuses the GT reset recovery path, but executes in the context of
> + * the caller that wakes the device (runtime PM or system resume).
> + *
> + * Suspend entry:
> + *  - Control-plane message work is quiesced; state toggles that require an
> + *    active device are not enqueued while suspended.
> + *  - Per-queue scheduler workers are stopped before the device is allowed to
> + *    suspend.
> + *  - Barring driver bugs, no queues should have in-flight jobs at
> + *    suspend/resume..
> + *
> + * On resume, run the GT reset recovery flow and then start eligible queues.
> + *
> + * Runtime PM and state-change ordering:
> + * -------------------------------------
> + * Runtime/system PM transitions must not race with per-queue submission and
> + * state updates.
> + *
> + * Execution contexts and RPM sources:
> + *  - Scheduler callbacks (->run_job(), ->free_job(), ->timeout_job()):
> + *    executed with an active RPM ref held by the in-flight job.
> + *  - Control-plane message work:
> + *    enqueued from IOCTL paths that already hold an RPM ref; the message path
> + *    itself does not get/put RPM. State toggles are only issued while active.
> + *    During suspend entry, message work is quiesced and no new toggles are
> + *    enqueued until after resume.
> + *  - G2H handlers:
> + *    dispatched with an RPM ref guaranteed by the CT layer.
> + *  - Recovery phases (GT reset/VF post migration recovery):
> + *    explicitly get/put an RPM ref for their duration on the per-GT recovery
> + *    worker.
> + *
> + * Consequence:
> + *  - All submission/state mutations run with an RPM reference. The PM core
> + *    cannot enter suspend while these updates are in progress, and resume is
> + *    complete before updates execute. This prevents PM state changes from
> + *    racing with queue state changes.
> + *
> + * VF post migration recovery:
> + * ---------------------------
> + * VF post migration recovery resembles a GT reset, but GuC submission state is
> + * expected to persist across migration; in-flight H2G commands may be lost

I don't think H2Gs can be lost. GuC is expected to either finish or not 
read them, and

after recovery they can be all executed. They only require GGTT fixups.

It is our decision that we scrap them, then re-assess and re-issue the 
commands by manipulating

states of entities which issued them. Maybe:

---

expected to persist across migration; GGTT base/offsets may change, 
requiring update of all references to it, including in CTBs, LRCs, and 
on rings.

For a wider view on that, see `VF restore procedure in PF KMD and VF 
KMD`_.Recovery proceeds as follows:

---

-Tomasz

> , and
> + * GGTT base/offsets may change. Recovery proceeds as follows:
> + *
> + * 1) Quiesce:
> + *    - Stop all queues and abort waits (as with GT reset) to obtain a stable
> + *      snapshot.
> + *    - Queues created while VF post migration recovery is in-flight initialize
> + *      in the stopped state.
> + *
> + * 2) Treat H2G as lost and prepare in-place resubmission (GuC/CT down):
> + *    - Treat in-flight H2G (enable/disable, etc.) as dropped; update shadow
> + *      bits to a safe baseline and tag the ops as "needs replay".
> + *    - Quarantine device-visible submission state: set the GuC-visible LRC ring
> + *      tail equal to the head (and, for WQ-based submission, set the WQ
> + *      descriptor head == tail) so that when the GuC comes up it will not process
> + *      any entries that were built with stale GGTT addresses.
> + *    - Reset the software ring tail to the original value captured at the
> + *      submission of the oldest pending job, so the write pointer sits exactly
> + *      where that job was originally emitted.
> + *
> + * 3) Replay and resubmit once GuC/CT is live:
> + *    - VF post migration recovery invokes ->run_job() for pending jobs;
> + *      ->emit_job() overwrites ring instructions in place, fixes GGTT fields,
> + *      then advances the LRC tail (and WQ descriptor for width > 1). Required
> + *      submission H2G(s) are reissued and fresh WQ entries are written.
> + *    - Queue lost control-plane operations (scheduling-state toggles, cleanup)
> + *      in order via the message path.
> + *    - Start the queues to process the queued control-plane operations and run
> + *      the resubmitted jobs.
> + *
> + * The goal is to preserve both job and queue state; no teardown is performed
> + * in this flow. The sequence runs on the per-GT single-threaded recovery
> + * worker with a held runtime PM reference.
> + *
> + * Waiters during VF post migration recovery
> + * -----------------------------------------
> + * The submission backend frequently uses wait_event_timeout() to wait on
> + * GuC-driven conditions. Across VF migration/recovery two issues arise:
> + * 1) The timeout does not account for migration downtime and may expire
> + *    prematurely, triggering undesired actions (e.g., GT reset, prematurely
> + *    signaling a fence).
> + * 2) Some waits target GuC work that cannot complete until VF recovery
> + *    finishes; these typically sit on the queue-stopping path.
> + *
> + * To handle this, all waiters must atomically test the "GuC down / VF-recovery
> + * in progress" condition (e.g., VF_RESFIX_BLOCKED) both before sleeping and
> + * after wakeup. The flag is coherent with VF migration: vCPUs observe it
> + * immediately on unhalt, and it is cleared only after the GuC/CT is live again.
> + * If set, the waiter must either (a) abort the wait without side effects, or
> + * (b) re-arm the wait with a fresh timeout once the GuC/CT is live. Timeouts
> + * that occur while GuC/CT are down are non-fatal—the VF-recovery path will
> + * rebuild state—and must not trigger recovery or teardown.
> + *
> + * Relation to reclaim:
> + * --------------------
> + * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
> + * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
> + * message handling, and all recovery paths) lies on the reclaim path and must
> + * be reclaim-safe.
> + *
> + * Practical implications:
> + * - No memory allocations in these paths (avoid any allocation that could
> + *   recurse into reclaim or sleep).
> + * - The global submission-state lock may be taken from reclaim-tainted contexts
> + *   (timeout/recovery). Any path that acquires it (including queue init/destroy)
> + *   must not allocate or take locks that can recurse into reclaim while holding
> + *   it; keep the critical section to state/xarray updates.
> + */
> +
>   static struct xe_guc *
>   exec_queue_to_guc(struct xe_exec_queue *q)
>   {
--------------39sFFHoeWLS7A1yGL9lTQNKl
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/29/2025 4:55 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250929025542.1486303-12-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">Add kernel-doc to xe_guc_submit.c describing the submission path,
the per-queue single-threaded model with pause/resume, the driver shadow
state machine and lost-H2G replay, job timeout handling, recovery flows
(GT reset, PM resume, VF resume), and reclaim constraints.

v2:
 - Mirror tweaks for clarity
 - Add new doc to Xe rst files
v3:
 - Clarify global vs per-queue stop / start
 - Clarify VF resume flow
 - Add section for 'Waiters during VF resume'
 - Add section for 'Page-faulting queues during VF migration'
 - Add section for 'GuC-ID assignment'
 - Add section for 'Reference counting and final queue destruction'
v4:
 - s/VF resume/VF post migration recovery (Tomasz)

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 Documentation/gpu/xe/index.rst     |   1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 282 +++++++++++++++++++++++++++++
 2 files changed, 283 insertions(+)

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 88b22fad880e..692c544b164c 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -28,3 +28,4 @@ DG2, etc is provided to prototype the driver.
    xe_device
    xe-drm-usage-stats.rst
    xe_configfs
+   xe_guc_submit
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 70306f902ba5..cd5e506527fe 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -46,6 +46,288 @@
 #include &quot;xe_trace.h&quot;
 #include &quot;xe_vm.h&quot;
 
+/*
+ * DOC: Overview
+ *
+ * The GuC submission backend is responsible for submitting GPU jobs to the GuC
+ * firmware, assigning per-queue GuC IDs, tracking submission state via a
+ * driver-side state machine, handling GuC-to-host (G2H) messages, tracking
+ * outstanding jobs, managing job timeouts and queue teardown, and providing
+ * recovery when GuC state is lost. It is built on top of the DRM scheduler
+ * (drm_sched).
+ *
+ * GuC ID assignment:
+ * ------------------
+ * Each queue is assigned a unique GuC ID at queue init. The ID is used in all
+ * H2G/G2H to identify the queue and remains reserved until final destruction,
+ * when the GuC is known to hold no references to it.
+ *
+ * The backend maintains a reverse map GuC-ID -&gt; queue to resolve targets for
+ * G2H handlers and to iterate all queues when required (e.g., recovery). This
+ * map is protected by submission_state.lock, a global (per-GT) lock. Lockless
+ * lookups are acceptable in paths where the queue’s lifetime is otherwise
+ * pinned and it cannot disappear underneath the operation (e.g., G2H handlers).
+ *
+ * Basic submission flow
+ * ---------------------
+ * Submission is driven by the DRM scheduler vfunc -&gt;run_job(). The flow is:
+ *
+ * 1) Emit the job's ring instructions.
+ * 2) Advance the LRC ring tail:
+ *    - width == 1: simple memory write,
+ *    - width  &gt; 1: append a GuC workqueue (WQ) item.
+ * 3) If the queue is unregistered, issue a register H2G for the context.
+ * 4) Trigger execution via a scheduler enable or context submit command.
+ * 5) Return the job's hardware fence to the DRM scheduler.
+ *
+ * Registration, scheduler enable, and submit commands are issued as host-to-GuC
+ * (H2G) messages over the Command Transport (CT) layer, like all GuC
+ * interactions.
+ *
+ * Completion path
+ * ---------------
+ * When the job's hardware fence signals, the DRM scheduler vfunc -&gt;free_job()
+ * is called; it drops the job's reference, typically freeing it.
+ *
+ * Control-plane messages:
+ * -----------------------
+ * GuC submission scheduler messages form the control plane for queue cleanup,
+ * toggling runnability, and modifying queue properties (e.g., scheduler
+ * priority, timeslice, preemption timeout). Messages are initiated via queue
+ * vfuncs that append a control message to the queue. They are processed on the
+ * same single-threaded DRM scheduler workqueue that runs -&gt;run_job() and
+ * -&gt;free_job().
+ *
+ * Lockless model:
+ * ---------------
+ * -&gt;run_job(), -&gt;free_job(), and the message handlers execute as work items on
+ * a single-threaded DRM scheduler workqueue. Per queue, this provides built-in
+ * mutual exclusion: only one of these items can run at a time. As a result,
+ * these paths are lockless with respect to per-queue state tracking. (Global
+ * or cross-queue data structures still use their own synchronization.)
+ *
+ * Stopping / starting:
+ * --------------------
+ * The submission backend supports two scopes of quiesce control:
+ *
+ *  - Per-queue stop/start:
+ *    The single-threaded DRM scheduler workqueue for a specific queue can be
+ *    stopped and started dynamically. Stopping synchronously quiesces that
+ *    queue's worker (lets any in-flight item finish and prevents new items from
+ *    starting), yielding a stable snapshot while an external operation (e.g.,
+ *    job timeout handling) inspects/updates state and performs any required
+ *    fixups. While stopped, no submission, message, or -&gt;free_job() work runs
+ *    for that queue. When the operation completes, the queue is started; any
+ *    pending items are then processed in order on the same worker. Other queues
+ *    continue to run unaffected.
+ *
+ *  - Global (per-GT) stop/start:
+ *    Implemented on top of the per-queue stop/start primitive: the driver
+ *    stops (or starts) each queue on the GT to obtain a device-wide stable
+ *    snapshot. This is used by coordinated recovery flows (GT reset, PM resume,
+ *    VF post migration recovery). Queues created while the global stop is in
+ *    effect (i.e., future queues) initialize in the stopped state and remain
+ *    stopped until the global start. After recovery fixups are complete, a
+ *    global start iterates queues to start all eligible ones and resumes normal
+ *    submission.
+ *
+ * State machine:
+ * --------------
+ * The submission state machine is the driver's shadow of the GuC-visible queue
+ * state (e.g., registered, runnable, scheduler properties). It tracks the
+ * transitions we intend to make (issued as H2G commands), marking them pending
+ * until acknowledged via G2H or otherwise observed as applied. It also records
+ * the origin of each transition (-&gt;run_job(), timeout handler, explicit control
+ * message, etc.).
+ *
+ * Because H2G commands and/or GuC submission state can be lost across GT reset,
+ * PM resume, or VF post migration recovery, this bookkeeping lets recovery
+ * decide which operations to replay, which to elide, and which need fixups,
+ * restoring a consistent queue state without additional per-queue locks.
+ *
+ * Job timeouts:
+ * -------------
+ * To prevent jobs from running indefinitely and violating dma-fence signaling
+ * rules, the DRM scheduler tracks how long each job has been running. If a
+ * threshold is exceeded, it calls -&gt;timeout_job().
+ *
+ * -&gt;timeout_job() stops the queue, samples the LRC context timestamps to
+ * confirm the job actually started and has exceeded the allowed runtime, and
+ * then, if confirmed, signals all pending jobs' fences and initiates queue
+ * teardown. Finally, the queue is started.
+ *
+ * Job timeout handling runs on a per-GT, single-threaded recovery workqueue
+ * that is shared with other recovery paths (e.g., GT reset handling, VF
+ * resume). This guarantees only one recovery action executes at a time.
+ *
+ * Queue teardown:
+ * ---------------
+ * Teardown can be triggered by: (1) userspace closing the queue; (2) a G2H
+ * queue-reset notification; (3) a G2H memory_cat_error for the queue; or (4)
+ * in-flight jobs detected on the queue during GT reset.
+ *
+ * In all cases teardown is driven via the timeout path by setting the queue's
+ * DRM scheduler timeout to zero, forcing an immediate -&gt;timeout_job() pass.
+ *
+ * Reference counting and final queue destruction:
+ * -----------------------------------------------
+ * Jobs reference-count the queue; queues hold a reference to the VM. When a
+ * queue's reference count reaches zero (e.g., all jobs are freed and the
+ * userspace handle is closed), the queue is not destroyed immediately because
+ * the GuC may still reference its state.
+ *
+ * Instead, a control-plane cleanup message is appended to remove GuC-side
+ * references (e.g., disable runnability, deregister). Once the final G2H
+ * confirming that GuC no longer references the queue is eligible for
+ * destruction.
+ *
+ * To avoid freeing the queue from within its own DRM scheduler workqueue (which
+ * would risk use-after-free), the actual destruction is deferred to a separate
+ * work item queued on a dedicated destruction workqueue.
+ *
+ * GT resets:
+ * ----------
+ * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
+ * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
+ * as follows:
+ *
+ * 1) Quiesce:
+ *    - Stop all queues (global submission stop). Per-queue workers finish any
+ *      in-flight item and then stop; newly created queues during the window
+ *      initialize in the stopped state.
+ *    - Abort any waits on CT/G2H to avoid deadlock.
+ *
+ * 2) Sanitize driver shadow state:
+ *    - For each queue, clear GuC-derived bits in the submission state machine
+ *      (e.g., registered/enabled) and mark in-flight H2G transitions as lost.
+ *    - Convert/flush any side effects of lost H2G.
+ *
+ * 3) Decide teardown vs. replay:
+ *    - If a queue's LRC seqno indicates that a job started but did not
+ *      complete, initiate teardown for that queue via the timeout path.
+ *    - If no job started, keep the queue for replay.
+ *
+ * 4) Resume:
+ *    - Start remaining queues; resubmit pending jobs.
+ *    - Queues marked for teardown remain stopped/destroyed.
+ *
+ * The entire sequence runs on the per-GT single-threaded recovery worker,
+ * ensuring only one recovery action executes at a time; a runtime PM reference
+ * is held for the duration.
+ *
+ * PM resume:
+ * ----------
+ * PM resume assumes all GuC state is lost (the device may have been powered
+ * down). It reuses the GT reset recovery path, but executes in the context of
+ * the caller that wakes the device (runtime PM or system resume).
+ *
+ * Suspend entry:
+ *  - Control-plane message work is quiesced; state toggles that require an
+ *    active device are not enqueued while suspended.
+ *  - Per-queue scheduler workers are stopped before the device is allowed to
+ *    suspend.
+ *  - Barring driver bugs, no queues should have in-flight jobs at
+ *    suspend/resume..
+ *
+ * On resume, run the GT reset recovery flow and then start eligible queues.
+ *
+ * Runtime PM and state-change ordering:
+ * -------------------------------------
+ * Runtime/system PM transitions must not race with per-queue submission and
+ * state updates.
+ *
+ * Execution contexts and RPM sources:
+ *  - Scheduler callbacks (-&gt;run_job(), -&gt;free_job(), -&gt;timeout_job()):
+ *    executed with an active RPM ref held by the in-flight job.
+ *  - Control-plane message work:
+ *    enqueued from IOCTL paths that already hold an RPM ref; the message path
+ *    itself does not get/put RPM. State toggles are only issued while active.
+ *    During suspend entry, message work is quiesced and no new toggles are
+ *    enqueued until after resume.
+ *  - G2H handlers:
+ *    dispatched with an RPM ref guaranteed by the CT layer.
+ *  - Recovery phases (GT reset/VF post migration recovery):
+ *    explicitly get/put an RPM ref for their duration on the per-GT recovery
+ *    worker.
+ *
+ * Consequence:
+ *  - All submission/state mutations run with an RPM reference. The PM core
+ *    cannot enter suspend while these updates are in progress, and resume is
+ *    complete before updates execute. This prevents PM state changes from
+ *    racing with queue state changes.
+ *
+ * VF post migration recovery:
+ * ---------------------------
+ * VF post migration recovery resembles a GT reset, but GuC submission state is
+ * expected to persist across migration; in-flight H2G commands may be lost</pre>
    </blockquote>
    <p>I don't think H2Gs can be lost. GuC is expected to either finish
      or not read them, and</p>
    <p>after recovery they can be all executed. They only require GGTT
      fixups.</p>
    <p>It is our decision that we scrap them, then re-assess and
      re-issue the commands by manipulating</p>
    <p>states of entities which issued them. Maybe:</p>
    <p>---</p>
    <p>expected to persist across migration;&nbsp;<span style="white-space: pre-wrap">GGTT base/offsets may change, requiring update of all references to it, including in </span><span style="white-space: pre-wrap">CTBs, </span><span style="white-space: pre-wrap">LRCs, and on rings.</span></p>
    <p><span style="white-space: pre-wrap">For a wider view on that, see `VF restore procedure in PF KMD and VF KMD`_.</span><span style="white-space: pre-wrap"> Recovery proceeds as follows:</span></p>
    <p><span style="white-space: pre-wrap">---</span></p>
    <p><span style="white-space: pre-wrap">-Tomasz</span></p>
    <blockquote type="cite" cite="mid:20250929025542.1486303-12-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">, and
+ * GGTT base/offsets may change. Recovery proceeds as follows:
+ *
+ * 1) Quiesce:
+ *    - Stop all queues and abort waits (as with GT reset) to obtain a stable
+ *      snapshot.
+ *    - Queues created while VF post migration recovery is in-flight initialize
+ *      in the stopped state.
+ *
+ * 2) Treat H2G as lost and prepare in-place resubmission (GuC/CT down):
+ *    - Treat in-flight H2G (enable/disable, etc.) as dropped; update shadow
+ *      bits to a safe baseline and tag the ops as &quot;needs replay&quot;.
+ *    - Quarantine device-visible submission state: set the GuC-visible LRC ring
+ *      tail equal to the head (and, for WQ-based submission, set the WQ
+ *      descriptor head == tail) so that when the GuC comes up it will not process
+ *      any entries that were built with stale GGTT addresses.
+ *    - Reset the software ring tail to the original value captured at the
+ *      submission of the oldest pending job, so the write pointer sits exactly
+ *      where that job was originally emitted.
+ *
+ * 3) Replay and resubmit once GuC/CT is live:
+ *    - VF post migration recovery invokes -&gt;run_job() for pending jobs;
+ *      -&gt;emit_job() overwrites ring instructions in place, fixes GGTT fields,
+ *      then advances the LRC tail (and WQ descriptor for width &gt; 1). Required
+ *      submission H2G(s) are reissued and fresh WQ entries are written.
+ *    - Queue lost control-plane operations (scheduling-state toggles, cleanup)
+ *      in order via the message path.
+ *    - Start the queues to process the queued control-plane operations and run
+ *      the resubmitted jobs.
+ *
+ * The goal is to preserve both job and queue state; no teardown is performed
+ * in this flow. The sequence runs on the per-GT single-threaded recovery
+ * worker with a held runtime PM reference.
+ *
+ * Waiters during VF post migration recovery
+ * -----------------------------------------
+ * The submission backend frequently uses wait_event_timeout() to wait on
+ * GuC-driven conditions. Across VF migration/recovery two issues arise:
+ * 1) The timeout does not account for migration downtime and may expire
+ *    prematurely, triggering undesired actions (e.g., GT reset, prematurely
+ *    signaling a fence).
+ * 2) Some waits target GuC work that cannot complete until VF recovery
+ *    finishes; these typically sit on the queue-stopping path.
+ *
+ * To handle this, all waiters must atomically test the &quot;GuC down / VF-recovery
+ * in progress&quot; condition (e.g., VF_RESFIX_BLOCKED) both before sleeping and
+ * after wakeup. The flag is coherent with VF migration: vCPUs observe it
+ * immediately on unhalt, and it is cleared only after the GuC/CT is live again.
+ * If set, the waiter must either (a) abort the wait without side effects, or
+ * (b) re-arm the wait with a fresh timeout once the GuC/CT is live. Timeouts
+ * that occur while GuC/CT are down are non-fatal—the VF-recovery path will
+ * rebuild state—and must not trigger recovery or teardown.
+ *
+ * Relation to reclaim:
+ * --------------------
+ * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
+ * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
+ * message handling, and all recovery paths) lies on the reclaim path and must
+ * be reclaim-safe.
+ *
+ * Practical implications:
+ * - No memory allocations in these paths (avoid any allocation that could
+ *   recurse into reclaim or sleep).
+ * - The global submission-state lock may be taken from reclaim-tainted contexts
+ *   (timeout/recovery). Any path that acquires it (including queue init/destroy)
+ *   must not allocate or take locks that can recurse into reclaim while holding
+ *   it; keep the critical section to state/xarray updates.
+ */
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
</pre>
    </blockquote>
  </body>
</html>

--------------39sFFHoeWLS7A1yGL9lTQNKl--
