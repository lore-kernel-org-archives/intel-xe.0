Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC29C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 11:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB47113A87;
	Wed, 24 Apr 2024 11:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j446BbSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA6D113A88
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713958842; x=1745494842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kioy1wBnLSwE788SNbpyCOj6B+mY9moQDrPa8SRSsbo=;
 b=j446BbSHcueKxPxii48DoUBGEqPGOSd3f/c2zVlgXJdLGLds5uJlHxn/
 gqyXPag/dsLFtVdR8R0lK341idJjpWujS5fsfgohaqdg+W+dd4zhawHXT
 gS24xApumUZDwvh8CLnRJEEBSk7KbkA54TbQz+4TZ054cWd8f2WUOYTXO
 H25S6hzv4Ys5qlEJlX44jlsOu1R5/mzlxGBAmi/9gjKC8wwNFJhguLIOD
 wzQSXoS7lh4gBMYDTCJPxXPCvcUB4d9rklso3XNAhUnSlWD65/nPpr4TV
 PrikWOkmf0ZIMCkk2bBceWmj0h7ANszKYwnxZNiWCs7dIXvPvmdC4Kra/ Q==;
X-CSE-ConnectionGUID: nokiznbwR/eNCLCGpAuViA==
X-CSE-MsgGUID: HWIS7wsLTbS4Ip9YWPmE9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9515067"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9515067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 04:40:38 -0700
X-CSE-ConnectionGUID: c6ImQBw9RY6rBsdMERGvkw==
X-CSE-MsgGUID: HNgYKMc9QxCmNokG7AWeww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24574393"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 04:40:38 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 04:40:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 04:40:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 04:40:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfHMLosy+kDJL4TUmXfOvS8vF4VvUS4fqeCkp38A2tbdkDY1lCf4xxmc2KrOUO9Abg2SQHHKEJWikUqqV4hZfnBhnkcASGz4cAFR2zXMBwgdYpj0EcaRldGG+DUHLeSS5AZuQCG5IXYyRKBCh1fbv1r13zWIQW8Q8Lz08JpeTKy+zcBcZ654xZ/e907Tv1XOBA+9HgKRdp9KPWo/MTotsyj5Cskfi2TLGNVnLpp1RMED7/N6I6TF+mwpWbjlJfDSSLvrfnEHnWD8YkzffxOYEZpp/fQ0KUUgbosmtJ5KtCre+9gyPAdxDCfNJ/R6g9t5XNRIYu593NmMjR7yBlL2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft6cuwH9ZALO6EH6/+J7Cx41xHS5n5+s1kzVg0ZbpQg=;
 b=lcjMXP9hCnME2gz4QP29Neyflck2FJ+LDQkBCr+FAboAHOf3JmI/ATpPTwEPB1fjyqJrlOiZz3xbl1de7IiKC8JtiFBj9ypw/uFT8XCcGQT7GadZvTfHxAdCJCW+L9MKbAUbEk9iGMLTJ+g5IT+V7+JTOhsuRPTanealrCOIXYaaN+F8YmMOphHnSHs+kmyUzgwnR9OIzfKVF/q7J1U/UguArkypypPx+ys48FbBfELLd5ZGg4nS/28haFF3DpWQD9X5mXhEqI8UH1LThd5To0QlIZivfcx90NDGghWG+g5WgQJpPzuOe0LspLw+Zm8wGeUluLZWZ6pNG/ImvxY47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6661.namprd11.prod.outlook.com (2603:10b6:806:255::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Wed, 24 Apr
 2024 11:40:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 11:40:35 +0000
Date: Wed, 24 Apr 2024 06:40:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH v7 3/4] drm/xe/hwmon: Update xe_hwmon_process_reg
Message-ID: <ohb6qlpknazjbaqf25sevflq5gtuxge4m4jle54szsnucwq6rd@l5qrumod4a5t>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
 <20240405130127.1392426-4-karthik.poosa@intel.com>
 <2rghstrxzerqq74k2papk3nwafptzsfzgli7ceyf4shstmejy6@n4efergznjwb>
 <ZhWOV9puU8o3-qZM@intel.com>
 <yow562hwodxuhhobwndyphp52espvswyecjzzcncpo5xvghjho@f6tly3xklwjo>
 <d33c69fb-c84a-4ef5-a28c-b0190b8fef65@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d33c69fb-c84a-4ef5-a28c-b0190b8fef65@intel.com>
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 16291b98-a305-46ef-2001-08dc64535b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jq+Ewn/dD0V87bKCM0XLubjO9vR0NuZZs94LSfngYo4QQLY0+5e6+AKH0gm5?=
 =?us-ascii?Q?3OJWBikoInUa3AoIeH3xywYXUzRB6CDtmjotz2olbJPk8RV6GMGTsw65nr/V?=
 =?us-ascii?Q?BwOz04ZEpn418TKVoar1HJ5Z8BviCJ1l0JFUD+Vc23VO2NFaBznsxD1D7I0h?=
 =?us-ascii?Q?wpmKpc1Vw1Ql27ER+UMsDt//OcfWb5lUhvKG4aBsSlUwVknvHy+wsyYvCxfb?=
 =?us-ascii?Q?5l0WhGlF7R1LeDh7S9BgWUAS+3wDO39h0Hn2mEKykQgfRBDanGjhjVb10iWy?=
 =?us-ascii?Q?R9jTQbtgjKY7Lhq0ysuw5MPZtrk6TzUh7fNYBNzk+ScgzPcCuOgk/R1ENqh2?=
 =?us-ascii?Q?1FNfmvdILm3VKt7E9KktiiJVxPX3sffgbYNxCqA2QyrVaaqqUXdyJDtUscvg?=
 =?us-ascii?Q?bZMqloE/eUJZSdsZUmrpqh3YO9fnoavXk+AIdh5fXseBd7yoyMiwULH+VAIt?=
 =?us-ascii?Q?4b9SGUcMCoj8CVNZzm51WTbAuPFpSOWJxSUXxeQCDT4yKmwKB7bc+2/W54SC?=
 =?us-ascii?Q?7xQrsLhQU7WzAkM9mvmaOr2XboH4qcHqWZ3uEb/78W9bZqQ9876WGlZu/DeQ?=
 =?us-ascii?Q?2+omXWk5Lu+ia+JDvTK40Y2++Zdfx+Bv4vOGNrHb8u4GMTuD+Mn4vUiJlO1F?=
 =?us-ascii?Q?UXc9ZPrrNqoauX7CeMbmC3gXJw7InCAq0AK1Mzc+gYVbWuBEaBD1ZmwD/TRN?=
 =?us-ascii?Q?wrMPLWvfBYxsw1GqIdOxNdsJydLHyLlgVFqXSCM4up1kyw8v+aQtM75Vtwxl?=
 =?us-ascii?Q?SWmQynafeL6pPs4uX/TtEyAueeXJ1ip650iH4VsjSzCiS86Av1cJ4jC2247t?=
 =?us-ascii?Q?yYBL/dwhRpLyXjjOinHnS/55SDCjY7tMwo64qW8Wroqtj/OpYSsFTp/Lbry/?=
 =?us-ascii?Q?jP7ha8SJuFJVwWLDEaUCJ61rNBL3+AkiX8eFcHbtYvhPK5e+eRXCEjSK2k6U?=
 =?us-ascii?Q?lAO9COmdUe7gthox2VYP7CcVN5LRNhphfqX4FAWGIMzR21845Jbk8YBsnTTC?=
 =?us-ascii?Q?v0L3RERL0fXEsqfVd49UQQBM9tBQk1TGv8enzeWwOnrHY93F9iqX4Y78ZlLA?=
 =?us-ascii?Q?DBtYECX/zbzqcFh7CLRa/ZS279qNBf3SvcBsZ2QHUbuxEr7TYCDusrGwZr19?=
 =?us-ascii?Q?X4xJFXp1JbijWAzo9nwpja+mA9OcRCWRh8U4jekHpto8Ud9JYHCneH1Em7bG?=
 =?us-ascii?Q?XidZHkcoudA+4Xy3eYKzyMdy4Xur71x3X4GfEeO7b+DaDQD6zRG5qLaM/mYx?=
 =?us-ascii?Q?i7SzaSN0fP4Db13A+Jv4BJ2c0dv8F2ruBu5+H0V0Ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GT9ijod8V+jmUXxWFA5ABBmPrws7MJHuwjInr9wbmgvdCV9PozgpsQetRiNr?=
 =?us-ascii?Q?Mtm/P4aQpy3MGbJCNF2PgNVPhgj7zotQYhHKvO5bhMQIjHGuiPf0TF0W75uF?=
 =?us-ascii?Q?8u0ZIWjc1mWNNjF/HOpeKkGfLBllAzVBm7O8cP6cNTL5TAtXON38EiWDFDNK?=
 =?us-ascii?Q?hyYHHBv4zKX+1ZPjvrxK2n3/roaegC/1rghnqFg/Rkx68jt/g0f71J4ipCFU?=
 =?us-ascii?Q?i4xHz2WJmzMAoeEwsL9vg3EBp+dzFra8+M7NO2f6vCquxayJdH9/uGU+f4kc?=
 =?us-ascii?Q?cXslrFHPW7V5GZbAcgx6cWx3Bl1+pF0VBBV3hdzSAQjFJVBd44SAN9fRpqs1?=
 =?us-ascii?Q?9vFusNY9hemcfoqD6P0ZB0eSizCDW5CN8b1L9ilqjWn8ifns9HlUvxNMYbFJ?=
 =?us-ascii?Q?fzYtoKKxDDLknplLn/0Ed+FtIPfV6P8c68w2nZYSXqXWGKBaU62q3NBNvr+S?=
 =?us-ascii?Q?GPZE5pY/cGFOvxC0oqk7DsCF9aVg/yBkid+Sv8XXO5o0IXLxVfoO+6YDdzud?=
 =?us-ascii?Q?sguSlKenJy8ZXy2Tcd+jRJ++tCJ1wy2u6bu0Su9c/VwwgzodykLgikajpe6N?=
 =?us-ascii?Q?xqUhfrb9qibOe+1HP3q/1aRZM8DjAJIFCMnip91jA61hHOUQr1B5cRjb4yPO?=
 =?us-ascii?Q?yTfMH5Qde6Q6X+HNspVktUrRlVXZLWa6HXzCDQ7KS0hH81UntaiFmcopngKw?=
 =?us-ascii?Q?BstYgMEfJYIVXLrlvwkh1ozhBVgdEhbfMlMpOqFTQ3POSz69d4BFZHBA/2m7?=
 =?us-ascii?Q?4s+UMQ9Z88HudHDqYHBH6hyOJUCWkPznvlbXAOr6To2/vndjU6l4ghGEZop2?=
 =?us-ascii?Q?ZuvuwwYZK79015AD3yelFZkGBgrQzCAHYej7whUIIIqGCQukVDWw7ChxCdT0?=
 =?us-ascii?Q?9aJS2rkm0lS/fOTMiq2hPBCO+5jlB26QKkyVRePq7FllNsWkVOcEvtKDMXs2?=
 =?us-ascii?Q?yQpk737crb0VcdBRRXpF+i+EFFhwTR8peQoNztLG47ovvOjYKEtzqThZluwd?=
 =?us-ascii?Q?R1YhT7XgjItzyWqGfw4lxVi6ART4USalg7+Oa54/FMvwxA+rON9qC9UelMDB?=
 =?us-ascii?Q?sp7NFv6Yrq706Eo5fporkZX3CqIFRhznRnUPV4Uehn1vAyMsERfjfp0VIkw4?=
 =?us-ascii?Q?4Xh9Bosl0FTu25OnZwUzkGs1Njxt74i/zaQ1TrkgbSKXdeHurEzeMrypfkyW?=
 =?us-ascii?Q?gRV1A0DFyC0GHVWat36g5VRQKunIaP6/cNwlFcORw+RTx0huIPjonHlh7ZtA?=
 =?us-ascii?Q?TNqQf+7uMqoMa4+EFQ3YPFeyvZ44PNleK085H52YenPuka0ORJf1bngEluPB?=
 =?us-ascii?Q?9Iac+z1GKe8Wy49fx3OySjOkPqUGGGqnOxhStURoZW4n6t7TPM/8yMxtNV0W?=
 =?us-ascii?Q?zy/PopJffcpqZqBmagXQPY4ZDyhCCL0WTpi4xFUTwtb3ya9+2q0PEsTNwyjp?=
 =?us-ascii?Q?YvHwWcxbYYYoQDJqOrum1ifWICicS8QSn0Lxc4VF7LBnfMlUqhJJqjROKmqE?=
 =?us-ascii?Q?KbfM211uzaHBWu9Nu1bmuYTGSk09LBD3RA/ryetNXrQVTKhu7d9xGK0Ut87P?=
 =?us-ascii?Q?VyzU8k6ptuGY8+AcFA7x3JqtEThCxPg5vL67xA8G4lyeNjZ7Ggd6TZObpV9F?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16291b98-a305-46ef-2001-08dc64535b4d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 11:40:35.8682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vod5lmxq+d/JIyNGmmbSjlschaboVkyVwKyG8C649qQCSV+B6l1/8YxHwIxGYccYlypQr7q6V1ghyis0TE59Onvaf0KF1FDjxvyX4vrNr+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6661
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

On Wed, Apr 24, 2024 at 01:46:45PM GMT, Nilawar, Badal wrote:
>>I's my personal feeling. I don't like the pattern xe_hwmon.c is using
>>since it's very easy to introduce buggy code. If someone wants to give a
>>r-b and merge this particular patch, fine. But I do think this pattern
>>should be changed.
>Idea of xe_hwmon_process_reg to abstract the register accesses. In 
>i915 we maintain register addresses inside the hwmon structure. During 
>reviews that idea was not much likeable. So we came up with 
>xe_hwmon_get_reg, xe_hwmon_process_reg.

xe_hwmon_get_reg() is totally fine. It is xe_hwmon_process_reg() that
abstracts what it shouldn't IMO. As shown in the snippet, the only thing
it does is to make it easier to introduce hidden bugs.

Lucas De Marchi
