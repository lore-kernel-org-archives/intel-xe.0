Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAADAC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 03:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B4E10E97C;
	Tue,  8 Sep 2026 03:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYhLZD12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEA710E981
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 03:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788839790; x=1820375790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0uU2Qlx4njpUXi4mZfqOR4t0DNf4L4BERG5DgApVKZo=;
 b=hYhLZD12kO7xx+ZKhD4tbke1WFh4NxSo6h9bCiNE4TrsZepxw5/VHwep
 mr7/vewxfkyOusmtHD/j14UiWBnbSNPsORU1rlLuQa/sxUmGhxwrVojbN
 TYrDvuH/SR8GKY5lSOFaehBiTG7ByV6gSPeNJrT8luA7KluoMsBfVB47u
 x1qarNEx5mEjTH0Wkd38UUjscIdWtQiiZyvWw1O+jRYB/kJj+su2/N9x/
 i/sS4jKr06PadSBf4E4nV6WjuzH0SMf4seiYo6+rZsT5hk7UiQ5S8kV29
 0pdDVTMUHqkkWIvWcKlgF5A0HM5j7Wi1VicE+5uch+3GvuF7KzaI6yUkW w==;
X-CSE-ConnectionGUID: BM0zLgPUTPavJ79bj3f/Qg==
X-CSE-MsgGUID: YSF+tZ3US6CPvXdyLysLwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100755032"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="100755032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:56:30 -0700
X-CSE-ConnectionGUID: anEIm1IXRlyTaBGp8wL12w==
X-CSE-MsgGUID: 7NmLROtVSc6EemrK585GEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="268284106"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 20:56:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:56:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 20:56:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 20:56:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rl9+0asH25BM5/kaR4+gEVdVZ7GNSZDt6w5aFDjo8wpd70CEWheH1Nf35dvy5mB8XfuiefV3APz6ItM8Cen7RJt+u+v+/jr1FWPm75XfEkPSZ+M8OsJCN1oqSkpCR7RHawUv6ddc3hfj5paecTVAaH+j3IUvA1yw6OutzJKLbKvZ4hhZyJungVW7VpQN2DQDTm/WszjBGfxmCJlPM6PCXNhjZio4/lR1h87ChRdUvPxEkBfxg6EvBPZYxU6vbh0Diza577f2a2GW5o4pS1rqXODbnxSlGYtSpYdrZ9KaJrGNPgWXWPITRWMrTkspzVPu2oDhCrTowqZ9vxX21Piqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWg5gId2FzwJFAHcr0LIhDjJOGLzjOi7pikZSoQsh9k=;
 b=hUNtQoZ4auItQ/MRRIlksR2nXgcwtqgEvznu4i309Pn+hnigPbLbG0OQ4UvwcW89d0Dg+tV3apFUFubrLND2PTsMPDjbQsHEGjoSxQFPtHXNislasO6hh2WXt/IMilDSNy1ewiEuQ2pHQ0sN8NWfmOPnZPd+y8JeAYlqEsNS5jxdfze7sVHuHB/85klygPu++oNoFqXAGOGbpWl5GO+0A9Zwa0MrKNaD6WlqguG64Ddl/NkAWlyVO2FFNd/IYS4amwXEO5KUd7fj5KJCBqNXJlmElZ5wu1UcsnODcqw3uZnLIUD2Ny7IwimhWki+58Vq9xORFX5OI57B2sWH2zpiYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MN7PR11MB993112.namprd11.prod.outlook.com
 (2603:10b6:208:5f5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 03:56:27 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 03:56:27 +0000
Message-ID: <be3896cd-8668-4231-8d2d-3e777fc46711@intel.com>
Date: Tue, 8 Sep 2026 09:26:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [V2] drm/xe: Skip clearing purged page-table BOs
To: Matthew Brost <matthew.brost@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260907153706.888679-2-tejas.upadhyay@intel.com>
 <a081b43b-c4db-4744-8b81-7a87040b573b@intel.com>
 <ee9418ac-38fa-4891-8024-4d4752a406b7@intel.com>
 <ap+HMbjPp68+Wb+d@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ap+HMbjPp68+Wb+d@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MN7PR11MB993112:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9a9e85-6a69-4001-a132-08df0d5d282b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gXxQy3hUUHaitpqhp8CbkOoigP8cS5tNQAlwdPuKdEVPTFfp/ZNeBhOYVHKSVuE6SAnMxyCjPprDYQxCcrwuHFDLRno6GH4rVUa7hhWazGaR7mPuTdzpvimI3P91VCZ7J6v6CjvpL09PTqZKO+sxIQenJfb8TQME/wmVRivkkmEBUIJv1bA8Z/i7zxTJf2d/1gqWfCrld72E6mCC0NbUg39khIqEoBi/hJwyVQiZp0hIH0/FNCXB99OdQpD4cALosL5SsVWvhQqpVieg8wEdeFQGPd0LvXpE6dHuzIMvB6jTJp2DhXzFGjnMuZ0rA8bvUf2aLAGEli51/s9l5yz6flZeinzNBhIySjg8dYyNnKz9RPnzNjV+RTOQxjizhTtm6Lo5VzfFoTXMZ31Pdj7PAGJmaAmYNetLBk5FahDAUluhiU/dc3PViBa5wJYy+AOhsDPeEhw9IsAxKyY3E3Hnwuy/59jPKyzvEJBvTQVDdR7Bu184BKyuvvXBVXLgOI4HqAgEalEoBUnZrrDWF6PopLlqm/4ZCi8ygCbTq9T3Tvv92TcvwaDvAwb4VF3PXCX52lMDQSnv91ZddWtKG8MzcI2tHmc4XFW+RRYpbtWNIrE0bEAkQKpy5ivZ6+B3bHR0cgmElIy0Yu3YI1tpP5SY/Pk1JHO5oIq/xn+QCLzJeSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ektKK3V0UG9CS1dTb0hGWUQwSTRLOE9hNG4wUXVOU3JSZVBXbDUyeWVLSTR6?=
 =?utf-8?B?SWhTUE95UDZnNTM3bDVNTmY3V3FnTFNnbVY3MmdSMVR5NWFNcHZXK0pTd2xs?=
 =?utf-8?B?d3pDUUtqVTIzVndqNm81ZG5IUWVPT29aTjJYTWFGUjV2WlV1SUJJdURvTWEz?=
 =?utf-8?B?UzRRTUMwK2NiVG90MzhkM25wTG1IaGJPUzNOa3FMZGV6bTBsTnJZM0tST21j?=
 =?utf-8?B?UE5CbEFGQW50TUtWMmZNK0trT3ZBYitrZTVPSnY5eGh5M053S3RlTjVwNStr?=
 =?utf-8?B?eDI5M0M4YnZjZGZRbWN0ZlkrUU4wTEtQejFzY3hGMGNrcERJcnQ4VlJMb2hP?=
 =?utf-8?B?SnhOcUpIRkRacGpRa2J1bktlalZNTy85cmtMbk9pZ0tHRVhJaEt0V1ZtZ3Bu?=
 =?utf-8?B?OEw5cjA0REFrVEJiMGw5b0lKcGpRRU1BeWFUMHdyL0oyTzhYM0N6dWZWc3dY?=
 =?utf-8?B?MXJKSVdhNUsrQ3ZvbXRuVDF3b2Y0eExxZFB6ekZNVWFxSFJ1b0lSWmFMZFcy?=
 =?utf-8?B?eUtkaVRyRDdHdlE1NzBVd0NUdnl4aTVnQk0xbldVN3JmcUt0RS9lTGI0Rks0?=
 =?utf-8?B?YXhuMHNMaEFFRGpmVXNOSXJMb3VKYXJ5WmVsZEFwUXd1TU1EUkFRcVNjWDZM?=
 =?utf-8?B?dVdEcXhDR3JiaFB0cnByekVDaGw5Vkt1b1NWb212MmR5YXdlZndiRURYeUEr?=
 =?utf-8?B?UmFUR1pNS1MxeS91QkxPSHJKZ2V5WU9lR1RYSmEvRjdmR2RpOFBWNEJydnlj?=
 =?utf-8?B?QmRmaGh5cmNOZjZTMFBYbjlzV1FYczQrVFpINEZwZzBvVzlGN29Pc0lwRHpu?=
 =?utf-8?B?SVpYN0JSWjUzWDdTT01SL1BZVmc1Vm4zNzdqR0FKaVUvcXBodDFpZndVcy9s?=
 =?utf-8?B?eVdCY1FWeTFsYzdscndSSGttdm9LM3gzd0FwY0FqYXVDeHpoNEVpU082WkY1?=
 =?utf-8?B?MmtQR0YwZ2EzS2daRjF1NlJGS0l1TkNkRDF6TFpGNTNVQ2lVTmt6NXR5YWtG?=
 =?utf-8?B?eHBpT2ZVM2tkVW0vSi9hNk5xT0M0OURCVGs0dTRnSUprWWlLT0pMUkVZTUpj?=
 =?utf-8?B?eHI5WEhHRXNRVTRWZnRNMmhXUGExM2RQL3ZOQldydjNYVUtmVDE0RWRmbTJ5?=
 =?utf-8?B?TmlwK3EvSVR3aGRRZTdLRnVWMzNQUldMU1JWY0xRaTVHYWZrN0MvWmlZMXVa?=
 =?utf-8?B?b2piSjBNL2VCdkJiVTVPSWNoWmZvWnV1UEtydGczN0FuNU5taHd5em42NzZT?=
 =?utf-8?B?WmFPWkw5Ym5RTXloYldWR2tzV3BETnRsUWtTOHEzTVdzMEdvcGg2eDNLRkdm?=
 =?utf-8?B?WWtEUFB5OXJUd3QwbkpZN3Nwem9VTE5udTZZOTI4cDFqRDdLZWkrT0Q1dmVQ?=
 =?utf-8?B?WklIRm5MdjVWdDFpQ0s3TEN5dVBjR1dyVW0raGZWOXQwOURrM1lZazV5OUZV?=
 =?utf-8?B?QzhXTHhGVS9FNVJwT3JOOE1OeHQweVd0cGtweGhRSVhpWkhzc0VQaW1IQlJu?=
 =?utf-8?B?bFB4c2dwaHlxcDBzV2RjN1g4ME5ybStTRjFLREJKbVFvbWVSNnF2RGRTTlpy?=
 =?utf-8?B?ZkxxSEpwRTA1OU1PSkp0WVpJTU96M1VITGtreFJNNTNKZEtlWjd6TWNkWSsz?=
 =?utf-8?B?d1lUT3VKUitGaWdMZFllOXY3OUVERyt5QTZZV3lyM1lSd3I0UlFjS0U5WFNJ?=
 =?utf-8?B?Q21OUFdHRGVMT2lmTmZMdnlybHNPUDg5M3o1MlNmT2NpM0E1NFhjeEhGcVNJ?=
 =?utf-8?B?UmE2eGpzckxhMXQxVnR5T3FEVVd6NUZSZ2RZaVlQZG9zeVFGeE5GS1lGcXlX?=
 =?utf-8?B?d3d0L2VHMnd4bisvelF5eHNKSEVGQTNjbEFFWjVNVHFvMUpHcnZlcXpsY3Nu?=
 =?utf-8?B?TVF4WnZTbTB4QkJzQ011bllCQVdVYlNRQVNKbVZXeGhoWTRGYWRqVVYybG9q?=
 =?utf-8?B?R29PZS83WnZwTkxUM09iTGhuNFMxczdrWVg4UjR6Q2ZKVllzT3BTWk9nUTNW?=
 =?utf-8?B?aVZqK0J4UDFpc3pVTHFYQnZBVUxPNm1FTFo0M0hFdm5CZWNqVGliSGMyMUwx?=
 =?utf-8?B?c25RbTAxWHlTZGhKd0dnVGpUVkRuWUFqYzAvKzhiekZ4RjJQVno5TEIvOS80?=
 =?utf-8?B?WlY1a0gxRWlLMHpLeERDLzR3VlJkMVlWSXpMNEFsSkZhWnd3bGNNL0xudjNN?=
 =?utf-8?B?TFNZcHVYYkxManRtS1gzdDhQN2gzYnNRekNremFaK3pJbCtmM0RzTUQ2N0Jw?=
 =?utf-8?B?VVduVTV1TTFXZHZ4a2tMSVF5VXVRVi9hRmJNbTJhUnppeWJ5RzRobXc4SDVv?=
 =?utf-8?B?MTU5ZG1EMkFQaEd2cEJ1Z1BZMWZoN3VUeXpjN0prTzhoZmxjOFZ2WTk5djAx?=
 =?utf-8?Q?2w3ZnnVB261qgntE=3D?=
X-Exchange-RoutingPolicyChecked: twx5WLXXb7MkE59RrG+vSzlXE5faOiF+EQV13Z1tuDn9yCP11FXcFHhcUlAriEMU+zpBgnp7WAvoJMokbIf9qFl1gPi9/zMUffgXojkgdY6IkZC0/vuGcktlxTbqIbSEJP6ndM7y184tNmAYeoURAXTd1CRqhsQ9Nq3LzLLa2QmV/ejdKZkNn8Rr2gIBaMFfHmu3Bx3DEnCqlL0aU2lpGqxag62pyVUWsi8HTOtjQbsSxJP2/34tFISAvjJ7PItEc8VydH5OAtlBUayKfuUnxAZAs3aBt36yLnUNV7ztKjsid1aF9p09aC4qlv6pupGHxhUYw7fqqz/hhnsjlqjcYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9a9e85-6a69-4001-a132-08df0d5d282b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 03:56:27.0010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YMZpwwItJaI0nb6nQN0PRaKx+wz6RQrWNX2+9I5x/oALFKg8Y4FtmaeCaYMD7vY5kpkf0lt5HvesOak/HPcGUNFuRiseaRDbPlKuh75yjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB993112
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



On 08-09-2026 09:25, Matthew Brost wrote:
> On Tue, Sep 08, 2026 at 09:22:35AM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 08-09-2026 00:58, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 07-09-2026 21:07, Tejas Upadhyay wrote:
>>>> VRAM page offlining can clear a page-table BO's vmap before VM teardown
>>>> calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
>>>> writing to the mapping.
>>>>
>>>> v2(Sashiko):
>>>> - Fix lock ordering
>>>>
>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pt.c | 6 ++++--
>>>>    drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>>>>    2 files changed, 9 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index 5d990c1c3740..a9b9cd7ac2c8 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
>>>> struct llist_head *deferred)
>>>>     */
>>>>    void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
>>>>    {
>>>> -    struct iosys_map *map = &pt->bo->vmap;
>>>> +    struct xe_bo *bo = pt->bo;
>>>> -    xe_map_memset(xe, map, 0, 0, SZ_4K);
>>>> +    xe_bo_assert_held(bo);
>>>> +    if (!xe_bo_is_purged(bo))
>>>> +        xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>>>>    }
>>>>    /**
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 9e71567b27cc..e77ff3cf3ca3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -1876,10 +1876,13 @@ static void xe_vm_close(struct xe_vm *vm)
>>>>        bound = drm_dev_enter(&xe->drm, &idx);
>>>>        down_write(&vm->lock);
>>>> +    xe_vm_lock(vm, false);
>>>> +
>>>>        if (xe_vm_in_fault_mode(vm))
>>>>            xe_svm_notifier_lock(vm);
>>>> -
>>>>        vm->size = 0;
>>>> +    if (xe_vm_in_fault_mode(vm))
>>>> +        xe_svm_notifier_unlock(vm);
>>>>        if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
>>>>            struct xe_tile *tile;
>>>> @@ -1901,8 +1904,7 @@ static void xe_vm_close(struct xe_vm *vm)
>>>>            }
>>>>        }
>>>> -    if (xe_vm_in_fault_mode(vm))
>>>> -        xe_svm_notifier_unlock(vm);
>>>> +    xe_vm_unlock(vm);
>>>>        up_write(&vm->lock);
>>>
>>> LGTM
>>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Sashiko pointed a valid scenario where the check breaks and could lead to
>> NPD.  Please move to iosys_map_is_null check as suggested.
>>
> 
> Yes, indeed. Also if it isn't clear we still need the VM dma-resv lock
> like in this series even though iosys_map_is_null won't have the needed
> lockdep assertions.

+1>
> Matt
> 
>>>
>>>>        if (bound)
>>>
>>

