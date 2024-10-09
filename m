Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF42CEE342
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 19:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A858C10E7E5;
	Wed,  9 Oct 2024 19:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RO5qCShb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112F710E7E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728502912; x=1760038912;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V76X28xltuCMSDYIeswyFJUzpPgOSn5p+pyiC1GxTGE=;
 b=RO5qCShbmeObL/f7hn0rp8BPavX9/3qNZHjkHEuVf2TevAk+gwQU2NUM
 zPF8z1ZCNoDBf9GBP54bBj48ilUqeFbk7qlOKh+FmKEIkPLj7KOVs9KoV
 9VMd9GBOZf6R8qyquZbcBGUu6pxyGxXTEgwwRuwrOYGI2F0AZC9a32tib
 FHLrLpVHr7VS7DwpMcPphwyCPZufio8oQ8AinMbUihSEjdTf/BlZesQ5W
 On2riAfipLAPQBto6PJSGn8IlYkmZpPieSUJr5CwoTEemHr9j0ZmR+pw4
 kN9aScuSzLCGRGTySvFFalfM12+ypPK9UvpMsKV5rgptGUFH1E5JuESx2 g==;
X-CSE-ConnectionGUID: uYSF+DaGTuWcGYTbz6VgMQ==
X-CSE-MsgGUID: rQ8aHutbSgmEcV1MnsLotA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27720854"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27720854"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 12:41:52 -0700
X-CSE-ConnectionGUID: D2ZuZ8LeTpGyE/kdOk251w==
X-CSE-MsgGUID: hQnV2dBjQ2q5KmJ8PdDizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="81157482"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 12:41:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:41:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:41:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:41:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 12:41:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 12:41:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koYQfj138ElUTDZqTnaH5rM1YZ7LtrWaxH4h7o/UEyOH+K7MaGMYby5ZjKdxtf8Ry6t84J+HmTaQNuircYLJDGZv4oj75/P6vA3Y4zQoOUmBY42n4jxHJ5T59nZdVffy2xa0/JScXnLZ4noL7W4nVB8f3dM6/AJ2ozpdQMBe1OZnaqDX9nHKNvwp6ZjKvyaPoeDBO1dLpu6kHKdIGnhJwLG/+etGphC16tebWMtMs0/0QpPzYvTCYdf57LCbaWiu6VAAFcb5njG4Sa0lPfAvZVHv043ciJCTB0GX2jSpXHj9fmtlhRaLz1i+OQLeQHZu1YkOMsoKlKfhJ6VIXBUxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ym1jLC3X65gt7ImlWOljEm/TL5MOcrH9HQR34SnHJU=;
 b=f2C22t06hLuUReHcQoSQ33g/MxejR2NwauAPxQprnYkXvnWQibT9bT1WLnMRwO+mf5FqXNibWUmA8AeaK1MAmK86639dZfDq/2CDnjrKQte4LFAN1hE1UZAoRoa6rkYSalXzgENu1x+YM0Q1EjPbc9cj1VoMzxgM3RapGOgYspo8pWwI9sTCyi3qWv5VZgbRWTcEZr7uRCGNaWrmbTuHBCIOY4IysiDmNgINdok7S0vqXhRxMw/PxPMuzKZcY6srdn3QkBvp1RUBQEd8sE6Ao42e4kGYmJQjhQ3yq5KV/fJadhDE+qwjzDJjPAXUMgpti+zTy5EZQRG/K8c962+IVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW3PR11MB4617.namprd11.prod.outlook.com (2603:10b6:303:59::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 19:41:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 19:41:44 +0000
Message-ID: <8fc6387c-90cb-46b0-8d4e-5c2a933df911@intel.com>
Date: Wed, 9 Oct 2024 12:41:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/guc/ct: Improve g2h request handling during
 async gt reset
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <matthew.auld@intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-2-badal.nilawar@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241009105645.1416588-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW3PR11MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: 470e3c8c-d759-412b-38c7-08dce89a677d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzJjVVN2dDFDQzFUT2ZyVXZxQmllYlU0S0M1YXVORjJiYkNzT3cyaGg1c2JB?=
 =?utf-8?B?QzV6dWJWSFJGOHMrRW9jYXhXWmdjTGY1TEdWRlVOM2ptZm9mNVJNK05zTlBF?=
 =?utf-8?B?bjV2dkVoUXQxYUdXckk1MWZ0VERId0cxeFVFVklhbVB0ZGJCZUJON3hFbVpV?=
 =?utf-8?B?ZUUwK0FiUXozNC93NlZwYWpvbEhKYTJoM0hETUFqTWhNSjhGZG4vT09qTzZH?=
 =?utf-8?B?Z0xzM3BBTE0xdks4bmRhZEE3NmY5TU9CSzgvMUZMaE9HWFRVMkJoTEhBN0Ns?=
 =?utf-8?B?blBLRzZlOVdna1BoWTRxMnJSRVBlWXdWOUJBeC9Zbm0wUjkyYXJoRGs3cXd2?=
 =?utf-8?B?YkswckdvellCNjBCY0RTcU5lY0k2VVBzcGxOM2dETWxwZGdDU1VQenVBMkdD?=
 =?utf-8?B?Wkdzbzl3K0JoUElzZi9STEcwN3Y5MXRmaElvRzBUQzRROUdpdGFJS1Z2b2V6?=
 =?utf-8?B?WEw2K3dKck9JNlBjd3YrbGlhWkFVemRmMVhFWFgzays2Yzc2WXlkVG5ObFAz?=
 =?utf-8?B?emUxcUlnRlp0bGNSb2Z1RUVHSGdROVlWYzZRR2xOL25LT1BhRVZhSHNYcUdj?=
 =?utf-8?B?Qnd0QTk2cmNWMldvdGtiTjhaWHMxdnhlS2ZETHh5RTdFd1dVaGN2NXk4bWV1?=
 =?utf-8?B?QS9vbzVKU05rM3pNNXp4NmF1aEJVV0RwOTNlUUo1QitsMW5lcnlpV0FJVEhp?=
 =?utf-8?B?bzJ2ZEIrUGpaSVFHeVZLS1pXUmxUNHBHMnJWcVZNZU1mZ2dYcXdSYmFMVmRr?=
 =?utf-8?B?bUtpVlFPcG16QXFyNDZJeFl5Y1VjOVRXUlZzTXdoTFM1TGxva0J0T0l0TGRP?=
 =?utf-8?B?S0JMOXhNWG54V3VGT3Y2SnBScFhjTHlrWk0zejNMTnhQSGZDNHNodEZqZklu?=
 =?utf-8?B?VWpqTCtMQmNZRUxEK0V5U1dETUdnQUsxRitCZ2xuZURjQ3oyK0VDRTNPNzJL?=
 =?utf-8?B?Ymx0VWN0OXR3YUJKZjkyT04vQjB2RjJhU1QxNmEzOFRsQjkzd0FnVFh4YUoy?=
 =?utf-8?B?U2krdE5KSENPMWpWTTlrTW0yZVErNjlORWEzTW12Z3g1N0lBVzVkeWdrQTNz?=
 =?utf-8?B?Y2JSbFVod1huTzR1VGVSYi9jb09CMzBOYWNySGhJQzIyWlYwUERYaVNlYVhQ?=
 =?utf-8?B?QmYreFh0NWpPT2ZJU25sYzZxNkdjbzhDUlhpcmlGclZMSk04RFdDVGphaXRl?=
 =?utf-8?B?cVA4b0txQ3luRVBTUnN1Ukk2TnRUVTFWVzBGRVFRVDlJV1hxc0FPUkJsWFpS?=
 =?utf-8?B?anJ5NVc4MTJIcUtvcTlkVUxWSm5jYzhNUnFKZnZIRDRjZkRzc3RwQWpMelIz?=
 =?utf-8?B?U1lvOUc3MjBzaEZITVVyd0RGRERYcWxnR2JqZ3JMcG1oRjF5UU5LWVRSc1ly?=
 =?utf-8?B?ZFFlMThhKy9qdEdXYjdpMDFrSDFSQ2paQy9sSmdrbWNocmQydkRiNDZ1clpT?=
 =?utf-8?B?RjdLZk4raERITlJLYmtLTCtGcFVFYmZHTkk0TGVkRFhia01jbVV0R3dVci9p?=
 =?utf-8?B?aHpNRU4vb3dDZUZBTnZPSkduQTlaeHduVGtURjd5U3ZmaXFiT1ExZ2MyTHN6?=
 =?utf-8?B?eXNBYTNrbldPcENLeVRoa29ZMjlkVXF6NlFIemJsT1JoVnVwVzc2NThtYkZt?=
 =?utf-8?B?OEgzK3hZR09Za3FOVFY3RzA1NUVPU0hKR3JrZXdmOGNIaUgrdXh0STdqUGtk?=
 =?utf-8?B?VFIyajRTS2xFYi9pNEgxYVlUUnppY0NTRDlOWm1QZFJRNHFaT3JTZDVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dMOG5vNUo2dDFuTGVyWFpyNTdjbkUvN3J0ZTUxVC9XNG1mNlBQMDJUOUdi?=
 =?utf-8?B?WlNBNlRzeVJNNW1UV2gvZmN2NzdmVlNQcEJITU52Nm8veXlLZDBBWXVBNTBF?=
 =?utf-8?B?YmNKUmZNeTBaeTR0WkxrSzJDWDc1aDVFNWl5UFd1eEdCNVhwWnhPY0lsd3dN?=
 =?utf-8?B?dDdnb3hTRjUxZWdwT0NyQ1hwdzhiZ2lScndJWEhId2pUa0VoWFI0c3Y3eVQx?=
 =?utf-8?B?TTR1U3M3VGIzOWhySk5OQUNGYjFXSnJpOGc1cnVFOS9aSElsR0lkZUxEU0Vo?=
 =?utf-8?B?UkZNM2VLVDVrVzlCb3FuTUxFdW9LYitQMWlZMDVMQ0YxemFIci95TkhEUElz?=
 =?utf-8?B?TjYwcWh1WjJ3Z241YzhOTDMrQVpWdVhyazE4aitVdEcvVHZ1bXRzRG1lOU5F?=
 =?utf-8?B?Yk5JaUVxTlJWeHN1QnhzMUZ3V1lJeW9BajdnNnhLVWVtMndoZDN2ZlhjUnMx?=
 =?utf-8?B?OUxtOVRja1dycVA0OUpuZ0JiVy9mYStLS2JnRWZnWDdtVTl4N240YmpCZ2l2?=
 =?utf-8?B?OEVMR1lNd2VCT0Q5MG1OR2F5NkM5RFpLUG90d1BIRHlZK3ZSZVZSV2EwNG9F?=
 =?utf-8?B?MC9kc0xjWUIwWGRIcjlJUExHOHhCNkRzYW44SEIvdTRyWmdPazBOQUZObDFQ?=
 =?utf-8?B?VGRZTVZjWERBRmxIVFllOW52c3hvR0swd25GbFpZbWRTRm5kc0N3dVdZc0Vl?=
 =?utf-8?B?aFpjaElSdUxmSmk1MUFzK0lBblF2V1VSWDZiYVVVcjlob1hjeUdvdyt2T05H?=
 =?utf-8?B?SG4vWllkUHpMaUluTEVxbXJNTXhHQWU1QzdpTjZXaFlNeTgxZ3JyVmdjZUNM?=
 =?utf-8?B?aGd1YnVHc3crR0FCYzlIZ1dEaWtQT0d6RVg1UXF6Ylp2UlI5OHBFSEsrd25M?=
 =?utf-8?B?ZHhyZVpXQnR6bTdJMFVPUGtZMG1OU0lnYndRTEhaWUlQYTFLUnVzT0N1YzZF?=
 =?utf-8?B?Um0xaTBJUXpCNFVMY0RyeDhmS3NuK3JpVlZUN0wwNkZhMldEcFRlaTR0eGhh?=
 =?utf-8?B?ZDB6MUlYK1BrTDllRWx4a1UwSVBtdGdtRDd6ZG5BMWtlZ0J1QjdVRXhoMXFO?=
 =?utf-8?B?OVpNOUF0NitxciswM09QMndyejlubVlZM1BxTk5tTG5jRWtwY1FMR2JIblQ5?=
 =?utf-8?B?SHJwemhZOXRvcVN6RmtJb0wvNVcxNjFQTFhxRkhJNEZZTXo2Vys4ZDY1VlAw?=
 =?utf-8?B?K3R0cXoxdXRza25FWWhrSFlrQW5VUjk3MVNSOWtOeENrSEt3cFJjSmtwd2Np?=
 =?utf-8?B?MitmdGUyNnJYVExGaHVLUkhDWmNhLzUvYXlQZDZza1pvTWl2c1JpaUthWWR4?=
 =?utf-8?B?QXJ5ZGZid1AwaE9PaS8zanRvSzFEY3VDQkZnb00zODZFNEUwSFdNL2laejJC?=
 =?utf-8?B?eUthZ2o3eEtkZFlqbitSRXN2NzgvWElTb3BSbzZHYUhkV2JoUlZscHU3REV3?=
 =?utf-8?B?cDczcE5Hc0hJNnpPekhScW5JZVlCeXBjakYxeEl1eWUrZUJvWXFzaVI4VE9a?=
 =?utf-8?B?TW1yd0tmSVNBY3o5RkNYRm5wZ09HZHhwZWgrcFZianlySWpBcUFIZVZaeGJT?=
 =?utf-8?B?Ri80WjJ2Q3dROXY5WlJ4QzMxQWtGZ0t2RzkwWmp1R0Z1czVLMkF0bGZ2VFov?=
 =?utf-8?B?ZysrWWdEaEFrdmI4YUh3ckZ5YmV0ZHNuWEhBRzVoNWtjc2dxL0RHWXU2Zzhr?=
 =?utf-8?B?MFRvT1NOOElaV0VFS3BHUDIxMjBBNFUzZTJlR0pMYjNNYmRJcFllYWRIUG1G?=
 =?utf-8?B?UnRMTTVwTlFqa1BKa2ZqTkNpQzZQaVdaZzZDR05YSkd2NW1pZ0g0YkRpMnI3?=
 =?utf-8?B?T1ZTbGRJaUlIV2MrT1hSMElQYWR1MFVCM3BWQjdlT2hycE0wMDZjVEY0OVZ0?=
 =?utf-8?B?ZzVIYnhmMis4N29Rb2VCOVdvcG42SmdnWXpMR09HYTFDUmdNWjlCYWZONVd0?=
 =?utf-8?B?OU02YXRpTFFYZmNLcHNaVlpPSlZrQytnK2R5Syt3Q0tRSkZBbVMvQjJOR2g1?=
 =?utf-8?B?eHB2Vmd4UTJoc0RrYWpsb05iUFV4SXdJcGRpSlpRejNERVNua0VueFhzanpB?=
 =?utf-8?B?WUFDb25TYjVUZ2tEaG1ZeVJjZUsrV3VOMUh2SFZQYUlpdWhkQ2ZHYWczbmhC?=
 =?utf-8?B?TFZwZEY3NWdBUUJseGdaQTBublBCRXFibnUvN2NhbnkvWkZzOU91SGg4Y2JJ?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 470e3c8c-d759-412b-38c7-08dce89a677d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 19:41:44.0526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7lBLzyJ9hqECtVBhK905qQIn7vXFlIY/DCHCf4HTjOUk/YCM0lTgojSFum6ZqniLoumW3pL7pC+hVwPqtE0kNvMxiRd8EmZ6NIpDoQqvG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4617
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

On 10/9/2024 03:56, Badal Nilawar wrote:
> It is possible that a g2h request may be cancelled while waiting for a
> response due to an asynchronous gt reset. This commit ensures that in
> such cases, caller will be notified by returning -ECANCELED.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c7673f56d413..b93b2821e4e8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -512,6 +512,9 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>   {
>   	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
>   	stop_g2h_handler(ct);
> +
> +	/* Notify callers that CT stopped and G2H requests are cancelled */
> +	wake_up_all(&ct->g2h_fence_wq);
>   }
>   
>   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> @@ -1018,6 +1021,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   
>   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>   
> +	/*
> +	 * It is possible that the g2h request may be cancelled while waiting for a response due
> +	 * to an asynchronous gt reset. In such cases, return -ECANCELED.
> +	 */
> +	mutex_lock(&ct->lock);
> +	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> +		xe_gt_dbg(gt, "H2G action %#x canceled as GT reset is in progress\n",
> +			  action[0]);
> +		mutex_unlock(&ct->lock);
> +		return -ECANCELED;
> +	}
> +	mutex_unlock(&ct->lock);
Is the lock worth while? It only protects a single read of a single 
variable. Or is the intention to serialise against any other operations 
that might be in progress and holding the lock? If the latter, it would 
be better to include a comment to that effect.

Also, the very next statement in this function is 
'mutex_lock(&ct->lock);'. So now you have unlock/lock back to back which 
seems redundant.

John.

> +
>   	/*
>   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
>   	 * the stack, since we have no clue if it will fire after the timeout before we can erase

