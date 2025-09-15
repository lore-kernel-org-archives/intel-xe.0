Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD44CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 15:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF1110E4E4;
	Mon, 15 Sep 2025 15:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKkevqQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD0710E4E4
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757949159; x=1789485159;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xQ0H1iCprCPAVNDHIRn9pv64B4EV4g61UaX5KniZ0Qc=;
 b=oKkevqQyadx0BCwJMQ5DqL0TU2UD4wGNB2GNiqkmEemVEf+fEJtD8sfe
 DEaxsYG+qCu3vd7xOiaBLDl4dDSbk4yRJ4jnTTX8zl35jXbNF/IQ9b9Ms
 eE8Vc6cpVRVcXeubbonAAmgsC94JWhnvW8y6ZKQM7+HwR/Z6axmcTJUNr
 3bZjfXxLRR9K9aA7NRHcob7Ene01UwWGfSZ3adZSD14zluWdO6xT68SH8
 Po9+lwEn69cwrDh1mu8EHrT/PWwj+4fiT3hadxI1rd2V/hfNy0cfmGkn1
 TwQLNyIpAOcLDksyDl1xaKrS+AGIraz0or1OEZzHulgITNs/vWD67bdAq Q==;
X-CSE-ConnectionGUID: lmPBbfIsQruFZyStT46X6g==
X-CSE-MsgGUID: 2FHV+h+iQ8a+jjEWXXNvBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60156661"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60156661"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:12:38 -0700
X-CSE-ConnectionGUID: wLvgTNI2RpubIzhzgLHVGg==
X-CSE-MsgGUID: tD9etMVTTvmUPVJ09L7NyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="178655198"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:12:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:12:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:12:34 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:12:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDfKzUgvPbbijCyX7uB/NvMbULU5J6MS9W7uztAvVaPOVpDqWLQtAvEVBuWg2f86sZO9G5ZtN5YP1cI8byVWUgwZLJnS0CQtg5J/pBK5oss6BEJd1gexKzBpIsZFkfLP1g59KnLCtUkfkKfrVUj8sNl5gZYBpEaMfz/+IUg2ZRpuXONuXMLYo/yA1xV3EO2D54VfdNQWtb7HoKXKMNcDfSuD0b79aqFNQui9H1lnbvM0qqlCe2/UOdvOR1QZuJ+dmEsbpQycMpdYkxuB3k2KqwvuUmYvSEuys0ZRECpkKubpXQ6BpmemgNY+fbBeQV/fgSmB2nkqYnPADPE8720eQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be9DyzzZHa2jTEN7wbtMjJLwmwG5wHh1ZhgjkV6iI+k=;
 b=beGIjrAaMy2+cWzCHEgZ7BCRimOaoj5ajQQJgby9EnAHy0hFlfJMwazQpLUuzNfGA4Qu/5p3cAAm32HDb+S/9+YBXA1K5xg7xyHluzII7/ePfiX43uM2kqXeK6k/jcOoDKmKG3zjiwV/OFz4zSUkfX0DLcK5+DfnJf/rFK6AchnTQqI6KFKnE4WEfAPwFaZ6Pz0VJkK6kar627tkQOM8JkOPcfB8UJXs/FeIwfmGUwCeHNVmToIm1kSrXd35kYSSyKS6Dn9HicTowvCDi9EOYnGh39v+uBjZt4A2X3qJSh3tI2+GJxQhIW40rZYnKvheKRORZf71k5CZDBb3Ok3N/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 15:12:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:12:28 +0000
Date: Mon, 15 Sep 2025 10:12:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/sysfs: Simplify and fix sysfs registration
Message-ID: <wrdmty6mixvzuononvsfwqcg3ftvsraallbaibauffhfymizu5@ejcdqwurfqd5>
References: <20250915140614.2076-1-michal.wajdeczko@intel.com>
 <20250915140614.2076-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250915140614.2076-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a34723-2eb2-4716-beb7-08ddf46a48fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qKUJHJdhrAalo/h9Gi547ij3HpfC7O2jkGnf72+3t6Ewd7x9MzjRw495SV/f?=
 =?us-ascii?Q?k86cCPmbRnU70mHIoaPRr1UdCn9rOzxHp44PhXjoAImSLF+f+s9V5F0YZczN?=
 =?us-ascii?Q?ksAg9Yj9o7SVeE0YdLx+ee/y9d0TnrbMvnmgXNm3426YJMYil2euUbwxYP+y?=
 =?us-ascii?Q?41lN5z70u9lJ8IpR0JExYusTvaCHN9q3kBDQhjqLneYSrvY1xYp0Tr9YVfmS?=
 =?us-ascii?Q?xGk6hJojRI9a2mEBymbtcpU5OJ0eJkF6fRYOZpReWGHOllYE3cM3LKfGZKv7?=
 =?us-ascii?Q?bhrtgGh1Z0+XHrxfdT6Bbos8YBEtH9UkNtMBmBA30SSAFQOI3T6QsqQHBER9?=
 =?us-ascii?Q?m9O13CA7ffw0/PLMggFySoYOeHgvZ8Q37fDkAbmbL4PAjjiK4Ai0h80uAMnd?=
 =?us-ascii?Q?pNcisSUgp2gSjbj2F+r3968Ofo3uFPX+384loDubwJAfaTK43X9LXq/4m6Jz?=
 =?us-ascii?Q?4qDJtl0kVIQrmoBHhpxauq0h/xETHohJ//6DEYAbFSQTk4ZPQPqpti+vpFnN?=
 =?us-ascii?Q?eSgnvTzVd3SG2CRGFqTdrT0+RD4wQeWdvnOeilJdM2Q5qi8B3idfVwkcBE0e?=
 =?us-ascii?Q?Yd7FH639RTi74Dy28GRzTLiTnLbSpQI87HqQYvdTRsgAGglX1BhlkEw0qTwi?=
 =?us-ascii?Q?bXbaW4DLy/hhwIqELE9P81DwjLLRlNcJWaEjKWBRiAkV1OQMfgBYh3RIZ4ZR?=
 =?us-ascii?Q?cBsPbvwZpbiZDUE+Giv71OkDgTa3jwl2N3uFRB/yHnexwq+Wv9I9N9aGWrDb?=
 =?us-ascii?Q?tZCw7MELqHLkeOtImxybnMemYNhbGuI+4d+G7rpyOV9W17E6dEmADUhYikEb?=
 =?us-ascii?Q?jH4tVEgUVfnGdpAJ6DNDe7u+ERdF81OkyE0f6AL4ZIyttV/nV0E21/D8CFgt?=
 =?us-ascii?Q?VmLdVAFagj4hIsUBnzhSdCm36OmGCkcbmxG8aLjXtZt40fHDVIwZkVV1Igsb?=
 =?us-ascii?Q?TOfUQdFcO9mCg67eX2WYyir3m+2pxTVsLKAXuPBrJ0u9gxPGgEkhl2oyhhxQ?=
 =?us-ascii?Q?/OcxlseDgv2clRwpDz9WmPRgJeSpWK4y1sGNg6XXqZiEFS2dLqw3B0Q0ImiH?=
 =?us-ascii?Q?C4RBvkCFEkACHLCyrs5Z5CgQHEx/MOtizVi7wWNtEU/Q8ZGZDui2mgv89Wkv?=
 =?us-ascii?Q?eThiJdcni/Ubf0C8/7/ALtgqSR6u/2eMcz39TgdMiti61p+UjOrelojp3mcH?=
 =?us-ascii?Q?vA5mE01kvfyRhDC/j49XnHBtWaYxVTnvTXaejfMldDUPJQqpFT59DDjyOsEP?=
 =?us-ascii?Q?DOW9JySG4kOFdK3lOfWgMwE44q1wbHDdEBuBQB1lXWSuFtzKVLLIX5cbfmpG?=
 =?us-ascii?Q?PWEFLufFoEcYPMWm5XfnsgalcpNimo7yYnX5VU1pW+tAXgDln37g+7tntTNJ?=
 =?us-ascii?Q?pV4QSCFXOqISZxT0tcjQy4leO0PW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZAhDU9RuZy9Zk6v64iL+wPjzZV76Qr7kmW9yJqlP6pSEakS0mT6uyETVTAcS?=
 =?us-ascii?Q?jHYv/cCgzi4ELeKvnC7m7F8jw0j5emdPDliyHiazqxBpwer6jXDnjiVq34cC?=
 =?us-ascii?Q?te2QNFZVRuq2jqePx3A6j8Qb7K+edpkZM3cauJ6RiHGk4B+T9/z0PNsP1ydq?=
 =?us-ascii?Q?lNjOfb7fp9P8eG+t9cB0rCQoOUpbeWR3raGSQ3ATw7FBNDY6okvhkX8QCpHF?=
 =?us-ascii?Q?yQnx3yuEhW5BkKeaVxOMwZQjmEoL8q6mGO5JNzlhpUAbKTgEyNgnl8iXbFdn?=
 =?us-ascii?Q?oCnsWYD/WaXDH7sSW4Tm8MvuAzjdSFEQKhy1LSoNFkPdTcncrjqQNXPTlrU5?=
 =?us-ascii?Q?r3N9cVXqQJMbpmBUw3a7FQSE4lON9J1J3ndrJjpyBVYtNlInP7dIk3YcRP4Z?=
 =?us-ascii?Q?6KgpoHloRqTIRodIAq+/kO119Ko3yT20WBw78vu7NFt4DC6jNZ//CHlKqPIk?=
 =?us-ascii?Q?jINcXQNE7LxNdE8WJox5T1Lqgm+3QbTUfKOPuryTAgV/hpVL36eU0WtN3CJL?=
 =?us-ascii?Q?Am61MvrvlQDzNh/2Ez4rsuoadulPndl4HqpgH2Tu25bxBPVEIGEZ5oM/KwgB?=
 =?us-ascii?Q?9GFPWBxZQ3xo8PqPqDlmoaPiREOYlmbQroRLKMGbRj7eRjZ6fTEi35uB+IyT?=
 =?us-ascii?Q?fAivvPMUJE5XhH+wf5EXuKk1wzpw/kaKOuuOfHb06NwZzMMY9tZQNp6l0sBQ?=
 =?us-ascii?Q?jH0vDccH+Jt8iSkI5DPZP3QSqS0jGWMa9pV1HlE0IvTaHOSROx5HLrdsStDq?=
 =?us-ascii?Q?hwtbQnLAzS+MDxnI+nKnA7+fN283GuzIE4bUyq52Owvu+CAWkow58mnQ0nvK?=
 =?us-ascii?Q?MjCy4SdBQzSiUlNrSk3UT1KSrgOwkYV/fpicurxvxxoHCcQ1+VHI8bgDRHDB?=
 =?us-ascii?Q?yh9UOV4Drl2bbZPdU94Mb+Wbedbs5RxExQ6a3CSpT4nyMRf82eaG6EeS4TY0?=
 =?us-ascii?Q?4pQNbsVXwIyp6fvDiWQaKZzNCB8e70V74Qnl4//MGXCsZEzItjkstsI1jYJF?=
 =?us-ascii?Q?4WaOc2a0tsiiP2BcOpgCx5DnIUveeqVpKY1Qr5czRT+vVo2KcrX20bW6p16h?=
 =?us-ascii?Q?3LNRFfXs1dlki3uONzKlZ3/RF1xVoioJnLVNQYQjUuIMSkf0Xn3izHKtxUSo?=
 =?us-ascii?Q?ee0aCVUOoMeEdjXhVL19BjLyoydKaKoKVsycefikC7gTmkom0fnPQpNoMQZT?=
 =?us-ascii?Q?hgUFJcMU4Y+Kbluvm6R2zPeW1ferRHT+a4+dAEBLesu1qtryg5id1Uz/F2T3?=
 =?us-ascii?Q?hknr9Mr//DKXHQHFkV0M1gcqbCh2KNx1trMxcLA4c8VsCG/WweyD9EemPnB9?=
 =?us-ascii?Q?s6NirClM/hJyozBWW28V8S1YaC9DOdKg4dwNE2fg2phWH1DQl43dSHaxuysc?=
 =?us-ascii?Q?FFEdTn3A+dlBw5LosO9SLBnZ2+7vekLdKwGWn612HmvaHTUpqCxUwJ/N6xnG?=
 =?us-ascii?Q?6Zp1x1lRj/KW6krTg+YbWtPRV152ZTR0hET4u1w68KbbEPGRaWv0Ww1ydHm3?=
 =?us-ascii?Q?E1RA0EsROck3cSa37cB8g1MA9itP/U5etL7nWHV/cTPLuZEu1LwmcTnpnTFN?=
 =?us-ascii?Q?mTVqJla3P5XfQrgwoIRa7aysvV2ODjPu6lUFbNi/isi83aUTxH9oa964LKIc?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a34723-2eb2-4716-beb7-08ddf46a48fa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:12:28.6196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mARcBIumyYrffLg+u+7VhjxYB3JLWD41uvzvXwvJkYjExBiE3AzGQKuuQOf2nSim+QhXfyDDFHWWhCcktDQ18M3E8kgHL92FaaHe/I0W9Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
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

On Mon, Sep 15, 2025 at 04:06:13PM +0200, Michal Wajdeczko wrote:
>Instead of manually maintaining each sysfs attribute define and use
>attribute groups and register them using device managed function.
>Then use is_visible() to filter-out unsupported attributes.
>
>This will result not only in less code and smaller footprint:
>
>  Function                                     old     new   delta
>  late_bind_attr_is_visible                      -     183    +183
>  ____versions                               80832   80896     +64
>  vram_attr_group                                -      48     +48
>  late_bind_attr_group                           -      48     +48
>  auto_link_downgrade_attr_group                 -      48     +48
>  late_bind_attrs                                -      24     +24
>  vram_attrs                                     -      16     +16
>  __pfx_late_bind_attr_is_visible                -      16     +16
>  xe_device_sysfs_init.cold                     20      21      +1
>  __pfx_xe_device_sysfs_fini                    16       -     -16
>  xe_device_sysfs_fini.cold                     21       -     -21
>  xe_device_sysfs_fini                         271       -    -271
>  xe_device_sysfs_init                         421     135    -286
>  Total: Before=2848898, After=2848752, chg -0.01%
>
>but will also fix some bad error handling that we had here.
>
>Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
>Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")

we should probably land the fix separately though:
https://lore.kernel.org/intel-xe/7p7wqbghc2ebupbzljjaegakun3azczuby2haiqmmneavnpl44@joqtzfismsgv/

and suggestion to rather use attribute group, similarly to what you're
doing here:
https://lore.kernel.org/intel-xe/3tkvzv7krbeuofuew44zm3ibenlntqkfclueq3soazkagwkezg@wtdhq4yvengu/


>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Raag Jadav <raag.jadav@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_sysfs.c | 96 +++++++++++-----------------
> 1 file changed, 39 insertions(+), 57 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>index 6ee422594b56..5b0b98ac9b17 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>@@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>
> static DEVICE_ATTR_RW(vram_d3cold_threshold);
>
>+static struct attribute *vram_attrs[] = {
>+	&dev_attr_vram_d3cold_threshold.attr,
>+	NULL
>+};
>+
>+static const struct attribute_group vram_attr_group = {
>+	.attrs = vram_attrs,

since we are already checking by the attribute inside the is_visible
hook, couldn't we just add 1 group for "device attributes" and
share a single function?

>+};
>+
> static ssize_t
> lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
> {
>@@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
> }
> static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
>
>-static int late_bind_create_files(struct device *dev)
>+static struct attribute *late_bind_attrs[] = {
>+	&dev_attr_lb_fan_control_version.attr,
>+	&dev_attr_lb_voltage_regulator_version.attr,

As above, I think we can just consider them "device attributes".

Lucas De Marchi

>+	NULL
>+};
>+
>+static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>+					 struct attribute *attr, int n)
> {
>+	struct device *dev = kobj_to_dev(kobj);
> 	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> 	struct xe_tile *root = xe_device_get_root_tile(xe);
> 	u32 cap = 0;
>@@ -160,51 +177,25 @@ static int late_bind_create_files(struct device *dev)
>
> 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> 			    &cap, NULL);
>-	if (ret) {
>-		if (ret == -ENXIO) {
>-			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
>-			ret = 0;
>-		}
>-		goto out;
>-	}
>-
>-	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
>-		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>-		if (ret)
>-			goto out;
>-	}
>-
>-	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>-		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>-out:
> 	xe_pm_runtime_put(xe);
>-
>-	return ret;
>-}
>-
>-static void late_bind_remove_files(struct device *dev)
>-{
>-	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>-	struct xe_tile *root = xe_device_get_root_tile(xe);
>-	u32 cap = 0;
>-	int ret;
>-
>-	xe_pm_runtime_get(xe);
>-
>-	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>-			    &cap, NULL);
> 	if (ret)
>-		goto out;
>+		return 0;
>
>-	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
>-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>+	if (attr == &dev_attr_lb_fan_control_version.attr &&
>+	    REG_FIELD_GET(V1_FAN_SUPPORTED, cap))
>+		return attr->mode;
>+	if (attr == &dev_attr_lb_voltage_regulator_version.attr &&
>+	    REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>+		return attr->mode;
>
>-	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>-		sysfs_remove_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>-out:
>-	xe_pm_runtime_put(xe);
>+	return 0;
> }
>
>+static const struct attribute_group late_bind_attr_group = {
>+	.attrs = late_bind_attrs,
>+	.is_visible = late_bind_attr_is_visible,
>+};
>+
> /**
>  * DOC: PCIe Gen5 Limitations
>  *
>@@ -278,24 +269,15 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
> }
> static DEVICE_ATTR_ADMIN_RO(auto_link_downgrade_status);
>
>-static const struct attribute *auto_link_downgrade_attrs[] = {
>+static struct attribute *auto_link_downgrade_attrs[] = {
> 	&dev_attr_auto_link_downgrade_capable.attr,
> 	&dev_attr_auto_link_downgrade_status.attr,
> 	NULL
> };
>
>-static void xe_device_sysfs_fini(void *arg)
>-{
>-	struct xe_device *xe = arg;
>-
>-	if (xe->d3cold.capable)
>-		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>-
>-	if (xe->info.platform == XE_BATTLEMAGE) {
>-		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
>-		late_bind_remove_files(xe->drm.dev);
>-	}
>-}
>+static const struct attribute_group auto_link_downgrade_attr_group = {
>+	.attrs = auto_link_downgrade_attrs,
>+};
>
> int xe_device_sysfs_init(struct xe_device *xe)
> {
>@@ -303,20 +285,20 @@ int xe_device_sysfs_init(struct xe_device *xe)
> 	int ret;
>
> 	if (xe->d3cold.capable) {
>-		ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>+		ret = devm_device_add_group(dev, &vram_attr_group);
> 		if (ret)
> 			return ret;
> 	}
>
> 	if (xe->info.platform == XE_BATTLEMAGE) {
>-		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
>+		ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
> 		if (ret)
> 			return ret;
>
>-		ret = late_bind_create_files(dev);
>+		ret = devm_device_add_group(dev, &late_bind_attr_group);
> 		if (ret)
> 			return ret;
> 	}
>
>-	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>+	return 0;
> }
>-- 
>2.47.1
>
