Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE09CD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 18:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BA810F2EC;
	Thu, 14 May 2026 18:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNtVQ/dq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80AA10F2EC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 18:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778783696; x=1810319696;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yDgEZZKxD922Dusf8hrGBsoKaQlBcglEzhV8J4X8zj4=;
 b=fNtVQ/dqBJ0JsQVftTPIc+MAc+3Kn0A821xYn+2TmbrpRTVEJax+VTRl
 ny1RGqojru8z7WZnbSkfVPQuoXWO/9PfzHyLOaU2eShG6fiZeyjvReXyx
 bs0pObcsf6ih3sadgBI3VHb7P9K39t4kFusbY3koZTAVEylxQSHtEC+tZ
 m8yeY+lLZd+JF137sw+3iG4QiXjzUpv8FY6zJtikH+iKN5CCD70wpBrpn
 4g0OLgO6PooUO+xrpFLQ/VeqW5FKSCeAKBz37aVwpDg3EBolwz2AwN/KA
 76qVJHYwmyCiATW8S5oM8zPKnqAov/eAT2ci3qt5Mg2I/F2nX9Fc2L0Gz g==;
X-CSE-ConnectionGUID: HTjGCQOaRUCU+viv4vKHLg==
X-CSE-MsgGUID: DznuvSvuTkSD5mUka/6wLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79627816"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="79627816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 11:34:56 -0700
X-CSE-ConnectionGUID: yckXib/SSZeeovAYBzeVXA==
X-CSE-MsgGUID: wVyd10uHTk2Gmox+pTprEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="242797688"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 11:34:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 11:34:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 11:34:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 11:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeArKLBqvxXxORoL2jNhtlLWatEi1ojPbZYSjrO+NmSaBOtvjEy1u8ZPMo8I6W8tw9fCOW9WftrEBywb3eikdhw2/bLa6TMOHN1xXKARO5riV8NncNx5vX0lIjr0bgahec/PFPzvJntxz6txtTVtBInbG/seRi7fC6+Sc39qkzByaX1ho28tjP09Ego4ZhDcfZcVVlU7nLExp6wrVQJYFgA7094o/DqvGt/rU9N/Ba2MSj/PiL/t4LCLHRrlrg1mOvFec1t0vzqtxWbEB+wy3N2uugDStYzhEpTQX0LuTkPOBa32PbnFyL+1ujdmGaFdB53uSfYJqAOI+3Aklc/o3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiVHYkEx4i+rTVwfHAQ3TFdXv+reZmQgpBl+4aGwq2A=;
 b=Jgs0sDWTkVMuNfFlBjbpkqPmjiSPSkA8vzOzxAIbgt/9kgipCV/NC4m8h541Ua0BX3tad3g0rplnGXYhJlP/5c7FLEtfu24Hgrk9VzH8yNnbteosQnzWHOUCFoTGgQ8H7RNqOWPi8mzg3QSkVuI6+qqmUGFitSIN2Ao5ev6d+qlaPiegCmvfyD+c9smXf2g4ZX0J9IiSOyq9qlGZvIksdXHjx+by4R+yJ5XHJcNmrlv2KztrOEvs639UOdORBB3qdd/T62lZBt5MLsU5udue4803vqKZKayvD3fjSx2Az9YdMjd7OkdNMXM7yZuQMpzXmzaaVJxmENM+BjKa5l4/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 18:34:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 18:34:42 +0000
Message-ID: <eb1ef4bb-165d-4e46-9915-964321d63784@intel.com>
Date: Thu, 14 May 2026 20:34:39 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IE1h?=
 =?UTF-8?Q?ke_drm=5Fdriver_const?=
To: <intel-xe@lists.freedesktop.org>
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
 <177872049045.69473.7759567322318905176@5ab824fced77>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177872049045.69473.7759567322318905176@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: e138ce1e-1521-4006-4619-08deb1e7767d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|4143699003|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: X55bg+dmJlWyXfQ/cwzS/SiFsk65w5HdqHH1lhiGzwLpI/Hn1qiIJEHUQrnXlJiHOP3vsIJ81M4uQYKqDDg/t3XBuHflWCyPkz3viu7fwZqOe0q5o1Y/A0y2BekCj/F4Ym5SqRrkgRnzaafZUD46P+8Hx5i0QlxBXctrzqF1eLQn3sPl+mgFZEoad9DlyU+M3Q0LsresUmTGXej0yi7+d7WG3LQ2Dvzgt1c6lxqa/Vvy/cY09rVRet6dnz8dqTMwWI7LW7EIE7TXiU0HsC29vhsQ8ima6rbL2N4+VkENtWWmV0VXYnkuvFJMQxxsDJSPRmUtSkmHNw15woSGLxAFPhOwpLhvhqu2cw2SPH/aKkX1qF7kWCeiGqpegpLkWPnPuJKJ264rhT7ng3edNckxF4JELyvjouwDTOJugtnYi0WfiZ4+2axaGGhzpsBBMBvvHkxlvHzl5a+lG526PQfrGKD0BF7juKBYk7iToFnRe7jmEgyruQyq9OG/Nvs3rXuB9hEJ8ZLlcgUvVUnh6H8T31dDK8zHek2+RkEXQpsxdyGfIhKN+azoomLOzRtw4XaAWTugdds553itlWcGQYhPVgpH664+oFZ3nlUv80475gXh4DKWtVs4rSXkgkf0+DABsOhErZEl+QvAtpKcdPlTrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(4143699003)(11063799003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXJvU0tQcklsL21NcXlUSDRmMEdkdlA4c0VlelFLWThPSDFsbGJCN0VxcFpM?=
 =?utf-8?B?TTgvK3Y3STRUb1g5SGNPUytaUXVreUVhTzdwYVBrSWYwVkNVZ01DTDdLU1F0?=
 =?utf-8?B?SVNCRHJKZEs5MklxUDI0TVZETVBLTEJyR3JaMFh2VzhYMkg3cGlMNERGSEU2?=
 =?utf-8?B?amJxZkh3R2pRYVNmVjFDZkJlTHJkdmpyeFlzRzhkalEzVGlvVDRsbUhucDVo?=
 =?utf-8?B?OUNnaFRpS1pYQkhrYWV5QnJQdE9udGJiNFdYYk12MmZYR2dqdGxVaHMrajY1?=
 =?utf-8?B?Nld4UWxacGU3TENMMmU5THNyUHNMeGRLREhOOCsxenZ3TkY3SVlMbGxJQWpq?=
 =?utf-8?B?TmEzMEljTEVHanllcldXZlY1d3Zua0M1aHozd0JaQ3ovanh0Z0RzNVU3UWRN?=
 =?utf-8?B?Wk1uWFl6dmF2VDdXOU52dCs5dXhtMjAyOXRiUGFzVE01aXRFWnVIQUllL1Yv?=
 =?utf-8?B?aG9lL2grc3Vpd0psSlFYdEg1WXNLVW5MNFpSSk1YSTBWY0dzdFpRUXJjMHNP?=
 =?utf-8?B?Kzh3QlRHK000eFNUYjk3ZmQ0MW56Uk1aNWcvRHpCNjl1V1dOYUNvVWFpTzdw?=
 =?utf-8?B?RndUZnhTTTBncjVsa0RwYVlFaHcvZlJlZzNWcTQ2cFBSa2V2SzMwV1pWV3o4?=
 =?utf-8?B?Y1dQS2xCc0czYWg1bHZmdnM5Zk1zY1pQTDh5YUVyTXFqSGpuWEFSait4Zk1X?=
 =?utf-8?B?ZVZVSnpxdDJBVlUxK2phN0V1R2l0K2luSHFTalZ4Z1IzVEJDTmQvVEhnRTNF?=
 =?utf-8?B?M3JUUmtlVnVnbVNTS2VieEQxQkZwbHBVRkV4bVhxejV6VkRMUkd5Tnh3NFZq?=
 =?utf-8?B?OXVML0ZqeGZyZGNKc1FrZ2ZHNENRcmpvamlqWHZ5eFg5MDBoOWF5ZklyVTYw?=
 =?utf-8?B?Z0d0MktnM1ZQUkN2VFBRcW03b3ZpaEFPdGVvNDVwaStKdEJYamx3TUxJSXFB?=
 =?utf-8?B?TXROMkhUQnNiakk5QUtoOUNKckhCRE9xMk4yUHUyaElnY3loTGRpbnFjUjUw?=
 =?utf-8?B?TVJLOHY5ZG9zN1VGc01JNEpScDg4SWhTbHFJR01kRStSSWRMZXRpKzRKdFY5?=
 =?utf-8?B?MnpsT2pWM3ZYeEV0K1I4dXE0WDVlWHJPVWZvdk1pT3pqbG53bjRheEhISnhR?=
 =?utf-8?B?d1U0MUhMTUZ2dUl3RmR0Z0VSc2xXVlRKY3k0VEFTYkM1a0lFa0MzSVVzQ05F?=
 =?utf-8?B?aFF5SXdYZ0F1TUVRTTk4N0ZkRWYxRXN6YmpwTFBYMUY4b25DV0syT2RyclVU?=
 =?utf-8?B?T1lXcTFDTzRmVzVxekpST1FsRTk3elFYaHlPUHpDWFNzWDRGUUFxbGZacEJr?=
 =?utf-8?B?dy9DemNrQW1haDlsdlNjWUEwWXNHWmVZUUVYc3RYQVJhMmJTZ0NvbktOUFNI?=
 =?utf-8?B?YzFSVWRsTVlvZUt3ZTczWHBPaTg2Mm5MRmpiYjFYUGd0b1JVeVYvbURLZFpW?=
 =?utf-8?B?U0JSVEJudlBqMVhKNjVDbUVGdUkzVkEzRnJESm9PeHdQSjhmRHhCYjJibTdJ?=
 =?utf-8?B?YXBzQUpZS3I2MWNVZW1GeDM4QW1DcVJRd3kwZlI2K29pd1lMMGpVcUhMSit1?=
 =?utf-8?B?NENkQjkvWGV4Mi9iK2xib3RzNloxeFVvRVNBbmlMQ3p2YW1YUFVueXEyTXV3?=
 =?utf-8?B?a1BKV0tRU3pxN2lXb1MvRkJsTHYvUDVyQkpRajlmcS9jdEJzbmlzV2YzTzly?=
 =?utf-8?B?WVZFeEtIL2llQ042N0JCekh6Njh6ekFtY0pFYVFVSk5FeFpkNU43MVpJQ0dY?=
 =?utf-8?B?cWZaNnJmUGZWSU5sU3lDWjZXZUdUbE5sSWZTNnZ5eVEzMVdkOVF4QjZZTXZU?=
 =?utf-8?B?TVFtaGZFZlZHVEFpSDBsRERkU3k1QmJEZGtRNWdVUmFJSXRHbm8zUmMvUkp6?=
 =?utf-8?B?QzZYamg3MDI1UzV6cXFucHNYejJZcFlzUVk3Q0ppNHpkK3VobXJqaHp2OWF4?=
 =?utf-8?B?SWpodmRVclBXN2NiVEF1bVpDdmxmQ1V5NE5YRkxrZmV6MWNTNHdBdkFNeFN4?=
 =?utf-8?B?YVhhU0tXY0VDNzFUZGNBSzdpajE3MFFNMmdpd29VUkcyZHNvWHhXNi9KQnpH?=
 =?utf-8?B?VDNZK1gwcXJydnRFN3BwZEVsS0c5bWMrZ2Z1aTIybjZISW9yUXI3dUpPRkNH?=
 =?utf-8?B?S0d0TWFGbUpUcEkzU2hNYlNqRHZjelZjTjY4d253blJGK0ZYRU1FTEpJWWY2?=
 =?utf-8?B?cVljTFVrdzRkZmJyWmFheE9Vb2dHOWZzd25ZVmhIT1p0dmdoWDlreGZUdHBJ?=
 =?utf-8?B?NmlwYUlBcWI5VnFON2dqV0tuQnJoZnVDbGNibXBEa3M2S3Uyd3gzNjdQUml6?=
 =?utf-8?B?RmVGMCtNZTJXNWhMV2paNGtmSUFkOEF2N05OVmR3eWF5TGRjUXQzMWFpVm1X?=
 =?utf-8?Q?cvL/ns2Wba89y6us=3D?=
X-Exchange-RoutingPolicyChecked: uRPDnIt0y8wuZEvtJIWuTGYJkH365d7xDvP42sxayaXeZ99FFDJSJxdeeAcLtchjzg8CB5pbTBwI3xE+FnA/YRVwou8E5j1CWO1Tt4QD46PfCFjjBDa2YxcEEn2N3xyEEWQ5kfSlgPpSCzyRb1E8Eh2Ndnyy2NRAsm/KYdvS9iqGf6GqtALeFkTHWTZ9UHfpaKOZC4mWqXFfGWtbK1Gg++Q8pcUecPXt0l7/dOah76IXTiIntzJZX8WGhqfVTYNgfgWpikx54DAGY0V5GY5jsx8OL3+oHmgKf4GJSOhT1m48Pg7xAhP3DabEXTpLlLnMRxJ0jqNUT6jhVtXbIJgPTQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e138ce1e-1521-4006-4619-08deb1e7767d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 18:34:41.8904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gu0H/sdgRmesurFRZXn7oeb2JM2W3/I2E0cTLXU1hm4CFlX2YkJO4WUlK0kjmdVyWKZl8iJN4GqkhDNgxdq/IZmKi8LverTxITQ6IZ4IhVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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



On 5/14/2026 3:01 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Make drm_driver const
> *URL:*	https://patchwork.freedesktop.org/series/166441/ <https://patchwork.freedesktop.org/series/166441/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be_FULL -> xe-pw-166441v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-166441v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-166441v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-166441v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html> +19 other tests fail

it's a GuC crash

<7>[  103.825980] xe 0000:03:00.0: [drm:xe_pci_sriov_configure [xe]] PF: disabling 4 VFs
<7>[  104.867824] xe 0000:03:00.0: [drm:pf_update_policy_bool [xe]] PF: Tile0: GT0: policy key 0x8001 'sched_if_idle' updated to 'disabled'
<6>[  104.868464] xe 0000:03:00.0: [drm] PF: Tile0: GT0: PF..VF24 provisioned with 0(low) scheduling priority
<6>[  104.869202] xe 0000:03:00.0: [drm] PF: Tile0: GT0: PF provisioned with 0(infinity) execution quantum
<6>[  104.869904] xe 0000:03:00.0: [drm] PF: Tile0: GT0: PF provisioned with 0(infinity) preemption timeout
<7>[  104.870736] xe 0000:03:00.0: [drm:pf_update_policy_bool [xe]] PF: Tile0: GT1: policy key 0x8001 'sched_if_idle' updated to 'disabled'
<6>[  104.871455] xe 0000:03:00.0: [drm] PF: Tile0: GT1: PF..VF24 provisioned with 0(low) scheduling priority
<6>[  104.872228] xe 0000:03:00.0: [drm] PF: Tile0: GT1: PF provisioned with 0(infinity) execution quantum
<3>[  104.872934] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: GuC Crash dump notification
<6>[  105.065584] xe 0000:03:00.0: [drm] Tile0: GT0: trying reset from dequeue_one_g2h [xe]
<6>[  105.065660] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.1: **** Xe Device Coredump ****
<6>[  105.065666] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.2: Reason: CTB is dead - 0x8002
<6>[  105.065682] xe 0000:03:00.0: [drm] Tile0: GT0: reset queued
<6>[  105.065682] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.3: PCI ID: 0xe20b
<6>[  105.065686] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.4: PCI revision: 0x00
<6>[  105.065688] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.5: GT id: 0
<6>[  105.065690] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.6: 	Tile: 0
<6>[  105.065692] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.7: 	Type: main
<6>[  105.065718] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.8: 	IP ver: 20.1.0
<6>[  105.065721] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.9: 	CS reference clock: 19200000
<6>[  105.065723] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.10: GT id: 1
<6>[  105.065726] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.11: 	Tile: 0
<6>[  105.065728] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.12: 	Type: media
<6>[  105.065731] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.13: 	IP ver: 13.1.1
<6>[  105.065733] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.14: 	CS reference clock: 19200000
<6>[  105.065736] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.15: **** GT #0 ****
<6>[  105.065738] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.16: 	Tile: 0
<6>[  105.065741] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.17: **** GuC Log ****
<6>[  105.065744] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.18: GuC firmware: xe/bmg_guc_70.bin
<6>[  105.065747] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.19: GuC version: 70.65.0 (wanted 70.54.0)
<3>[  105.065747] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: GuC Exception notification
<6>[  105.065750] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.20: Kernel timestamp: 0x1C63EC3DC6 [121935510982]
<6>[  105.065851] xe 0000:03:00.0: [drm] Tile0: GT0: reset started
<6>[  105.073225] xe 0000:03:00.0: [drm] Tile0: GT0: trying reset from dequeue_one_g2h [xe]
<6>[  105.073321] xe 0000:03:00.0: [drm] Tile0: GT0: Capture 1.21: GuC timestamp: 0x16B43077 [380907639]

but it seems to be happening on this machine, see #7774

