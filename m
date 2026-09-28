Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256FCCA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 15:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23FA10E210;
	Mon, 28 Sep 2026 15:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDYA5UBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883A010E210
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790609575; x=1822145575;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u81GqI0dauh9Ta1zI6hnKOvT2Ke8tChZb3Mai7i/q8o=;
 b=PDYA5UBin4tpr8gvw5SsrDvLVXb6faf1HFEyQdPYEtLt2iCtSgRe3JBt
 9iR08Eo/lZSlqYUzzODuoNf2yn2MW1ghqD+jWCXeD185q2nhZSEHHz0an
 CgUIbKUOoi2PSQLpu9viNwGoIWuKFnm5IwB5X8fFJbVbfDVZ7J10dHNps
 uUyTatAa3SmnFXFMo/kPhVMMYkyW+b2qmwOXSzEVUJo8MILfbk9JsdroM
 NhCdEJVlJHW9BMb+rUh4CAkmab/nR4oR5lZNNS/Vr7IiXJFLfmmAon8jQ
 f9udjyfnEtSxlQ2lnDRavVjrxOzHy1jVTRxXmHiLjrz28oxzbgG8izoRg A==;
X-CSE-ConnectionGUID: USytQsevQEOXmpa846J3UQ==
X-CSE-MsgGUID: cLh8t53MTM2DAeUJIe50Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="108800232"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="108800232"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 08:32:54 -0700
X-CSE-ConnectionGUID: pXh3O5ABTaKW2lmljtugtg==
X-CSE-MsgGUID: lL9ZdgbNRM63nHh2IZ+PRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278447014"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 08:32:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 08:32:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 08:32:53 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 08:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Axm7ZrBNgUnZ9vY7bMmxb88NkOhGvHZDzY2FVKrzw2eKTWIyf2batsnmaa6OK24IgJyDwaTHj6ZJzxYemTBiiDfDkc7ZBlbamTOPtisrOlA6/34vrK3mm7wzwBc3e8vcmmdmoCVhyHhQQGuQSr45UwqrlF12swgbmp0ZVW1i5EIagB3BJi8g5/DS2AfVIvk0+cpK0w2nFMORnbvPmbqJlijIXW+YYlWKEBh+Iu4/1rb665dXtkm+xx9b+1KNnJdgLzCg4hmrCZDFwLPCCuGjid5fWU4771tQ0Ysp33ieCVKWN1HlRa/e+j9wZv6udduDGuA4u0E3BWsgRz2TqkRaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j24FdHSmA4WBWsfrfLOkdpLGPxQ0Zk6s7xRc5g+8GCA=;
 b=wKM7gBhso2sE+VlOZaNFVp+0JScg/muGikWt4t6uzTh/Mi+w2fkpEnz8CkFtBgybRrB3SVhhJp+cCvk7wuEq/FmGvCI39OHaYzWRRYyM1PKQw6eDhuDi9t+aw5LWw/ift0dmIK4r3MAHK4wdhyL7R46+Zb7eeblqHMXj6WLqrDDtqgL6z+C8Q0I1nX6oCW3sGr/5ok3it45cnZI+EASuirhEn/RKIM2X9MfzPqe2WqSZWA1ZGi0UuPu5vibGlMzvzvRGIOFslyWhEy0fNF0zfBD3CUARf0woEB4b3eLhSuDlAfasuIOnDRRcGEGXtwqbjcf6kjOGlbNz94/2kzL5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 15:32:51 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:32:51 +0000
Message-ID: <40b4bd79-5cc2-4da5-abdc-81834b313780@intel.com>
Date: Mon, 28 Sep 2026 21:02:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-2-karthik.poosa@intel.com>
 <armwz_oryVE0CNa-@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <armwz_oryVE0CNa-@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a817ae4-2ddb-4844-2877-08df1d75c1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ljuv7Qju8P/w0ky0/oN9qksLZtXQEnIf2Ag2TAduzj+0WIL0quPQ87jo/RjKZG07tjIgA2CMXUaTxotQVPkYIsyZtebYWj6WcNpRW6+8jYwE6stfHPIBAKonLAiJJXhRpaIru4b9GGkmRvViOoseTuXL6dd+OsAaU5xGm9dACqzfV8yBzYBBHfU1fQrZxtEFCFmvqrPSFZZqIiw79a47aCvkNsluMhhnaeumb/cQIf/JBPhFCnRdqpU9rsUPGk+Ttv77i8j+uoLs7sQ7sC1dhh8yf/JA/FWW7aXs4PweJJNPVEre/vaU4Nvt1MBSknQEZ5MksWxKu9bmvFPaeSrFKuxXFp6nGg70kTdwz6MrlbqYrWM9eSuxLnZB+GzFjnahcsy6l41jlYSH5kRUJN2B7x9kKhjNC3h99w6tpoTNgOdK0eX25F34rdtFJiL1LsnEG48FyljNOU/a8z9fnBFdvpWYzyoJrWEQxTHWvu8rUKgRLyP3ayjziJfot4QfaXwmIPH9u5HyJJl79Gn+n9tfBNJP3YEbQFDqOt9JvnHn7Gqe3EZKBW9tubA9ID/wmn1Lc0l4j0vTHKsgEvl8iPYZaVeRXmJvldz7jRlj7lSqhOz4GkTzPRSz6nIe4f/7orTsMnzhnbgzIPBhgCwXJTJoabU8XAeOc5YEngLCnK6Q7Ds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1RMczNvSFlPNW45dTZmL1liNGE5VnArQjFTMW9MM29IYW5nK0RhR3phSnlm?=
 =?utf-8?B?dG1aa3l4eEpvRWs4MGxYa29wMmV0ZVRnRnVrcEQ3ZmQrUzVtSWNHNlZuQTlz?=
 =?utf-8?B?L0dqbXVVSi8zSGZHeEt0bEJtRzhJVmlhbVJIK0xPaExheXp6TEtOcTNLalo2?=
 =?utf-8?B?a1M1aHJFT2JERjRuc2RHVDJDdjVCWnVuNU9ib1FvZWtrRlpvSzRYRkpjcUZY?=
 =?utf-8?B?OEI5STBSZHg3ZUxkUjIvcmhTdFNxZmV2aDc1aVd4WENySk1WZ2lkRCtZdDNL?=
 =?utf-8?B?cFFNYTNZdm0yN29uYUhqZkh5Yk90SkU3V3RucUFtK1dxMEU0WFRLdzVDOFFs?=
 =?utf-8?B?Rmw4V2NmeFhPN3hEVEY1OWJpS3dPbWpBQmdsa3E4MWRlZ2FSMkdJK0ZiMThQ?=
 =?utf-8?B?eHVzekZZOHpOc1VCSGYwVDZNNkt1V3ZaNDRBMmNhODUrZjRpaFdCREM3SU1U?=
 =?utf-8?B?VHVCRlBiU0JpMlRDUTFxZHJVcmJpS1A5eko3eUhDV2xTY2grMldQWkNQODJX?=
 =?utf-8?B?dExqRmtlWndkeUVRU1NVQ3cxVmFjNXJ0ejVRZ1A5RXBIYzlBdEluYlBRTm02?=
 =?utf-8?B?RVhrZ2xXWHBoU1hua2NzMFVPNTRnNnVwU0xmalgzN1dVbGlWMHlXUktvRGUy?=
 =?utf-8?B?WjF5WXZmaU1IekFPRjBrQVlUR2tCY2grcTZxOURXbStkTVl1Y0NVbitwWTdl?=
 =?utf-8?B?dnNTa1FTV0FEL0FKTWRMWCtNc2plckQyd2hEQWMybm5kTlBUekdPQXNWTGRs?=
 =?utf-8?B?b0pNdW5QRFJFOFE1cmdmZFdJYkF1V3VqNTRhdExGOEVwZUFjS1oxSkp1cUpZ?=
 =?utf-8?B?K2I2eUpiUEhxTk9sYW4zZzlFWDd0MUdiV09CUW8wVmlpOTh4elBOditIZFc0?=
 =?utf-8?B?a2d1VG9xV2V5VEJhYzJpWW16aXBuVUU4elRaT2JoRE9wWmVUYmdRTnlLbG5J?=
 =?utf-8?B?emZUVG9rclJyVWJudnIwTFZTc0l3YXV5c3NuYURmRFhMYW5ERE5TOHdzdjFj?=
 =?utf-8?B?QkpnMzNWRDJwSWE2Q2tWT0RYb3hVbEtpeEJHSlg2UldIbjlDWEtERExZQkFs?=
 =?utf-8?B?MVFRUTREcXlqT2ZQV2cxSjlGcTBFenhNdHFhOUFKclp1WXdOY0M4bWpnQ085?=
 =?utf-8?B?b00rSVUyUkNmRjVUSDNBbnFKcStNd3lEU21kdXNNYUp2eERsd0RFK2tLRVhx?=
 =?utf-8?B?TlZnRjNXbGpsZHh5QWEyRkZGcDhJOWxJZGxrb3dqSFJmSlIvaDB6TUxOMVFU?=
 =?utf-8?B?UnlnSTFuNUJmSGYwTXA1d2JFZEtLQ1RhME1CVy83SXlYZm1Kd0ZZdTU5WE12?=
 =?utf-8?B?Yy9HdGIrcEVtVnA1U1pRcUlId1BMODBlUEMzdWZ2V3VUVkxjMHY0ekNEVUhE?=
 =?utf-8?B?WWxWakRpVldFaTVwT1R3R1JyQm5tNG9ocnhFcWF4Zm1PUTNwZXhpbW0wTUNp?=
 =?utf-8?B?M0JpWjRvT2M0LzhucHduRlk0dklwRnBxVmd6Slk5YWdta1NFZDRIUjY0VjZQ?=
 =?utf-8?B?Yzd5eGVHWVUzQXd0K0IwSGRwK0ViZDZDS08ySGgzTitveDlyakR1YnlnbW1w?=
 =?utf-8?B?Y25keHo4MWtzaXZhclN6YXJIN2tKc0F4ZU9iTVNRK3ROVTZlbmRwR09VYnFi?=
 =?utf-8?B?Q09sTXVJRkRCekhiUkRGTTZhSlMxQ3JxNU9HdlJWNGdBK2JSZGQrMHVUZFoz?=
 =?utf-8?B?d2hFY3dQU1YzdG5rQTBwRzJZVTNZWndabE9PcHd2N3Fyd0JacjYzZDFYV2ZB?=
 =?utf-8?B?Ui9sRm5CM29HQWpFYkRDQVBVaUo5ZjF1VVEzYWZHVXpTdHhMdEV3aTN5cVdH?=
 =?utf-8?B?Vi9VczFqWmNBUjB6dzF0dFFpYXJEaXVTQ3BrUEtlTVh1NjFZLzFDelpLSFlH?=
 =?utf-8?B?Rk5HaEpZNjZpcmlaVXZGVmQrUlcvdHRubE9MQndCOFAvZGM3NFczNGYxN0l4?=
 =?utf-8?B?a2c2Y1RzNlluc2pZLzhNZVMwODdQcGpxdytwNVY2c1F6TkRDYURaYlMzeDdC?=
 =?utf-8?B?YVRhSW5vZWZUY21DZ21VbDN6WC9ockpINjVXVWRJNk1uUU1RRG1IZEZYTzUy?=
 =?utf-8?B?Z0M0UTMxWE5mdEs5TmkxVThGc3ZZdlJ4L25oS1ErcmZrd2puK0V3Vmh0M0dj?=
 =?utf-8?B?VHBPOWlpNlpJVkRidjN2T3UxMmpUZE4zdlA0eVdXTW1mbXBGR0RkRjFYaXZN?=
 =?utf-8?B?L3d4RTF4OTB1UHRLY1dlaFYveWk2NjN5SHJMRjIxYVVUMnFaZThTcXBpaDV5?=
 =?utf-8?B?WjMrcXNiOGd6U2VhL0NOMUJOMTVTM1pJN2FBQ3dHTm1PWEhRWFp4QW9KNEVF?=
 =?utf-8?B?cHFCM3BvaEpJU2lnZ3pvVWE3R2pVN1VINHVwNFhWZjgvbHBBK3pFUT09?=
X-Exchange-RoutingPolicyChecked: WdRcZm1kDT9fyspSRiAjkgq6zXSOWZ+p0R+KMN/ig98RBWHGJPgBcvkPcdVM2oxx4qSujDyamoHcrFJNQYJETYWV3BhiOvrR8e2tpx9x5Lpx07LTozn0P9ODK4UWsL3kL2nUHkQJm2rYuK4DeapbCTeDnvJMzyR/fVLdeKHYjffJr43RvAYROC39WamH5PDkplT5fnAAlKS8WBhnx4DxSi5teCll57eM08SPyB5Vm1ynL3+Kt2qD99f+2mP+iNQoAvwirOB9i282V1JPwHnUC6nCCpFvOd9gtc7QWRCnCnzWmT/RDfYezeGZw381VqsgUz1nMpXuQVQM5fDVuPCy0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a817ae4-2ddb-4844-2877-08df1d75c1e5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 15:32:51.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROk09USOkX4J7PTQ8j3/FjpLmMSeC4pnENw9sgVIVXZ+UQuIs8RraAPDCKqGLpgbTNBhLc94ZSv68xL08sth+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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


On 28-09-2026 05:41, Rodrigo Vivi wrote:
> On Fri, Sep 25, 2026 at 02:24:17AM +0530, Karthik Poosa wrote:
>> Return early when the pcode read operation fails in
>> xe_hwmon_pcode_rmw_power_limit() and check the returned error in
>> callers to avoid updating power limit settings with invalid data.
>>
>> Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>> v2: Address sashiko-bot@kernel.org review comments. Return -EIO instead of
>>      0 on errors in the sysfs store callback to prevent potential userspace
>>      infinite loops.
>>
>>   drivers/gpu/drm/xe/xe_hwmon.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5edeac961ec3..be3fb6733b6f 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>>   						  READ_PSYSGPU_POWER_LIMIT :
>>   						  READ_PACKAGE_POWER_LIMIT,
>>   						  prepare_power_limit_param2(hwmon)), &val0, &val1);
>> -	if (ret)
>> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>> +	if (ret) {
>> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>>   			channel, val0, val1, ret);
>> +		return ret;
>> +	}
>>   
>>   	if (attr == PL1_HWMON_ATTR)
>>   		val0 = (val0 & ~clr) | set;
>> @@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>>   		if (hwmon->xe->info.has_mbx_power_limits) {
>>   			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>>   				PWR_ATTR_TO_STR(attr), channel);
>> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>> +			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>> +			if (ret)
>> +				goto unlock;
>>   			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>>   		} else {
>>   			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
>> @@ -679,11 +683,13 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>> -	if (hwmon->xe->info.has_mbx_power_limits)
>> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
>> -	else
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		if (xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy))
>> +			count = -EIO;
> please use ret for this, not changing count...
> and you may set ret = count earlier, or something like that...
ok
>
>> +	} else {
>>   		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>>   				  PWR_LIM_TIME, rxy);
>> +	}
>>   
>>   	mutex_unlock(&hwmon->hwmon_lock);
>>   
>> -- 
>> 2.25.1
>>
