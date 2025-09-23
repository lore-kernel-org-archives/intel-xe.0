Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C58CAC5AC
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 15:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583A289496;
	Tue, 23 Sep 2025 15:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+B/4Bcy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE4489496
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758639996; x=1790175996;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZRr07vOCc60N1wadpXWVu9dNMhp9ugoJD9fa4xM6++w=;
 b=l+B/4BcyC717gwyjUYD14vIOut/ac3HgGaZo6QfPTldedR/F6Q0HdRDv
 NgCpNKirnsK5dKF1DuSTfv7LZtPL/IsxumFnxmfyKGvQe6N2dXJ20JJI7
 HwtdHowxqR5XFcBdADtAn56H7pZundRB3Xl70cVUjAFvGPbTJrU8ZZm9C
 tAu2GvGtcbHz+vVsIRXr//zueIRVpJE+wNyYz9CzbrPx+KIE4heMcGA7p
 oDZLvgjY1BcaLBBefgf1MMCGJ4Z2CcmajUIzqE/LaRijW8+g2qywSVNPe
 gJsL1Ek/Aq2SGacZ36xCUVt2jv8s6e0fadDjVUB2O20ynnbdCDF9fRD24 w==;
X-CSE-ConnectionGUID: d2pYE1AyTgyCToZJgUsYqw==
X-CSE-MsgGUID: LJpQtH3DTlumwX/vWOPRAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64723711"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64723711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 08:06:35 -0700
X-CSE-ConnectionGUID: e2p/Qy3YSN2UxYOIE82CbQ==
X-CSE-MsgGUID: T2Z+oGaJQ0mt2IRqU4vM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="176369431"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 08:06:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 08:06:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 08:06:34 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 08:06:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mhdtxf7HxvDtdOy0WksMMDqeVRA9OlxLNK9k4ahzdbH8kkpbk7+pGLORBOH4CPXOslR1KQg2SGQR5iY9kRUWaMqC5fMpalCkV2mH+d2oUj7c8t2HMlGUNWMHBxEjoWLHm9aCJLYqZ6nndjBFk5iWLIWM2/m6XIt4Z2PnSnN0mHyG8KR4HeJZAjeN5cWVN0yvhM9Ai3snXurwUGp8xwbxjEe4/Whm5zPfNuzk+P3SBJyINJoTyB6yk9XGxlwVvfRF+M8iUkJ8LbkKRFKFGUwS5j3U7BGxvzwlxE9uDq9FV9dqTxtzm4uuMWnUWD5A9X0OE4Pc18P7sbZFbS0QMsmlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHwA1S/O79GtQ0acGDkECQTou+/Wbd9cX9Gd11mBFX4=;
 b=jEbzjWDZ5YQFx8zhwKngd47x88hURLl3E8LwQAw34MpHimnrqnzsmrdyepD0nBcP9FiuNHAsmyKstwjeUgF2EDCv4zzWeT2kiwsc8D2zR84ddtGKNu+yO89bZ5ccpdzjnrLbZ8m3K97HeO2v5NtZvi88FpRA1vL/QdD2qhZWN+pEePeO/Uta4zeQGoWZS94B+4EVqb/w6WqbS7ujXvK4NNxmF1ycIWW4GK82XiaYWV7RxsN4kJNnq2290tPddKu3reLOAAE1PEfm07lOXjhOBFuJIYf1CJBSCvdP8g8gf0jHjVAV1Ss+jftBBta0PW6CfkjK5Zpd6lvkkEE6WtFgqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7787.namprd11.prod.outlook.com (2603:10b6:8:de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 15:06:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 15:06:29 +0000
Date: Tue, 23 Sep 2025 10:06:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Fix engine class parsing
Message-ID: <z5ajmlwhcqfifll7xenysqh22h6ys5xwv3ec6gswl47zeawr2v@ln4s7ssok74g>
References: <20250922221209.110737-2-lucas.demarchi@intel.com>
 <aNKFkyQvpvy1c3_X@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aNKFkyQvpvy1c3_X@black.igk.intel.com>
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: b7361aa7-5151-40fa-01a5-08ddfab2c5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g2Axs5tgzLEXNG3U7a2t0JWolMuT5dH2GBQa2EHcdva+1jwzbreYrswournV?=
 =?us-ascii?Q?tKmqHAxmJGEu/RkWVHtRw751z/TBq/FB382grA2nqTn5f3PxhFo+Q7Tp7QaT?=
 =?us-ascii?Q?qtooIbsGxnbMQiZcXjeODjTC/gmIgH0/0Nxv8dz4L1a5SPvthRKcorKlOwjZ?=
 =?us-ascii?Q?dcl2bBMTaR9Y+1ka9tYq179A0XStdpJuSI/xDnNG+j51AyWNWyY9ubg0kxFN?=
 =?us-ascii?Q?fpTeyeMeePA1PJkI0rvE5phUb1KMPNEFlcBDKowGHBNAFvISDPi6DhNP9kPU?=
 =?us-ascii?Q?Muf2sHLYLhzaYC0+JEisofKo2L9nd5HQs9vERQ1pTNeDTNQTXwawWTSywM+p?=
 =?us-ascii?Q?eH2NeLN7t2FF4RYKAgAn09fSreehpIeNbQj4QniKIeRX5t3T02Vu5jpMFM67?=
 =?us-ascii?Q?0eCUrG7hKGlYs5a4wzKq+9QfWCg/xM9MUr3uN2Wly9YYHk21XWDbaO8x7qIf?=
 =?us-ascii?Q?9Idt5kvDxBwmrJQLvb9Lui3IZW5eVa+K0ekTEl5W6Tk3SKoXuPIwMSl6iwLe?=
 =?us-ascii?Q?T0QaHePIsh5v4xrBqDOB1GcelflqCvf3DnL8wxfdTX/qcge4AzGHzS/lZ8mf?=
 =?us-ascii?Q?IYGZc+HWhCR86kOP4XQ1WoPDwvmY+yLY+xLQLLk4V4WoWxKJNIOtaoHysywj?=
 =?us-ascii?Q?VyD1bj2YP2QpI8V+3fM/qSCH+XDdjQUgO26tqgRwr+pu9pwivBvCLQ/1Rx3m?=
 =?us-ascii?Q?1+cZ3j8Ts2a7artyJUqgoqxS/jFlfp3+OdgzRlgNMTaOow8XC7QWuM8emR7W?=
 =?us-ascii?Q?u1R/x9vrAh2eWGFmby8GSwAmOzocOX9u5Vh1yuZlAXMKuVNc1Gpc56lytjg/?=
 =?us-ascii?Q?kFwkcr3swV/8aMuk7JXPHUzwS6YY7DqyxTe/A3IU0rtA00Gv/VBJbpwmVikq?=
 =?us-ascii?Q?zNsq2yW4BhSGZMxeXb5EtrSD6tG6fSfNPmeWhvZ4pi7qFEFjuaOXEWz5vzvo?=
 =?us-ascii?Q?FyIxezVsYeeeUgIkRKDbfgvQuDu6HxGQBM7Lq3/XnhWUOaGjPbvI867YDRXx?=
 =?us-ascii?Q?B6+sS3mQrSvt+8xllOplQxUNf2Vq0CN7gtNSZmSporE/miA+9wb3esJI68qC?=
 =?us-ascii?Q?bvq5Y3bOLfaT+jaYx+8/aS0MUzvg0d03YWi37YJXpp4iPxGT+6HNalh+dRBi?=
 =?us-ascii?Q?O1cwboeUzXK3NBfR6IEkcWoDScolKLBKesS2LnHqQnpKB6uk5T2S/98fW7VY?=
 =?us-ascii?Q?VmL2G+1DiM+qRbjJcVOjH0KIrf1EBsCo5GXp49udpgdUzTIx2bPLpg2fLNyN?=
 =?us-ascii?Q?eyd+2EHbYnRY6EDSUjN3RTaZVsCKLU84nyyn4Vdl7cxGVluNh5K1QxnsDTFo?=
 =?us-ascii?Q?x6veyuEh1Bn5ckWKCj63pulZATg7S83rXqCp/fyDmTW6kkHI3BBkxWuowk+V?=
 =?us-ascii?Q?eDcwcY/mIKNp4tl796yyG/3wTP65ryXSiKcsAHFiHd+1aIRkMQ6WRxt8Nuep?=
 =?us-ascii?Q?vFLut3z+E74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?21lBdXFG+m3PKnMd7RmYPYMh0QIkk3Cu92JrcrwKgtBg+1NCw/oQsKiDTfaK?=
 =?us-ascii?Q?TMS8bH+/8HCHkmqLKkmQRtVfq5I5+lrZeERSk+mcxeBs+6ITq55u86M49+/M?=
 =?us-ascii?Q?de1uU6oOeB0c2hcr1OUD0dditpztvgnfbxtmnkendXdAeAEpkWQiLbkiU5N+?=
 =?us-ascii?Q?rf8ycPYHppbEiHOCOh5F5j5F19SQkpCo9t8TYJvN5p9JO/QSWqFHXaFDiSh3?=
 =?us-ascii?Q?vINnKszs+lrGJeinN+8WotIETkpvV93WKpIJksI32iQZKdhNR61AihjfUnV+?=
 =?us-ascii?Q?5pm210kMRprSgeoM4m92Sok2XG0Qg1J+aDqAAsHqyc5YnHd3PSzS+rlZul6X?=
 =?us-ascii?Q?m1+tEG5Nc8NMNThUu3DyE9BS8Zqzx2tj4U6Q0/51zj2gVEKqUFSQaxeZD4QY?=
 =?us-ascii?Q?BJvAvi1Ja8zR9LC6bkk7BJCrhYkeqm663Kfcjk+nLIg9IgYZ96M/9Am4ZF79?=
 =?us-ascii?Q?ht4csT11GQj9BVmZpAtR9nHLcg72bzEAFD/cjWwGstzumabOAoCLUi+AqUi8?=
 =?us-ascii?Q?QUlPVNxOYmsUKzx9VOt3kslQbehrJYqp7LakBI+72CXASATSzDeR3iBPPxaY?=
 =?us-ascii?Q?uqyFmEXm6GDo22dhLbqbtGhotbzbzSYbhnMkWJd4ZpAJyxMTQUU+USOmjqeS?=
 =?us-ascii?Q?WSzuCOZzilB0e8mUxQwWCsZq4oSKAEWuCtdk/zbgSJKxsMuBnFqLQp1Q5mQN?=
 =?us-ascii?Q?ekrUjChwONKqWoQI6+e1J1N8NkaaQyxg6+ksAzS+k+8ushLIJ2Xa12bLIWMu?=
 =?us-ascii?Q?VSZy4PhFEndj4zmP/kjEUWX60+RCr6mci5YaWuToOpmCYl6bLBfpYCNlkElI?=
 =?us-ascii?Q?sSsmFhcS77OM/yeBh/2xwm0CazCpXrcp1b9POfjCrR2x57N8chEaNbRCgwdp?=
 =?us-ascii?Q?JBdJIULIcBRuh0kW70xlhnVROqJuJQyJa4NuA3rHLbnccI3A8wL6jVWGVxGs?=
 =?us-ascii?Q?tfL41Ggbdn/gJFFGwwD0UQ5YU/ErgQvToquRgvJhFw1ICr6f4E92lEdWTPYo?=
 =?us-ascii?Q?j6lER6YDLkpvPWxl0fLKmi1JOg5HGTZbP59d92v3v0RdSSTLMU5dZG/iHuko?=
 =?us-ascii?Q?iss7hRYs62B6bSGkha8+VetGHysE9bWiukpcL3B0uEiv+qzJT9XYEG1y2g7p?=
 =?us-ascii?Q?ChCl+SE0jXfIBQNXbRPcsHVNIPfVvzl3fmRtzm7BL1iWgpawiazKkcytvRJe?=
 =?us-ascii?Q?DITvzQguKDBHNzdpLgVns7BC7Yb3FGSDtMDRYuR+y7kDtxxi/ryUR/y/CvMY?=
 =?us-ascii?Q?LPbLrFQVthd/Tm2yDX3nw+XTJK+6J+r/GonTXl7lodm6eSdx0ZloyZV1uftR?=
 =?us-ascii?Q?cxqlPuKqLMNlMUiwkelDtJHAbZ2JFNfQV6PLxIvRFNxM4+pzG9u0KZjwHZ0K?=
 =?us-ascii?Q?o5LESd9j3I3xS3zbBTJxSgcSkLALo9Y0WpYQhnPT3pEpz9y9MgR8oWHWLr1F?=
 =?us-ascii?Q?IF4Xc3Gk7S62xrYwa3QZO+jNFFZ5Q7b1/bo7/Vh+wWiYrI/F7GzLy5iSqLhD?=
 =?us-ascii?Q?p7HIOoYUhL6oHjNfk/gdpMDIAld6ZgpHuXnS+yioEgvoB0MiQR8JKt/8EaPv?=
 =?us-ascii?Q?9ETRyBqFK0Fg1K/TMygqgAzZFD+5spz8tt53kF9mGjtUN9AQ5omezWZSl0h6?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7361aa7-5151-40fa-01a5-08ddfab2c5ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 15:06:28.9777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCviSh5JiM6s5Wa/cASWsuf0mRaS4ZDV1nYdnFXDuL3r9gmA1ZyNH6f1t57HbO2NTZU0XALXN5QQKN9KT4LoRF1Ge89XWdr5iFyCtaa0h+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7787
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

On Tue, Sep 23, 2025 at 01:33:39PM +0200, Raag Jadav wrote:
>On Mon, Sep 22, 2025 at 03:12:10PM -0700, Lucas De Marchi wrote:
>> If mask is NULL, only the engine class should be accepted, so the
>> pattern string should be completely parsed. This should fix passing e.g.
>> rcs0 to ctx_restore_post_bb when it's only expecting the engine class.
>
>Should we add to the doc so we don't mix up expectations between different
>attributes?

afaics it's already there... it's just the parsing that had a bug for an
invalid input.

>
>Or do we care about the rest of pattern of mask is NULL? Perhaps it'll
>allow us to have common expectations between attributes.

I'm not sure I follow... if mask is NULL, it should only accept the
engine class. If mask is not null, then it should continue parsing the
instance (or glob).

attributes like ctx_restore_post_bb and ctx_restore_mid_bb, use only the
class, as mentioned in the doc:

  *      # echo 'rcs cmd 11000001 4F100 DEADBEEF' \                      
  *              > /sys/kernel/config/xe/0000:03:00.0/ctx_restore_post_bb

attribute like engines_allowed use  class + instance/glob, as mentioned
in the doc:

  *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engines_allowed

Lucas De Marchi

>
>Raag
>
>> Reported-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Closes: https://lore.kernel.org/r/20250922155544.67712-1-jonathan.cavitt@intel.com
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 8a9b950e7a6d1..beade13efbae7 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -324,8 +324,8 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
>>  			continue;
>>
>>  		pattern += strlen(engine_info[i].cls);
>> -		if (!mask && !*pattern)
>> -			return &engine_info[i];
>> +		if (!mask)
>> +			return *pattern ? NULL : &engine_info[i];
>>
>>  		if (!strcmp(pattern, "*")) {
>>  			*mask = engine_info[i].mask;
>> --
>> 2.50.1
>>
