Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75349E98E10
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 10:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E64A10E2C0;
	Mon, 23 Feb 2026 10:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOR3KTgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D24C10E2C0
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771840857; x=1803376857;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=9BAOiQHsMHydETX43alGSUaFPpemO1qEgxCVArsxrZE=;
 b=eOR3KTgoPM0XvS8Ep9+gl116SN4Po6KYR3c4hBHqtVa5DAbV2Mu6ifWw
 oGnJh+ob/LuGphkyK/HDtsEIBLUiBnk6qZUiqQZSFSCxPEHYBUUYgHW77
 BcQ7/By1n1r74GIHSnwLXwgMW1flbeGip6zswG+CHsa0ODr6tKvgfGv12
 pxpilzM480lrMTY1xsMFbXPQ/4B+8H/Gan8SaDRqN32i150fmodwxJ3JM
 Il9qO55EyFYZHr5shUR/DGw4k/Hjo/UfLem+yz6DbukuxP1ggVxsDHnj7
 a5ON639zDeW5Nn65su78Gc+U7ZqZO96idwFGXT6W+DTVy2GKZV9wtgnHB Q==;
X-CSE-ConnectionGUID: Bl3eUPOeT5ODoS16nhPX2Q==
X-CSE-MsgGUID: nfNJSPdJTtyCJBB1WV1afg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76694094"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76694094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 02:00:54 -0800
X-CSE-ConnectionGUID: klJCPpAwT96NlauPSWPjhw==
X-CSE-MsgGUID: CmsZQpnkR2yzxjzIjZAMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215356653"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 02:00:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 02:00:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 02:00:53 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 02:00:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTf49JDYsaAunjzka/IJXoXTvYfn8Yjx4pIDTi/P20ZbO5CdKA51davmYtONqEDAeU7dvp3KomPhfk/+xdnswDIrZtJHykTIIpO76svOMDg8dHMz3YMjKo5tCUPCJc3ipbEUjLsJc0vToJY0qMAvdIfUpUzpxJVvp4NbA70RUy/UcyfNVt3+qHIHTD8QplFiH2SnZQlZifdISX21m486KhKU7epSvsfpql54FibwNX8G0xL5kjOSOxzbW9mfDbCWu4aCbq5x02Koew3o8APSkX+b+3iag6XuWPeizQfgTLffrtkFCAbIBifk79VUmqx9PyJ8j7BesSAeivRi2jB0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHjDUxOrfGNxRBx++67eZjeU3TOabxzvqCs7kyQPIe8=;
 b=QQHy3m25D0pFAUrW3QbxXqFMhOPyN3EX0qIdUa1QKpybSVxggPJ3RXftlz7i+HBuXGGxPzImroJsHrFLkHiAw5Lh59nbyoU+L4rqPb0l6qitMihsfcOFcaCN+sVdzY+mKPI4IoLEP7SadLG3GhAN6SSas9eaRTBVD/bAYqNuigJnXrswi9ppMEnpLVa17gHC8MUXUJiunnzzrh47juLh8CIwUgT5GcCPoXiqeGU4t28E81B3DGjPuh9E8EcLeUw9RFhEIXpqQoosNC3PQX6wwqmP0o8jF75gli7NRtDFcvHTmdJZjQfTNW51fZl9ppVYFjte5fJWJY/AO4n23SU4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:00:49 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 10:00:49 +0000
Date: Mon, 23 Feb 2026 15:30:40 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/23] drm/xe: Consolidate workaround entries for
 Wa_14019449301
Message-ID: <aZwlSLhpTdDqzqJI@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-5-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-5-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba80377-4d7c-47c4-24d7-08de72c26b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUpWdGdYNlQ5aG5aUmtFb0o3SUNnYngrMWw2Y2k0aGdLTk9HR3FZQWdZREh4?=
 =?utf-8?B?MVA1TllaQ28rYm92K0tpL05UNGQvMWlLdkc4SCtIa0hqNE5WaDh0amxLbzVB?=
 =?utf-8?B?WHBEcEduTUQvQWVxeXdEZ0dkZUdGK29FZnhicXkyMjR0cjArMzl6Q3kyQ3Rz?=
 =?utf-8?B?Tk5obnhQS0ZEU28xbGkxNnlaaWw4ZTlnNWk4VTQwZzlEdHZBQTRacjlvS3lC?=
 =?utf-8?B?YS83WWdGeVJSRWlPcVNQMDBTZWJqZHFzU1hqWjVrY1JaSEJsZk9uQ1RuZ2VC?=
 =?utf-8?B?YUcyMkxMYjVCR3ZlZTlUcHkyUFdtNGFUVnZsRUZvRFNWZUhhTlJHMmQwbGRh?=
 =?utf-8?B?ak5ZcWpSa0VjM3NqdmExMEU5cndSOXRPdUV2Z21yaGxtVW0zVkpFdkVYeWIw?=
 =?utf-8?B?NFluZk4wTnFHMC82aklob0hWR05QL0VhVlF1YU51T1VLV3g1dy8vdzhzQWhp?=
 =?utf-8?B?dlh2NW5TbDZPYWVoV1pHMnVGSk16K3lUZWxkcnM5elBYaCsvSUVtVTBDaFBK?=
 =?utf-8?B?N0VNdGdOTEtxMzdJL0NuVTdid1BxdDQzaW5YRXd5WjZpZUhTTmtQOGFDUjQw?=
 =?utf-8?B?T3ZtQ1o4ZVJoNjg5MUg4UzlSWjBEaU1YSGg0K2R0S2x6eTVyMml6Sit3SWpU?=
 =?utf-8?B?cExHTzBldFlSTVZDTXIzbU9PbkdWU2ExMWtjeXVyVVNQQmtLeC9VNlp5c1Qz?=
 =?utf-8?B?bVZCbUNOSVJJVEl5VkFqR29vbnk4anBEeXh5NXpCdzg4S3VMYWFnNS9paDNt?=
 =?utf-8?B?Q3c2RDNVblY0VTdtK3pOMWJlVlZSTzFqQnlPWHZTRDVXUzZFMHhRd2VoOGE3?=
 =?utf-8?B?S2xaK0RqemJESzFQM3NWR3NyNU9vT0V0ZWZOZ0M1K1VxVlNqczBKNWZNTTNr?=
 =?utf-8?B?eDYyQk53RWhnaVZLNjVSU3JxMzVEUlJXUk1ZRDh1ZURid1lWVHRkc1g2ZWh0?=
 =?utf-8?B?SzFqYSt0QUFsYlRoaHV0MjZZdFI1UkNmMEhBK0pxbUlqZEN5ZzU4UWZyOEhj?=
 =?utf-8?B?ZEpYR0hIcHk3VWFaUTBSZWVFelo2UXRRV2ovWVQ5ZlgzZCt2MForZlB3NjZj?=
 =?utf-8?B?c2M5VUltdUp1cW9iVFU4WGNyL0FzS3Z6Ukk3TnNnTVIwRFVCYlFXV2hxcUdI?=
 =?utf-8?B?dVlqZ0lwem9ZMUtVVjBzUUt5a0o4SlRqOHMvdE1xcHpTYW8rWlA1OHBtZkRa?=
 =?utf-8?B?VWVPS2R0L2kvZ2EvR2hHUnFndk0zVEVMZVdVTFcxdVpkNWxFdUZOMHYyci9r?=
 =?utf-8?B?Wms5T1JHUTk0bTJIdHQvMFFvdTNrUXBXWk1mTkF3UFEwV1U1blBSclB3enVo?=
 =?utf-8?B?ZXNNTUdRRmdEb0F5cG84QzlaNVJ2a2NEOVJuR3pLRFZmcTE1R2ZMSHFUZ1Fn?=
 =?utf-8?B?b295b2hJRVFwWGhBa1hDczlyYnBoT3UzMFFwRUlhajg0MTIwSjU1KzZLZlVG?=
 =?utf-8?B?RmxtV2QxS1E4bG9GTU1IK0QrNFRCRkRkREU4UytrNFJHOHNUOUR0N3lOZVp3?=
 =?utf-8?B?WjN3VG9SblFZb3JNQUdaeEgwb1JwTk8ybVFDRU5kR1pSNEUwL2NFZno4RCt5?=
 =?utf-8?B?WFNhYW9jd01oOVRyWW93UlhsL2h3bTFNUzZ2b09ybXNJbEd1NDVCNXQwcFdW?=
 =?utf-8?B?OFhabUdPWm9sK1VncnBrY0RHbjJCRC8zdFBUTEJ1dFJ3b3h2alp1LzRwb294?=
 =?utf-8?B?azNxZ01IZmw5eXRwMXBpMHFxYkhtTDJoWUg4Q0pFaHN0RDBFVG1uRmJOaHBj?=
 =?utf-8?B?ZDVXNXplQ3h1WmZwTFNOYWptWlBvdy8xY0Z0RloxVHZMeHRmdnJzaUdlYnZn?=
 =?utf-8?B?TlhIS2YwUmxUbU10WVMyelhTYmZiTkZ2cG1UdmJ1amttaEI5UnBxcUJjL0Ev?=
 =?utf-8?B?VmQ3Z0t3Q3FPWkxacUwxSC9FV25Rem95bFpOUzFIRmViQUNMU1J0WkxJMXFm?=
 =?utf-8?B?V3c3V0ZwMG44QkZGZjVNUUhKbnpnaENuWmZ1ZElwbHNNQUZNSWx6WnN1QytU?=
 =?utf-8?B?dXQxbEtteHdnK2diMENwNzZqNjlEZmRLVE9xaVJ0ckQ4cExybWxQR056SDRZ?=
 =?utf-8?B?VnJ1dUpia1ZhVXgvWTlGZXRYYXpDSjR1VFAzbVRzUFNLcDJCRy9WQVo5dUI4?=
 =?utf-8?Q?MHas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzdRUHZGQmZmRVYzQTBmT0VBNUlTTDUvWWdvN3BVQXFzbjlnVjJxR2dWdHJ2?=
 =?utf-8?B?VDdoOWdya0phSUtEK3lKSU4vVXRYU0FldkcyN2t3MWpkTVBFbkI2OVNEUThv?=
 =?utf-8?B?a0ZQTnBuZERqdnJlcnpvOThLTWlwQjIreDh2ZG94TmhwdlkzbXFObXppdlhl?=
 =?utf-8?B?VjF5Wkt3WHdKS2hBRkNUTWkvVThFbHF0QlJabjNNU3VGVTV4U2NMcENYTFdL?=
 =?utf-8?B?bytWSEJSdnE2S2xTL2d0eExMOHhEazIyVVYydXBxWHdha0srdzgrU0dpSWJt?=
 =?utf-8?B?ZTVLbEJydUZ3WFo0WFoycVI2Q0c4a1VuOWtGT1VIZmhDeE1pV1JISmk3MHpG?=
 =?utf-8?B?QVhaNjUrNWtJTXdzTEJmZm5RMU52d0EwdTVtc1ZJTVVKaU9nZ3hTRlg2LzQ3?=
 =?utf-8?B?T0dMOU4zb3lRZ0xDNngwam1XZXBsK1hJbnVMWjRrNGdtdFo3Z01LQlczSC9o?=
 =?utf-8?B?M0VKeVBjYWRwcGxmT3MrY0kwZVBldWh0UzdDNVd1SmNIZzluRVZ0Rld6YTdp?=
 =?utf-8?B?R2FraFJBOVdZeDNjMzhxbkJHWGdWSm54M3UvT1hJY3RTcU11K2RPSTRVZkhu?=
 =?utf-8?B?TGN5aWh3a05Sbkd3eFF4UWxjcENDWkFYSDBzWW1sNVJrMEorTkEvWHFKeW5D?=
 =?utf-8?B?SnQzRStKZmpvdzZib3NYekkxRHI2UHhuLzY5YzBoS0owSmxCSFFocGZVQ1BC?=
 =?utf-8?B?d3VHbWdNa3Mvb2Ryck9rbTZBNWkzNThzYXpQVUpFamJlYXlsaUsrK25UOFFV?=
 =?utf-8?B?cmVhMmdXbHlITlQ0bXNjV1VLNFZ1Vm44VDJOcit3cnBuUWsvQUpneVFPRG1a?=
 =?utf-8?B?OWRSZmVYM2tSRXI0RkFkcUcrdWowbzc1Q20wZ2c1Vlp4a0FWODQxaHRQVCtm?=
 =?utf-8?B?dU5vTHVuRnBvdllpVDJNTElJdkxHLzF3N1hUWWRBSVZIQVhFWXFwWS9tMlRu?=
 =?utf-8?B?K1V0cjk2TGN2NEVhZi9ndHM5V05meTU1YWpYRklSWUZtamZTRnppQTVaOWxh?=
 =?utf-8?B?YWo5WFZHS2NZQnA2bkNhcEpQWTlUL21FT0d2T0Y5TGx0bmNaSTFTM2lyYkFP?=
 =?utf-8?B?Z01kWDlIV1B5MTh2dmZFVkxTcndRN0t4amMvU0J6cmtmK0lkNVpzbk16WDk2?=
 =?utf-8?B?K1U1OXpIMnc2c1ZkRkEySWI3QUM4NWZ5Zjlyejd6VHVJbmprWGpoY0NuUE9E?=
 =?utf-8?B?Y1ZVaWJqUHdGWHo3TUJyTkJkaUpTSWVIYU9aemFzS09NV0txc05HNVVRZXZJ?=
 =?utf-8?B?dlp0N0RtejhYSXNWNG5lU2ZZNU53YlFEZEt3dk5aSE5JSXdDMENwdjJMaGF5?=
 =?utf-8?B?YXRJOFZwc2JYeC8wN0VIUm1kNDVjUkUvSm80U3BOcWdzdVl6NldtcnhDVW9L?=
 =?utf-8?B?cFFGS2s2U3NZRHFJTHA1MFZaM0RvY0l2eFJ5cS83eE04bVpLb2lwQ0RkRlJN?=
 =?utf-8?B?Vnl1Nnh4Mi9sVkR6VXFDVzhSdU5TemNTOEsrc0lCblpvOUVkSGFUdmtHRFZQ?=
 =?utf-8?B?d0hnV0VRUnkwL2ZlSWlWUm5MckcwdkJ0RVV3eXVYdnp2MFRacU9RWko4R2Rw?=
 =?utf-8?B?bVNUNU4waFFSdTVlaWcyZWhPT2d3ZWkrWlY1a28zcURubXF6ZDlBQ3dVbjZP?=
 =?utf-8?B?ZVFRSnpRQjBmeEhFY0VtM2lQaURGcTkybzJKbjhKeVV0Qjl0WVdTL1BlUUxm?=
 =?utf-8?B?MURzeGFUMnRwSDNUMXpSR3U3ZVl4alpXYUNRR01GdTVYN0k2aWVwNEhXV2h4?=
 =?utf-8?B?dCtlelJWUE8reTl4RzNRenpyRENMOVp1QjR2ZkNXNGRPclNWbG1ONEZ2SlRM?=
 =?utf-8?B?bmx2UzQ5R1V3VnRQVjdPNU9PR2Q4dVJ4WE9NT1lEVm5HREhtUWNXb09qYThV?=
 =?utf-8?B?OUJQMkNScUxxMDgvRDRlUklCWS9HRTJZMmhwa3dJOS96MXFYaWttRHhlaE05?=
 =?utf-8?B?V0FRQlhqS0RmczFnYmtCNTVrQ0tGM2xhR0l2a1o4OC96bUJ0ZElGSVFPdVkx?=
 =?utf-8?B?MmdiZC9DdW9GV09qVm5HMDAwRGVFbVRSMXkxczQrTkg1RlJVeFZ6MlR6cVY3?=
 =?utf-8?B?VmFpdnk1ZGRDZ1J5cjNlOCtlWlQ1RjBzRDBvNHVmc3VhTmp5RzNSL0NZVUpK?=
 =?utf-8?B?SStWS25PSVJmSXc3R0d2VWlmYTNyR3hKbE9Ub0RTQlFPOHVqaFJleml0S0th?=
 =?utf-8?B?Y3ljRXpOOExtMi9DMENIZUZsbENOMHZqc1VMN3JWajJRL3NGay8xL3Y2dU81?=
 =?utf-8?B?eUQxRHdiTjk4YktRbTJRc0hyMllxSVRFMS9vVk5DWEI0cnlIMFB6Um1PTVhq?=
 =?utf-8?B?TDUrdFE4eGZMWVQrTHZ6R2JLN2M0ZEdkczRmL2hoVzdnVkRla3RjVzNPcFF1?=
 =?utf-8?Q?9BK5++pkhZw8Q2yeFuJjeWDK67QVZ20LaygMx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba80377-4d7c-47c4-24d7-08de72c26b2d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:00:48.4767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeKETokOXOZ2llrGZFWM/nCCe2EaUy55R+bSANaD/+BTgYrs0/P3W3SbfSjZe8yTFRhtrumv3PJyuZDmi8p8Nk1w80IpaNsr0NJTRW7sS+Wfyg8APlN6a9NipwMIRMh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_14019449301 applies to both media IP 13.01 and 20.00 and none of the
> version numbers between those are used.  Conslidate the two entries into
> a single range entry.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> 

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 4a8685f2ea985cb67b21bdf8a043ad1dfdfc816d..33e7e33db83175953361ee13dd40af8954c6d838 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -154,6 +154,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("14019449301"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000), ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
>  
>  	/* DG1 */
>  
> @@ -234,11 +239,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> -	{ XE_RTP_NAME("14019449301"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
>  	{ XE_RTP_NAME("16028005424"),
>  	  XE_RTP_RULES(MEDIA_VERSION(2000)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> @@ -258,11 +258,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  
>  	/* Xe2_HPM */
>  
> -	{ XE_RTP_NAME("14019449301"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
> -	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
> -	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> -	},
>  	{ XE_RTP_NAME("16028005424"),
>  	  XE_RTP_RULES(MEDIA_VERSION(1301)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> 
> -- 
> 2.53.0
> 
