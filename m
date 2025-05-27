Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECD7C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 21:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F8210E070;
	Tue, 27 May 2025 21:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCC/27S1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE8010E070
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 21:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748379703; x=1779915703;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zBCrn2lbndvG/BhO1GxMiPoPsZeZnp1v9lsBrYbaoLI=;
 b=dCC/27S1DOeUgBQ08NGk0LwEEttD8RDtM26+k39wg7KUkGWC5C+6bshP
 A1q96rrBOlugfrVPoO+zsmkfnwYKcA9Yy03Dr3TU6MhNdxXQaS7t319Xv
 SDgtD9VmaXkmLJJ488rzklQFUI4uQ9P2cv79gBrHz+12fOcdaT5wpi+tC
 oWIBronpQBVVQTcgoAOVjb5i4147UCrzgUq6BP6MQ8cDGU4FEUs9wT34n
 IfOZJaYxsZLCq6l0cySxOxufBfFl0qLCpk/Qk86vgc9pA5Wbx5EVVwfXh
 4+99hHey5Zg9Gaj4gL3tvOlAR2VwPSt0t/7588+gcSF7Hv8rht5EFusj6 Q==;
X-CSE-ConnectionGUID: crbu0luwQ0SJsESctlyusQ==
X-CSE-MsgGUID: Cvkh+fUfQqa3i+NE9qvAUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61793899"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="61793899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 14:01:42 -0700
X-CSE-ConnectionGUID: zl/MC097S5yD9LffVdq4Dg==
X-CSE-MsgGUID: aXXdBxnrQ4yYbbEpxN0xyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="148256021"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 14:01:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 14:01:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 14:01:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 14:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QF3ZiT0iTz4hvS0lHLgFZisPF5qoZ/ped0hD5laiyiRC+jse0oIECms5u1M0TPLJ7koUsr6VFcE42DI4dLpwjhOpeC4TU9/VsQ0qDa9o5tHMKGs0m/zAtujwn5fUbrH28EXmTgLyqdHu7tJyLXVG6LCrTho8+upozA8pcxFRthEKPXfVE9oUUXYWnYdVqcx4IS0gMzEKC8jlZPcaOFMTvT7u+1ajUA+96AVpr9cbXh6XWxWqlfW0qZjZpc/Iq51Su4c2YMT4FNpTV/38VdsjOg45uWW+ZSmaoA72ofoxC2BpARYjA3kdd+MVqMpSeQkklQvAnT4BVHZbJR12Fn/dCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nURYUVgDyFVYYyNKtox6YuDDS5mEJv2guz8sGTsj0Mk=;
 b=Eff7JpglftqCboXpZh7XZHNO13JLTz0IXb4h74KFuuCkzk0KkORMwPUAQO6O7cGTMSmzUhcnvfcAYE1d2EnICgUN2o0Xe+LgfCOrvP6BnrMCbocD6wk7L0M1m/XBFkvHtZe54Q6hhuKhOctR5EEnN+s2JtObZWtrKPcX823HDCXHQp8CZ9dLHvPF1NlzRNklx7XTeQDJ7rURKv1YdFr+FzHDhZ85UW7llSpnJ01jTFTz6EiByhO8nP885C845vjkVb/PO1zl42b/0o4ED5KGHKmZMbfFuTUhiIn5XdzLkMET07zMmd2KiFYiXBAKmdD/eR1HKZ1vzpDVXjbIofhCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8276.namprd11.prod.outlook.com (2603:10b6:510:1af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 27 May
 2025 21:01:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 21:01:38 +0000
Date: Tue, 27 May 2025 16:01:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add configfs to load with fewer engines
Message-ID: <7hooiertwneqmkzplfduwsv76co7ddxj7275zq6afbm7lqdayx@o7der74imqw2>
References: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
 <aDDjS47mHJVBXHZU@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDDjS47mHJVBXHZU@unerlige-desk.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f853e2-7bad-40b8-44cc-08dd9d61ac55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OO7iKsa7LPtBYsV7irJ9IBgGHivnPeoJmzCBSpGrzl64C1Htyyl4xRUFxE?=
 =?iso-8859-1?Q?50UoFS99TXtgASdBJWkTJKOL/VnOomtW2f8a9VJwp9+kwo7YabSqKaESFn?=
 =?iso-8859-1?Q?WKU9n5coIQJzky6cbdrUjyH662Nnm5S1iLUjhWKJKVXOouE6c+dGSjtxS8?=
 =?iso-8859-1?Q?em46NZJ7sxD/sMq9Jp+MUJLRCdf/MUqAmr7GM2go/ib9tUPylAEJsEGDSt?=
 =?iso-8859-1?Q?l1hY4aTvk7wVD5/MLF2jYJe2/T8Tf6Pcye/V+Zoetj1H4LGW8IzSArnVRo?=
 =?iso-8859-1?Q?vN3rJLoaxCg6UXIAgMWxZXaBq5S3/2hDFmhp7S4c0tFcoQNxTfn1urXMFp?=
 =?iso-8859-1?Q?frqPOu227XeOhmK14NCk5JXJhdVSHLvqiRt4cgXealE894D3LABknnfobD?=
 =?iso-8859-1?Q?ZMpQPNbh4ja5ipiFG/d43f4kxXj+76WBODo8kq+8M2wvWwvqXRTW4/vo6w?=
 =?iso-8859-1?Q?4LB9Ddsf6PzpijCgL+pvD5gIEyUmPXZjlJU4JzAsn/ALAj+ov/aGrwiAlM?=
 =?iso-8859-1?Q?xhPqXDBIuR9lVK9tzzbtd02/w56d+ZFG9M9TVI1OJzWd92Pcb7XDc9+pPI?=
 =?iso-8859-1?Q?GgFLsySj/OrWcISnLnlI9+cDDm4twZ2FkDYVNitdr//FeisocHfrVuTOdR?=
 =?iso-8859-1?Q?Eiw/2oVXFts13lo14NkHMyGAmNAbBlruYv4dmMOTMe5ujn2fhbxRhn0d9d?=
 =?iso-8859-1?Q?c8WwhHJw2EYwBvsl7LHR5xxXdbgT5aQXw0aba/Y0vNlQ7wa22RidxwmGls?=
 =?iso-8859-1?Q?dOs0VwNRMPoxofpaPTIs3d6DTa2KEqCu8nEd5T4Oz70jQn49cxWyaeVBT/?=
 =?iso-8859-1?Q?rILyDWAGjDw4Y6cD0wNvR9YTFkyMGPlddizw1zRLTQffdiL5tJ1POC5kuI?=
 =?iso-8859-1?Q?5owuKnohzaR0QcTBBBhJwmbyPUJfG8OJnGjzJk/YYncts773V+JBlPKys3?=
 =?iso-8859-1?Q?8RZChWNd7sftwIRNUsuaawd2HecRa7Y//PUz8z/zjzwV1MS8D0k0LSX7kl?=
 =?iso-8859-1?Q?j7Uq3XXp5gfTmsQQWASIfrqp6NM1WwdT5CZIHy3lp59Vd/eHTOD3FE7BsD?=
 =?iso-8859-1?Q?vcyJA9y39QlUalSGHcfNs/WwIKOhS1/CaKZSwhIHTJMA0uPd0E7Cnzugmv?=
 =?iso-8859-1?Q?qPsd+Bxmz2+oO32CiDWd9oXHw/Px8QyzJeVbTJZw8zFyGvJAxgApQd8KtB?=
 =?iso-8859-1?Q?qr531CddOUoEKikvevGmsUSYYDRlHVzYLObE7wLmQBVT6Ow1a26IrYGnGH?=
 =?iso-8859-1?Q?3Ezpr0g5jkU3RgXCm3J7+MXbBjczEnAwbJeu55cNioE9BFCUz2LpGkdwWB?=
 =?iso-8859-1?Q?89a1YSXKgOPKy8znfx/UozCeK6Gw5QAZAEMOuRTSoJg/ihD6ilIB11nt5n?=
 =?iso-8859-1?Q?b195iJKFsB/VM3LE7mN7dWiVGYzwz2bnbbVUVPfc/8f8dRmy2NgvJJ9nnE?=
 =?iso-8859-1?Q?SOt4wvYmvCjRo/WfuKc9nqbTLoGGUSZtx1Y27tEk/tjFop1dRre70Rr6t6?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R5W7Uun8ub5xLzS1Gr4Y8DEAiN+UWLxxpCqwyNwHIGEnhTr8y7DMBw2JT/?=
 =?iso-8859-1?Q?fWur+foAni9zFXn1h3lScYb+tU0BI5OnAo8pxaqTrUgPhmu53Qn9RLj203?=
 =?iso-8859-1?Q?WeL1Kd9Fk0DpxUU/HZFfn8yVZO/AIKEH0WRo/Kfi0NqwhMOaKP/F7ylq5J?=
 =?iso-8859-1?Q?i/b+vSMbQKGr+JWfyalWqU69o4lVKVZ4MvUXxGUEAn50PEaLDfSF0WgmH5?=
 =?iso-8859-1?Q?6dlszkZO6B2z4cIH7IKKA97TUJvkzNzUE+7bPNz7EGrWU/esiI5NUJZF+T?=
 =?iso-8859-1?Q?350mSlJK8T4k3CUZMGtgAriOHXhZrz63wypyOkWalKFS/HBnv5dt/JfHqs?=
 =?iso-8859-1?Q?NWlncY5ibZcWG4zDseKwLBiaweEvmjhA83vSaylaRixoBTr7FayI9t2e7X?=
 =?iso-8859-1?Q?JQR56nECXw6Eu5Cv20ZksakCM/kbNma/SYkpeWFrhvkvWX+K1fyzebOD6O?=
 =?iso-8859-1?Q?Y7/9X758Yaf8wBv2W+zEmliJWP5KQVdfzETUcD6+Yygm+spejdTTO+chdw?=
 =?iso-8859-1?Q?NIaoDtXyippMNMjKC2Kb5Vc+sirL2we29lULVOWUzRgjeERabv/t4HwqPB?=
 =?iso-8859-1?Q?ghy8OarnYp56cpyHIi26sn9PGtCepvKxqFzMv2DG3oZTYJKUcHLTLPjuP7?=
 =?iso-8859-1?Q?RfUID6YDJ45mCv/cuv8alEwj7RpMuLh8FI0p/g/bPhe7QM+ngR7J+R/trz?=
 =?iso-8859-1?Q?rowsrgnm6SXu6WzFtgIWtCnCrLQ+zNuORPMU1rl4dwwDStpgAFkAF2DiUQ?=
 =?iso-8859-1?Q?Q4ESwBjvhj1BZR8H+gGt8eK4yQcudxfIfLz2XS0D9AwnLd+nt8Sk+bN8OZ?=
 =?iso-8859-1?Q?vMiwwwtwl8r1wdrpfDazA6poIBcuIfIB5B0geKYzbHj4mvPKrdHlMi5SbD?=
 =?iso-8859-1?Q?VIMZvxyfV+/S/uo7jEdRgV/vFJ2miMcyPrLBEWifxxenhSOjBJffYbcBEa?=
 =?iso-8859-1?Q?mJfonBlYwvYsaom/4hnqc6QTRRCZ39dWNnEOc+1/17nmRe9qihdmCMObcF?=
 =?iso-8859-1?Q?t9YFnm4sic+f9KvCkhEcKRiQbTY4D9MGt4RWIBiT+K/cPjqxqzAQhq1K+V?=
 =?iso-8859-1?Q?+RhI/W7bMGzgYPM+inO+PsfNdN5zn8g/VL782ubj8W2eBa3g441gkxZrsk?=
 =?iso-8859-1?Q?fQsA4RfBSzb9A5MG18W/sDRvDPktqUe++MnLd0h3SaZFyaYylX7g0xzps4?=
 =?iso-8859-1?Q?AmdxsSZFlILGupeTwjems74HXsITVasrk3z/r1m0phahEdKDC0E2z/IeSv?=
 =?iso-8859-1?Q?8/sq3hQ95xe3EPeC+UqBIRA4nr3rOQY5geRdh3jwkQYQchpzCKfEzC+5ja?=
 =?iso-8859-1?Q?7ZW+EA56biKcGrwnkFnFqWAhe8dybSFXnK/LLD2sxxpgKxoq0vrLq5ZhkJ?=
 =?iso-8859-1?Q?CmZ1KpXMzK3RCODRlMlELBcjq4IjhSYGquwXDt1vt9U3faIC71+swSBqni?=
 =?iso-8859-1?Q?YMR8wUn5XUwlJL4Jjguojj8aqMXUDvC2konrKZMiIk5+dKyuxfrkhy30C5?=
 =?iso-8859-1?Q?gEJAbSB6vzFgsuEfwoDfH3iISkFhwJnRhhstQymAo+jODLz4YGvE3YWXyr?=
 =?iso-8859-1?Q?LQY+UDWtuB55k11MlfqGQ/mqZ2UpcwLBtdRhMGz7FcnNzGvW6O9V01V/+C?=
 =?iso-8859-1?Q?4nLLcR12FMRBnkGVbOsxtYyqDgWONno3I80xgeHueYmQ5MMaLE7gKYQg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f853e2-7bad-40b8-44cc-08dd9d61ac55
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 21:01:38.7076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNE51FL2I4AVKkYkqzarHKQmLVU8EZzJTYtvrIGtDL0CxEOQp9leLJYTTIK/s5VwLOZyriviJnWcikC53YsWFPMFlL653XBY4RHKOB8dTPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8276
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

On Fri, May 23, 2025 at 02:06:19PM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, May 20, 2025 at 02:28:58PM -0700, Lucas De Marchi wrote:
>>Sometimes it's useful to load the driver with a smaller set of engines
>>to allow more targeted debugging, particularly on early enabling. Add a
>>file in configfs that allows enable only a set of engines.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>Changes in v2:
>>- Fix build with CONFIG_CONFIGFS_FS=n
>>- Link to v1: https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d23b@intel.com
>>---
>>drivers/gpu/drm/xe/xe_configfs.c  | 133 ++++++++++++++++++++++++++++++++++++++
>>drivers/gpu/drm/xe/xe_configfs.h  |   2 +
>>drivers/gpu/drm/xe/xe_hw_engine.c |  20 ++++++
>>3 files changed, 155 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>index cb9f175c89a1c..fb433503501c8 100644
>>--- a/drivers/gpu/drm/xe/xe_configfs.c
>>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>>@@ -3,14 +3,18 @@
>> * Copyright © 2025 Intel Corporation
>> */
>>
>>+#include <linux/bitops.h>
>>#include <linux/configfs.h>
>>#include <linux/init.h>
>>#include <linux/module.h>
>>#include <linux/pci.h>
>>+#include <linux/string.h>
>>
>>#include "xe_configfs.h"
>>#include "xe_module.h"
>>
>>+#include "xe_hw_engine_types.h"
>>+
>>/**
>> * DOC: Xe Configfs
>> *
>>@@ -48,6 +52,23 @@
>> *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>> *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>> *
>>+ * Allowed engine:
>>+ * ---------------
>>+ *
>>+ * Allow only a set of engine(s) to be available - this is the equivalent of
>>+ * fusing engines off in software. Examples:
>>+ *
>>+ * Allow only one render and one copy engines, nothing else::
>>+ *
>>+ *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>
>I would suggest engines_allowed everywhere here for readability since 
>you could have more than one engine allowed.

right... I'm doing this on v4 as suggested by you and Matt Roper.

>
>>+ *
>>+ * Allow only compute engines and first copy engine::
>>+ *
>>+ *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>>+ *
>>+ * The requested configuration may not be supported by the platform and driver
>>+ * may fail to probe - intended for debugging purposes.
>>+ *
>> * Remove devices
>> * ==============
>> *
>>@@ -60,6 +81,7 @@ struct xe_config_device {
>>	struct config_group group;
>>
>>	bool survivability_mode;
>>+	u64 engine_allowed;
>>
>>	/* protects attributes */
>>	struct mutex lock;
>>@@ -94,10 +116,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>>	return len;
>>}
>>
>>+static ssize_t engine_allowed_show(struct config_item *item, char *page)
>>+{
>>+	struct xe_config_device *dev = to_xe_config_device(item);
>>+
>>+	return sprintf(page, "%#llx\n", dev->engine_allowed);
>>+}
>>+
>>+static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
>>+{
>>+	static const struct  {
>>+		const char *cls;
>>+		u64 mask;
>>+	} map[] = {
>>+		{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>>+		{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>>+		{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>>+		{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>>+		{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>>+	};
>>+	size_t i;
>>+
>>+	for (i = 0; i < ARRAY_SIZE(map); i++) {
>>+		size_t clslen = strlen(map[i].cls);
>>+		size_t numlen = namelen - clslen;
>>+		char instancestr[4];
>>+		u8 instance;
>>+
>>+		if (namelen < clslen + 1 || strncmp(name, map[i].cls, clslen))
>>+			continue;
>>+
>>+		if (name[clslen] == '*' && numlen == 1) {
>>+			*mask = map[i].mask;
>>+			return true;
>>+		}
>>+
>>+		if (numlen > sizeof(instancestr) - 1)
>>+			return false;
>>+
>>+		memcpy(instancestr, name + clslen, numlen);
>>+		instancestr[numlen] = '\0';
>>+
>>+		if (!kstrtou8(instancestr, 10, &instance)) {
>>+			u16 bit = __ffs64(map[i].mask) + instance;
>>+			u64 val;
>>+
>>+			if (bit > sizeof(val) * BITS_PER_BYTE)
>
>s/>/>=/ because right side of compare is 64

this implementation changed in v3 and not relevant anymore.

>
>>+				return false;
>>+
>>+			val = BIT_ULL(bit);
>>+			if ((val | map[i].mask) == map[i].mask) {
>>+				*mask = val;
>>+				return true;
>>+			}
>>+		}
>>+
>>+		return false;
>>+	}
>>+
>>+	return false;
>>+}
>>+
>>+static ssize_t engine_allowed_store(struct config_item *item, const char *page,
>>+				    size_t len)
>>+{
>>+	struct xe_config_device *dev = to_xe_config_device(item);
>>+	size_t namelen, p;
>>+	u64 mask, val = 0;
>>+
>>+	for (p = 0; p < len; p += namelen + 1) {
>>+		namelen = strcspn(page + p, ",\n");
>>+		if (!lookup_engine_mask(page + p, namelen, &mask))
>>+			return -EINVAL;
>>+
>>+		val |= mask;
>>+	}
>>+
>>+	mutex_lock(&dev->lock);
>>+	dev->engine_allowed = val;
>>+	mutex_unlock(&dev->lock);
>>+
>>+	return len;
>>+}
>>+
>>CONFIGFS_ATTR(, survivability_mode);
>>+CONFIGFS_ATTR(, engine_allowed);
>>
>>static struct configfs_attribute *xe_config_device_attrs[] = {
>>	&attr_survivability_mode,
>>+	&attr_engine_allowed,
>>	NULL,
>>};
>>
>>@@ -139,6 +246,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>	if (!dev)
>>		return ERR_PTR(-ENOMEM);
>>
>>+	/* Default values */
>>+	dev->engine_allowed = U64_MAX;
>>+
>>	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>>
>>	mutex_init(&dev->lock);
>>@@ -226,6 +336,29 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>>	config_item_put(&dev->group.cg_item);
>>}
>>
>>+/**
>>+ * xe_configfs_get_engine_allowed - get engine allowed mask from configfs
>>+ * @pdev: pci device
>>+ *
>>+ * Find the configfs group that belongs to the pci device and return
>>+ * the mask of engines allowed to be used.
>>+ *
>>+ * Return: engine mask with allowed engines
>>+ */
>>+u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>>+{
>>+	struct xe_config_device *dev = configfs_find_group(pdev);
>>+	u64 engine_allowed;
>>+
>>+	if (!dev)
>>+		return U64_MAX;
>>+
>>+	engine_allowed = dev->engine_allowed;
>>+	config_item_put(&dev->group.cg_item);
>>+
>>+	return engine_allowed;
>>+}
>>+
>>int __init xe_configfs_init(void)
>>{
>>	struct config_group *root = &xe_configfs.su_group;
>>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>>index d7d041ec26117..c80131f994a71 100644
>>--- a/drivers/gpu/drm/xe/xe_configfs.h
>>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>>@@ -14,11 +14,13 @@ int xe_configfs_init(void);
>>void xe_configfs_exit(void);
>>bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>>+u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
>>#else
>>static inline int xe_configfs_init(void) { return 0; };
>>static inline void xe_configfs_exit(void) {};
>>static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
>>static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
>>+static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
>>#endif
>>
>>#endif
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>index 93241fd0a4ba3..af750ed8c0f00 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>@@ -17,6 +17,7 @@
>>#include "regs/xe_irq_regs.h"
>>#include "xe_assert.h"
>>#include "xe_bo.h"
>>+#include "xe_configfs.h"
>>#include "xe_device.h"
>>#include "xe_execlist.h"
>>#include "xe_force_wake.h"
>>@@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt *gt)
>>	}
>>}
>>
>>+static void check_sw_fuses(struct xe_gt *gt)
>>+{
>>+	struct xe_device *xe = gt_to_xe(gt);
>>+	u64 sw_allowed = xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
>>+	enum xe_hw_engine_id id;
>>+
>>+	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
>>+		if (!(gt->info.engine_mask & BIT(id)))
>>+			continue;
>>+
>>+		if (!(sw_allowed & BIT(id))) {
>>+			gt->info.engine_mask &= ~BIT(id);
>>+			drm_info(&xe->drm, "%s fused off (in sw)\n",
>>+				 engine_infos[id].name);
>>+		}
>>+	}
>>+}
>>+
>>int xe_hw_engines_init_early(struct xe_gt *gt)
>>{
>>	int i;
>>@@ -818,6 +837,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>	read_copy_fuses(gt);
>>	read_compute_fuses(gt);
>>	check_gsc_availability(gt);
>>+	check_sw_fuses(gt);
>
>nit: I would call it apply_sw_fuses()

Matt Roper asked to avoid the term "fuse" for these things. So in v3 I
changed it everywhere to use "disabled". To follow the gsc call above
I'm keeping the verb "check" though: check_sw_disable().

Lucas De Marchi

>
>Thanks,
>Umesh
>
>>
>>	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>>
>>
>>
