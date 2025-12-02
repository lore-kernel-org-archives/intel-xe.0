Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45E9D12671
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 21:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E8310E6AA;
	Tue,  2 Dec 2025 21:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgYmN0WY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A83A10E6AA
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764710235; x=1796246235;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NFOXPSPcRHJ7U4xVLrIiCksMSbem6bjRB927/U03lIM=;
 b=BgYmN0WYqMKf2ErY7TQZUX5bWkYjrXSoCnmEA8FFFIAHsCkh8qUnPWQF
 41Lf/NxKNPoATAa41jOV9eJZtX6ZDdWcd8Ks8bIhgOsVcNCZh0/4fSWR+
 j3dy2P2XTt0eejHx3emE+NdD7b0uKeuLzughVc6xthCrTOCMrLgJLkGtH
 azi/VUCRrFu75XWb0IePU63FbPBNR59WJeetXxv0a6k807egQcFudbG7b
 BR90Amyamvq64qF64XFCTcOI00IM2Gz+D1GJCQsgKa3b2lQUl3HpRnif3
 m8XCBaznXveVxwcRWZy4oo4KQiy1vu4ZQ/XwgRoZrFzBXUuQdaLc/aWE+ Q==;
X-CSE-ConnectionGUID: EE7hyganTTiWEX5Mwjhg2Q==
X-CSE-MsgGUID: mHNTzWosSlKe5tWVfm9mqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54243715"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="54243715"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:17:15 -0800
X-CSE-ConnectionGUID: jHQelhx5ThSYaxlmkyEcWQ==
X-CSE-MsgGUID: v0/7wt40TqmZahM9H0Ur3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199434807"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:17:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:17:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:17:14 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:17:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnPxVUmy9noi0Cw8axRIDSJPqjLSq9AD9EvhGGd5ynX9uSkJX6usN73uCzCblu31ieGJ9c+XnLG7JAQnWFFLIJuWdStlrd94+QRiZ5/59yEm/KV4VmB/KplIjhBacCi3dOKy8NiazrGoVzRPcsHok2sMYuEPgm+ImhRTRTx88d3miKZ2uV6TSdw0P6TXUTAIpfC+FkXkLMSqSeWs5iIv7cMjgOVaEBNFSP/gF/Ev+xFjQ5j9ZwMIlzK3hg06KOsKbFmRV847cXAWqXx982hMZuoKqwJO5KYAJuAlTaHIUlrlnvchxmXdo09k7rVxRTpOdGaP03SSw9QSl0DjXUsimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CghhNpW8uoaSoenAD/GWa11ngYyn6kk8QAJXssZEuQ=;
 b=gLuXOeHPMuXc+zZS9kj0GCFo+tBrdz7y1GRpIagOORUg+ciDjzzIfclLOTcb6VGXVuUUfGREY540fC/bhIxBiYh69A2oXYO0zz59F9SA0EoINxKb7GRsUWhIcq6yRdhREDIUR6XZhsk+Tmnmez7eakPuQ0NarGX0Lv/AtinfFwYuzyhTqCQAWBVUZvc9vAZ7za6UtWAnMcqssf7j5Yt8oqPPo3iaFuUEOY2ZsmPi/skdtFd8eRGFCOJ7AtyMdA/+VD6rJfvABGmRqbas1IU5i6GQsBOpIkxDl6zLy5SERLQnNsSNRtx3woz192G4ImWg8iPej9Zb1VbZ6LEjEimSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:17:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:17:06 +0000
Message-ID: <3a5dba85-44b1-453b-921d-420ce26d55b0@intel.com>
Date: Tue, 2 Dec 2025 22:17:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-16-daniele.ceraolospurio@intel.com>
 <f9690fe0-a3b0-4ecd-a488-72457440a8c8@intel.com>
 <f14a6c48-fe8b-46d7-974b-0fa475b3b521@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f14a6c48-fe8b-46d7-974b-0fa475b3b521@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: ca300e2d-ce70-4a5c-6e60-08de31e8258a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V21SU3UweHpvWVdVY253eTZmWFd0QTRaVG1RNWh4Q24zeFFydEMvWFU1WTBz?=
 =?utf-8?B?VjdwQkxldnp0RGZ0UnBnK3RDQ3dObG9SdDJQYUFaY1hmOFdtZlZhdFAzTFRp?=
 =?utf-8?B?Um1XT3dITUZaa2VDODdhMFRodm0yN3R2Z1YvaTB6ZGJWUVVHcno4c0hxdWpB?=
 =?utf-8?B?UDgzbUhvaHN2VURrRTMxVUVjUEFoUktQdTc0ZmdkMkRtMHo5RGVGMWwvejJE?=
 =?utf-8?B?ZTZ5T2MvYUtPWHBZRUEzK1ZvL1QvWk9xVHBJaDZsODZBMUFOZ1l6d25tcS9v?=
 =?utf-8?B?Mm9DTmtIb0o4UlRqNFlPUFJoM0tlRDNRbmdJMzhiUUxEUWY1ZGtVS1VMVGI4?=
 =?utf-8?B?MXlHVS9tOWRHUDVaeHdUY3pRZjdSQUVsUDdvWXA0Q28xaldta0NzQm95MDlN?=
 =?utf-8?B?OU04RllMZmpDa3hZQ1ViZWw0NTZqVDNoRXRsRDVoOEFwUFUvZTgzejFxQ00x?=
 =?utf-8?B?Z3lGVU1aU1FZN0RuVThzeW11d3I5Skdsc3lobUpmUE8vWE0wTlVBQTVpbitS?=
 =?utf-8?B?eWZaWVBsZWM0M0pRQ1ZaZTg5QlhtK2dMaVJpbmlWWlNrNzQ4aVhDTll4T283?=
 =?utf-8?B?WDh4bFAvQklQdXdWTDNtU3dKeURFQjUweDFJYk91M1BEdEZsOURQcytJUzQ5?=
 =?utf-8?B?dnhSRGR6R0JENGhsWm5WWU5vVmZiendKUzQ5L2ZiVVhyemhiSUJxVGc0dmtT?=
 =?utf-8?B?OEhJOVBoV0MvYS9jeGVtQ1E3czUwK05VNEMwbzh6SWZxTUJKS3d1L3FkWlNO?=
 =?utf-8?B?SGNOTzJVUEt4eGVrN3RjSEd1TVBtdjBNWWJYVmwvV0pTYVE0SERkWWthWkF0?=
 =?utf-8?B?bFR1TVVyRWczMHNmMGZUZDlQdjByRTQ1MnBjcFBNR3FrK2RSVFRCb2liNEFC?=
 =?utf-8?B?WWQxRExmQW4wTXU0WnhTVTZxcEdzYWdFY2VybDlOaXJKbm1SdUVEV000R0I5?=
 =?utf-8?B?dVFWUkpMYWJiV1B6RjlDRTZxcHVBUmx0bTV5eG9CQno3WnM5TzB1aVpXMmxC?=
 =?utf-8?B?WW5zVFBJUXM4QUcxNHl0azd0c2tHbUEzVmRCMkZwb2Z1VzRaaFdYL3ZseStD?=
 =?utf-8?B?bTFEd1NNaWpYN0FvMGpoR1lVM1FTeW1rRmFXNUVZVVdHcjlSRkVrajJwSndF?=
 =?utf-8?B?Z0dNWXp4aE5FZE5ZY09sVU9wUVovVGFSZW9XdVNFTEhsVlVCa1pPQkxOSTBJ?=
 =?utf-8?B?L3E5bWtCWklyMVQrZEYwcTMyNmU4L3R3RWZKZXNBR0FVbzIxMzJ5dDluYUVo?=
 =?utf-8?B?ejAxNUFlQlRVMS9sTS9xRkZBTTk4MHpCT1lWTVFWQnc3VGlHc3lxdUhFeHFN?=
 =?utf-8?B?NGpzdnRuUkRlUlIrUTBQVndYTUF5aUpQMStTNkNwWndsUWhMSTNRaDlPSlR1?=
 =?utf-8?B?TGVKYjcvK0hzcUlLckFGUW8yTVp2S3BGdUl4VytiVUlIT2ZHMEFnOEZ4UU45?=
 =?utf-8?B?Y2xKRW1xSmp2M1hjRWR4Qjc5Q0wxVS9KZk9RUURxRlVpOWo5QlMrRWk3eVI2?=
 =?utf-8?B?akV0SEJraEk0bkJRZThUdk1tWFZlMEZQN2hPL0xpenNtU2JGaG9zQ3FrSFhY?=
 =?utf-8?B?YnRUQ3VDdk5nWkFRZGZ2cHN0dEhmWk5KM0UyYnNYMmNQbm0wOWU5U1IvQVVC?=
 =?utf-8?B?YlRvMGgvVkRvZUx2aDZ5U1lNdDRoanRKRU4vN2NGelpXQ3hBY2E0K0d4QzBq?=
 =?utf-8?B?VWw4YXYvVGdiMk1Md3Z6ODZZT3FoSFZBQ0FwWjJENCttM1RQSmlUZm51aW8r?=
 =?utf-8?B?dWd2V24xU01MMWVOUzg2YkZTYmhoR0lHc010WnlLZCtjZkU3WlNuRXF2YUJt?=
 =?utf-8?B?NTFIWWV4QXBkSlpNU1FFNDI0Z1RvWHFZN3B0dmZHL1FKby9pRktPcms2NTlk?=
 =?utf-8?B?RWE1U3NaTE9ZUG93ekEzRzFuU3p2OVJJbzZ2Qk4wTmRwM2cxQjZwTXBOQkFn?=
 =?utf-8?Q?IsVxtWcvwb/AdP0KYK0iGq6Y+ant9YAD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5HVDhOeUp1cnRIWXl0ZTZsYlZ0VktaWWdDMDdFNHNlSVprWnI1VEgzMTBa?=
 =?utf-8?B?L2YxeTNRK2FadXV3RTZBUTd3Q3B5cEV4NUlxSEcvK1pHMHk3VGxCWE9XUzVs?=
 =?utf-8?B?MG5YYS9KRGM4bHdQVGlhQ2ROS0ZqN3kzaEo3cWxxdGZ4Zy84V3BvSVlMUnFn?=
 =?utf-8?B?R3Vxa21nUkZaU24xQnNOSndjbUk2UERGNm16V3JPbmNkR0tKOUl2R3NEV21B?=
 =?utf-8?B?MnpOOVhWWFlOTWxxU0x3b3QrQ3lVZlJ3a0lQQm1aTC9NSTZCK3RiTHVMd3VV?=
 =?utf-8?B?RkUybUtWT1JJUktndW1xNy9pWWRwOUpNWEVMSVFSWHpWSDFScXc4a1htY2ZP?=
 =?utf-8?B?b3o5bjFGZ2YzSW11NDZvejhjVkdXaExUaDBqckU5ZzdQUnRkSzdWNXhoamNu?=
 =?utf-8?B?RE9uN1E5d2ZQK2xlMzY5WlM3VmxEUm1ZRmJPdVZMR2NBZmtHU0hCOFJmZVhh?=
 =?utf-8?B?cTB6K0ZlbkQyZWZQR0p2bEZGOGxBMDVMRzE2elpSODhUM3BuK0FjbHRLUHRU?=
 =?utf-8?B?WGxFeVZSd3ByeG40eHpTNTZEVnBRRjVVcXBNeVoxeWFvY25VNWlJeGhhTzBy?=
 =?utf-8?B?cEM2THhCK2tFM0graGMydW12UHRscGQ1YTh0UUp0WjdxczRkQU9lenU4TnFw?=
 =?utf-8?B?a25KcmMxWTlidWg5U3ZyWkNJdGdtcUJkcWhkRVdEZTZOQk9hd1JRMnVtMmZi?=
 =?utf-8?B?NDEzeDB0U1o1ZVAyVGlpVms5MzlXcEpqNWdndGx6aXlDcU5uSXp0V2FNekVv?=
 =?utf-8?B?ZTdLUXVBVkUvRDZxY2ZGZDE2Mm05Zk5RM2JhMTFhUmM4WVNSNlR4bGkwbm40?=
 =?utf-8?B?UFlUU2VrN2pRMTdpckJYTk43eFFZMUNpazltcFZDZXhabGthcDdJMzB4VXRy?=
 =?utf-8?B?OEhVSTl6Y3lYNk5XN3pUbDhyUWx5dkx0NnNOU3IyWWpNYXJ1MVh1ck9NMFJv?=
 =?utf-8?B?ajJ1MjVXdHZFVFRYanQ1T0dOV1BubVpsUG1La3JWaGpwS1o4WnVoNFlhQ0Rh?=
 =?utf-8?B?TmRVR0o1NDFER1ovbzJaenFGSnRYL1gxblJhdXhDbkRMNGl1Vmk5bUwvbDQy?=
 =?utf-8?B?TUJkSnBpWnR4THRLL2dmUWl1bVFmbUFKMVNQTU5nTGFKRmtpWUpNMzZ1RFpL?=
 =?utf-8?B?eGMrRXdvVGhzMVgwR3NWV3JUMURHK0IxWjlLb0kzVU01bHYwbjVwMXZoWGN1?=
 =?utf-8?B?ZHVqU0IvN3FJWG9CM3RVVVE5NUJVeXg2WmlpRW1LUHdCdVVCa1RxYjRQN2Ey?=
 =?utf-8?B?UklQYWxSVTE0N2Nkcjd1OWR3eUNFWG5BSW5tU1hpVUw1Q3ZsZUc4bkFDL3g4?=
 =?utf-8?B?aXJMcm41WS82ZFNjTUVVVmhuTXB0Z3R5THI0Nmg5ajBFZk1jS25OYjJBWU42?=
 =?utf-8?B?UEJuMngwc0lGVDF2RndnaE43clRVcm4rWTRwakFsTkRFbEtValVqaDZCUmI3?=
 =?utf-8?B?SDZJek4waG1iMEg0dzJhcXJRSWJKeS95azZ2TGtrcjRrSVczenlha2MyOU56?=
 =?utf-8?B?aURqdC9QNXRFdWxLbVRPbDJBZUVGRHVHWlhaaFFnLzJLMkFtWWFnVkR3S00w?=
 =?utf-8?B?T1plcmpER3ZGM3RLNnNDU2dRYTd6Z0hpaktDbTVHa3VpK1ZWQVNuNjVNMU9G?=
 =?utf-8?B?eU4ybWlRUVlEYmtRN2tkOHNiZ1gvOFNyYmxvMVVDK1dFN2VNcGEzMVJCSEw1?=
 =?utf-8?B?eUROd1NDQ1FsSmZONmJuZzhQV1M2Nk1OMEJKWlJkMzdCQWNhQS9LdWNUWDlU?=
 =?utf-8?B?bVhmZzQ1TW1ydzJyRlZtM2ltZkFrL2hIRm1RbjVzUkdydDd3eENVU0RjMnhv?=
 =?utf-8?B?WUpxN3NNelE2ZUE4UDdiWUY5ZTFHN2JWNFRDWnhGMTZ5bmhxRXBtZCtqemhW?=
 =?utf-8?B?cFFncVRZVjlxMmFMc25QNmhBTnlVWW5aQ1hqdHNPMUpXbEVlK1A4SVdSR24z?=
 =?utf-8?B?elhlc0tzY1NmWFFWV1FKYzQ1UjBZcmFHaEVzQUF6VFlmMHAvVnNISmdWbnc1?=
 =?utf-8?B?Y1RkM213WjhWZm9LOWEwUFllWHR1U2xwd2Y5YUNOMnA4S1FGMFZGQnNWOU1q?=
 =?utf-8?B?SGI1em5LeEt0eEcycENzbVp0NXdRV3NOL2luaGlzR0w2WlZFYUpKVzBBM21r?=
 =?utf-8?B?TUkrUkdwVnhyL0d6dXdkck8vbFNIeUVBcm15cVFhVUpEQ1pTVFJoSy9mTU5y?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca300e2d-ce70-4a5c-6e60-08de31e8258a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:17:06.6928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17kSANyafeIhGcbdu0Evs5LPLwAhfe/kc1QAqEOsSNWqt5pfCVkyDODZdTobaXCve6sbpMY8VJfXbhP0MhfVK/abGBgh8D80GpqB2iwOEfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5879
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



On 12/2/2025 6:57 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/2/2025 5:32 AM, Michal Wajdeczko wrote:
>>
>> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>>> Since engines in the same class can be divided across multiple groups,
>>> the GuC does not allow scheduler groups to be active if there are
>>> multi-lrc contexts. This means that:
>>>
>>> 1) if a mlrc context is registered when we enable scheduler groups, the
>>>     GuC will silently ignore the configuration
>>> 2) if a mlrc context is registered after scheduler groups are enabled,
>>>     the GuC will disable the groups and generate an adverse event.
>>>
>>> We therefore need to block mlrc context creation when scheduler groups
>>> are enabled.
>> s/mlrc/MLRC
>>
>>> An adverse event threshold is available for the new adverse event.
>> changes related to introduction of new threshold deserves separate patch
>> (as we need to handle GuC FW version checks)
> 
> ok
> 
>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 14 +++++
>>>   drivers/gpu/drm/xe/xe_exec_queue.c            | 19 ++++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 30 ++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  1 +
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 59 +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  3 +
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  2 +
>>>   .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  1 +
>>>   8 files changed, 129 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> index 274f1b1ec37f..a6dce9da339f 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> @@ -46,11 +46,18 @@
>>>    *      Refers to 32 bit architecture version as reported by the HW IP.
>>>    *      This key is supported on MTL+ platforms only.
>>>    *      Requires GuC ABI 1.2+.
>>> + *
>>> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>> + *      Tells the driver whether scheduler groups are enabled or not.
>>> + *      Requres GuC ABI 1.26+
>> typo: Requires
>>
>> and don't forget to update xe_guc_klv_key_to_string() with new KEY
> 
> ok
> 
>>
>>>    */
>>>     #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY            0x3000u
>>>   #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN            1u
>>>   +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY    0x3001u
>>> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>> +
>>>   /**
>>>    * DOC: GuC Self Config KLVs
>>>    *
>>> @@ -369,6 +376,10 @@ enum  {
>>>    *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>>>    *      :2: HIGH = schedule VF in the next time-slice after current active
>>>    *          time-slice completes if it has active work
>>> + *
>>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>>> + *      This config sets the threshold for LRCA context registration when SRIOV
>> ... threshold for _Multi_ LRCA context registrations ...
> 
> ooops :)
> 
>>
>>> + *      scheduler groups are enabled.
>> "This is allows PF to monitor VFs' behavior when EGS is enabled."
>>
>>>    */
>>>     #define GUC_KLV_VF_CFG_GGTT_START_KEY        0x0001
>>> @@ -427,6 +438,9 @@ enum  {
>>>   #define   GUC_SCHED_PRIORITY_NORMAL        1u
>>>   #define   GUC_SCHED_PRIORITY_HIGH        2u
>>>   +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY    0x8a0d
>>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN    1u
>>> +
>>>   /*
>>>    * Workaround keys:
>>>    */
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index 8724f8de67e2..e59c41c913b4 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -16,6 +16,7 @@
>>>   #include "xe_dep_scheduler.h"
>>>   #include "xe_device.h"
>>>   #include "xe_gt.h"
>>> +#include "xe_gt_sriov_pf_policy.h"
>>>   #include "xe_gt_sriov_vf.h"
>>>   #include "xe_hw_engine_class_sysfs.h"
>>>   #include "xe_hw_engine_group.h"
>>> @@ -698,6 +699,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>>>       return return_mask;
>>>   }
>>>   +static bool has_sched_groups(struct xe_gt *gt)
>>> +{
>>> +    if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_policy_sched_groups_enabled(gt))
>> hmm, usually we don't want core code to look so deeply into PF subcomponent
> 
> I thought about that, but I didn't know which sriov file would be the right one, since almost all of them are either pf-only or vf-only. should I just move it to xe_sriov.c?

hmm, but xe_sriov.c is device level function

we might add helper to xe_gt_sriov_pf.h where we can also provide stub there:

#ifdef CONFIG_PCI_IOV
bool xe_gt_sriov_pf_sched_groups_enabled(gt);
#else
static inline bool xe_gt_sriov_pf_sched_groups_enabled(gt) { return false; }
#endif


> 
>> also, do we want to work in hybrid mode where one GT is using MLRC and other is not?
> 
> The GuCs allow it. I didn't want to block it in case we do get a scenario later where this is needed (e.g. we might get a split primary GT but still want to do mlrc on media)
> 
>>
>>> +        return true;
>>> +> +    if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
>>> +        return true;
>>> +
>>> +    return false;
>>> +}
>>> +
>>>   int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>                      struct drm_file *file)
>>>   {
>>> @@ -790,6 +802,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>>               return -ENOENT;
>>>           }
>>>   +        /* SRIOV sched groups are not compatible with multi-lrc */
>>> +        if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
>>> +            up_read(&vm->lock);
>>> +            xe_vm_put(vm);
>>> +            return -EINVAL;
>>> +        }
>>> +
>>>           q = xe_exec_queue_create(xe, vm, logical_mask,
>>>                        args->width, hwe, flags,
>>>                        args->extensions);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> index 48f250ae0d0d..c7f1ea8eb9c5 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>>> @@ -8,6 +8,7 @@
>>>   #include <drm/drm_managed.h>
>>>     #include "xe_bo.h"
>>> +#include "xe_exec_queue_types.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_sriov_pf_helpers.h"
>>>   #include "xe_gt_sriov_pf_policy.h"
>>> @@ -527,6 +528,24 @@ static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>                         masks, num_masks);
>>>   }
>>>   +static bool guc_has_mlrc_queue(struct xe_guc *guc)
>> this is all GuC stuff, so export it from xe_guc_submission.c
> 
> ok
> 
>>
>>> +{
>>> +    struct xe_exec_queue *q;
>>> +    unsigned long index;
>>> +    bool found = false;
>>> +
>>> +    mutex_lock(&guc->submission_state.lock);
>> guard(mutex) ?
>>
>>> +    xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>>> +        if (q->width > 1) {
>>> +            found = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +    mutex_unlock(&guc->submission_state.lock);
>>> +
>>> +    return found;
>> what if new MLRC is created right now?
>>
>> maybe we should use xe_guard to lockdown one feature or the other?
> 
> The idea is that the admin is responsible for enabling EGS when the system is in the correct state, which is why the GuC doesn't return an error and just ignore the KLV if the system is not in the correct state. This check is there to catch the case where the admin has closed all apps in preparation to enabling EGS but the driver still hasn't processed all the context de-registrations. Therefore, I don't really want to over-complicate it with extra locking. I'll add a comment to better explain.

so it doesn't have to be bullet-proof ?

> 
>>
>>> +}
>>> +
>>>   static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>   {
>>>       int err;
>>> @@ -548,6 +567,12 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>>       if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>>>           return -EPERM;
>>>   +    /* The GuC silently ignores the setting if any mlrc contexts are registered */
>>> +    if ((mode != XE_SRIOV_SCHED_GROUPS_NONE) && guc_has_mlrc_queue(&gt->uc.guc)) {
>>> +        xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");
>>> +        return -EPERM;
>>> +    }
>>> +
>>>       err = __pf_provision_sched_groups(gt, mode);
>>>       if (err)
>>>           return err;
>>> @@ -600,6 +625,11 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>>>       return err;
>>>   }
>>>   
>> every public function needs to have kernel-doc
> 
> ok
> 
>>
>>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
>>> +{
>>> +    return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
>>> +}
>>> +
>>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>>   {
>>>       pf_sanitize_sched_if_idle(gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> index 36680996f2bd..89aa3af6cc7d 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>>   int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>>>     int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 4c73a077d314..7a180c947032 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>>       return value;
>>>   }
>>>   +static int query_vf_sched_groups(struct xe_gt *gt)
>>> +{
>>> +    struct xe_guc *guc = &gt->uc.guc;
>>> +    u32 value = 0;
>>> +    int err;
>>> +
>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +
>>> +    if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
>>> +        return 0;
>>> +
>>> +    err = guc_action_query_single_klv32(guc,
>>> +                        GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
>>> +                        &value);
>>> +    if (unlikely(err)) {
>>> +        xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
>>> +                ERR_PTR(err));
>>> +        return err;
>>> +    }
>>> +
>>> +    xe_gt_sriov_dbg(gt, "sched groups %s\n", value ? "enabled" : "disabled");
>> str_enabled_disabled(value)
>>
>>> +    return value;
>>> +}
>>> +
>>>   static int vf_get_ggtt_info(struct xe_gt *gt)
>>>   {
>>>       struct xe_tile *tile = gt_to_tile(gt);
>>> @@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>>>       gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>>>   }
>>>   +static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>> +{
>>> +    int ret;
>>> +
>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +
>>> +    ret = query_vf_sched_groups(gt);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    gt->sriov.vf.runtime.uses_sched_groups = ret;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /**
>>>    * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>    * @gt: the &xe_gt
>>> @@ -593,12 +632,32 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>       if (unlikely(err))
>>>           return err;
>>>   +    err = vf_cache_sched_groups_status(gt);
>>> +    if (unlikely(err))
>>> +        return err;
>>> +
>>>       if (has_gmdid(xe))
>>>           vf_cache_gmdid(gt);
>>>         return 0;
>>>   }
>>>   +/**
>>> + * xe_gt_sriov_vf_sched_groups_enabled - Check if PF has enabled sched groups
>>      * xe_gt_sriov_vf_sched_groups_enabled() - Check ...
>>
>>
>>> + * @gt: the &xe_gt
>>> + *
>>> + * This function is for VF use only.
>>> + *
>>> + * Return: true if shed groups were enabled, false otherwise.
>> typo: s/shed/scheduler
>>
>>> + */
>>> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
>>> +{
>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>> +
>>> +    return gt->sriov.vf.runtime.uses_sched_groups;
>>> +}
>>> +
>>>   /**
>>>    * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>>>    * @gt: the &xe_gt
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index af40276790fa..2e1d34c0397f 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -23,11 +23,14 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>   +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>> move it there [1]
>>
>>> +
>>>   int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>>>   int xe_gt_sriov_vf_init(struct xe_gt *gt);
>>>   bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>>>     u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>> +u32 xe_gt_sriov_vf_sched_groups(struct xe_gt *gt);
>> unused ?
> 
> oops, old function name that I forgot to remove.
> 
>>
>>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>> [1] here
>>
>>>   diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index 420b0e6089de..5267c097ecd0 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>>   struct xe_gt_sriov_vf_runtime {
>>>       /** @gmdid: cached value of the GDMID register. */
>>>       u32 gmdid;
>>> +    /** @uses_sched_groups: whether PF enabled sched groups or not. */
>>> +    bool uses_sched_groups;
>>>       /** @regs_size: size of runtime register array. */
>>>       u32 regs_size;
>>>       /** @num_regs: number of runtime registers in the array. */
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> index 0a028c94756d..3e55d9302855 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>>> @@ -32,6 +32,7 @@
>>>       define(H2G_STORM, guc_time_us)            \
>>>       define(IRQ_STORM, irq_time_us)            \
>>>       define(DOORBELL_STORM, doorbell_time_us)    \
>>> +    define(MULTI_LRC_COUNT, multi_lrc_count)    \
>> this needs to be defined with some version info, maybe:
>>
>>     define(MULTI_LRC_COUNT, multi_lrc_count, (70, 53, 0))    \
>>
>> and then in encode_config() have two variants of code generators:
>>
>> #define encode_threshold_config2(TAG, ...) ({                    \
>>     cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);            \
>>     cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];    \
>> });
>> #define encode_threshold_config3(TAG, NAME, VERSION) ({                \
>>     if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER VERSION) {        \
>>         encode_threshold_config2(TAG, NAME);                \
>>     }                                    \
>> });
>> #define encode_threshold_config(ARGS...) \
>>     CALL_ARGS(CONCATENATE(encode_threshold_config, COUNT_ARGS(ARGS)), ARGS)
>>
>> this should fix the issues already spotted by the CI on ADLP:
>>
>> <6> [133.603624] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x8a0d : 32b value 0 } # multi_lrc_count
>> <6> [133.603625] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0001 : 64b value 0x200000 } # ggtt_start
>> <6> [133.603626] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0002 : 64b value 0xfec00000 } # ggtt_size
>> <3> [133.603653] xe 0000:00:02.0: [drm] *ERROR* PF: Tile0: GT0: Failed to push self configuration (-ENOKEY)
> 
> I think it works better if we add the version for all thresholds, so we don't have to define multiple macros every time we need to check the GuC version (which I believe needs to also be done at least in register_threshold_attribute() and define_threshold_key_to_provision_case().
> I can just use 70.29.2 (which is the minimum supported version for the Xe driver) for all the older defines.

but then the code for version check will be generated for all thresholds, even those that we are sure are supported

I will try to find something simpler, or more reusable, but no promise

> 
> Daniele
> 
>>
>>
>>>       /* end */
>>>     /**
> 

