Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84472E6689C
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 22:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F7110F0F3;
	Fri, 19 Dec 2025 22:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltE0sVf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1A410F0F3
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 22:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766183765; x=1797719765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lXxHpsVY/qWrPHzDqSfHtRTJRlpfB5qCR5wfi7sysnk=;
 b=ltE0sVf12s/quuyg0G/3LcaNCtd5fyTB06Cqv9sU9bpg33ZQTfwD5e5U
 UvGyZhJbZU0V87lwCONefTxWQyBs4JYc6hXe4DAOtItb9Ng1C2ctrtQVN
 9Nojwa5OOzGoRaupDGSaDEXnYMOPmLzDaTefgW4q5t/wmpQTlHuMAoIGr
 9XO6iAnPviDK9akLGjYjEf0GrRdAAW/5tRBzVAXFkjsmdKuJnIjZP0O4B
 FEjKJkN6Zc/HtUGOvAZso5AP9AFT268L3jCyRIWIg0hKgYkvRa4aDQTWn
 mJOA1YBG2fGN4/dIVUi0/NVTD02sMSOoo2C/7PDuD4KWLSTzyKiPLkGs/ A==;
X-CSE-ConnectionGUID: XFiBCXFcSOCKJmacw8jB7w==
X-CSE-MsgGUID: WeK46wcwTE2efZRjelwJSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68225834"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68225834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 14:36:05 -0800
X-CSE-ConnectionGUID: am8vtaLBSomdWRP/lM7dJA==
X-CSE-MsgGUID: V849bFoRQ2qg+DVBWMdn8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199027343"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 14:36:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 14:36:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 14:36:03 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 14:36:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gzh3jlEF1TF+XPwBsb3F9yIxGMIzDaKzxnwOl2SKr8ECQ7Ok0o+czJOPVY68NRdTaMcwRq8RnUIBBoE3GoSKefU5i/tXkD7HE7pv/SiJAlkKharx6zyc0odiAlIpGszgWPOMQ6AL7gF5nOgTooZTATepj7+UKoRVwMCbksDWD8JbS54Fd9LW3C9rZ0XikHk9sRbfLWdhCNVAw8VGoDPch30lMJFfRbbVfq8uQIfDMJ0nyGNb939dxkUS9YEp3g0y0Xs0OSbJ2R4179BOoweX/pyR7iRIY4fcPbFbUghLaHib5RWqZ2MFQNA3zQODLaKa//LQ+cuswN+tfAUwu5rhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd2TmtaDclxV2e9H8LshKDM1Eo3TV2u3T1I34yZHIYc=;
 b=MLgv11TkXsQ7IWMuFHc81twaPF7/FcRmzoCSyJuWnlrKwYjTI0rIhsdjLEUFna44QhW0vl4Bupd/q5iZ5g2oncDXFiCBRyDzvNT/uDPFmId29Ux8V9NXg0hTejCAOJfL4Srkf/ePHFEDEDhqWAdzx32OYr3aCqV8EusuJtX/7x5Owx4qmLSEL/Ap7ztdTzVQcxX+wC/kKMJl8lklGc8wZ04fQkQb5KCbYuQRnVUxx3cJTOD/TPX7E3qGstrJSXWqwVgvKElMIiAozWxJC5CDFeeqaqHoKQceRLvkDP+Eq0DmWC8V7y5PQwyId+CNwpNLg1GB8wUQIDO2iSaOXNmRlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 22:35:57 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 22:35:57 +0000
Date: Fri, 19 Dec 2025 14:35:53 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 15/17] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <aUXTSR3snBJBTrO5@nvishwa1-desk>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-34-niranjana.vishwanathapura@intel.com>
 <aUW-SeH7NnRoN0AM@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aUW-SeH7NnRoN0AM@intel.com>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c18281-f7f0-4870-398f-08de3f4ef9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0ITnDu4I0Dl+feLJqVdir+hfP514vTxIq56KwK0+qFN9bzgmyMGoa+HlgxcJ?=
 =?us-ascii?Q?WMujUesDvt1IFHs0UvcAc/nUUPiH+HOOwfdiXpGbwsugOuK9BS754rS4Br6O?=
 =?us-ascii?Q?ODnT9KcnnCBxstOvY1urElF95cSr0CR1YsAODXPQlCrQDQ3Q3h1Lc/Kl9ibX?=
 =?us-ascii?Q?kNrubiHJTtYtgNPEn88D2ArpWzmNbaqNhnX3PdKCWn3oyBIYzVkFaHtEaxr4?=
 =?us-ascii?Q?v4YyTS23V5xx2hhqB7c5G1b8kiNrSBvmFdusTHUkZJSNvPY/Khw0F8tfyJGn?=
 =?us-ascii?Q?Ys9jMe42AMjsVPsvihm2aapz2AIP1n9QumI3/0S4Rk5uj9i3icCeIEb1Ca2g?=
 =?us-ascii?Q?uePhcZ7/w7i4Ly1btBnFiJ6Ln0rUr5tdS3zhEe4D6WdaPEtozdWaNcZdOkaJ?=
 =?us-ascii?Q?so7Hmo24Qal41TFXHa7sE+HM0ARP4m+NMiBXym/Adk70ZMjeEI7T8tpjB2jH?=
 =?us-ascii?Q?buWvhhOOJhHVNbNBDiKKoQlUhndaP5nVVgeei7KuiJ/t0tc/1IajboP1hlqe?=
 =?us-ascii?Q?1y+d4q9hg8uF3I5LaXm/D12gG6DspK3TiwNdl88VZIvyq5oQUZh2+r/PLTS9?=
 =?us-ascii?Q?rgecyJFuCkMFiHe2Cb5F3ea84J7TB6Rry5XiEfyzhOG+Z9eXIK/GsKXsSgAF?=
 =?us-ascii?Q?qHG5L8EuwQ205eaU+4YbTqwKSpf4xfrfuRIolb6d5AnWHrf1dJySGp6agpns?=
 =?us-ascii?Q?LH3AchTvZLrZJlfYfu3AxOzM9gbpG1uvASK8TWFdqlPQ9F6ql3piQgby9nYD?=
 =?us-ascii?Q?CMPajg4uX95qSdHImdoOiCfXmkubuinynctQyp1OvQad/43bS8+T+oTQUlS9?=
 =?us-ascii?Q?rZWSiMves5j8SRo7jXAiODMkfPuSJW697SvaQpziUyCGbGbded0mOLdbzGwJ?=
 =?us-ascii?Q?8aa5IrSb5bHpdUQGtu9MUBnAG7ajiIBkw42G9kc/lz3eLNA5wrgFP8CBBgSG?=
 =?us-ascii?Q?eQxkq9Y9egEZ/cBc2Y/vmVlZxas3Jt6RvEbBm00RGsoXjqSNHL6F0JHNltYp?=
 =?us-ascii?Q?fP8tG/rNKFLd/DT6PK05BHX6qBKcHVoIP9o69jO/Zb+g/V4iH3L72dQzq0E0?=
 =?us-ascii?Q?fKFKGYIoCtzNcPW/jSXFdRBkKBYaGN63UT1/1VtFZSQUccSxnKiMwprn23bE?=
 =?us-ascii?Q?j3kdf00sWPm2UdfzyopQSlDrfKx4ASM9fpR3e5ell2WnJlvRDMUihbGRcZpy?=
 =?us-ascii?Q?Kv6WmKhS5CnsfkiYqY3SR9vCF3vOF+rBOAYBQPiIs3Owx+q08S1mFyI6AfQb?=
 =?us-ascii?Q?8qUIiGpunbigueTlqyq0j7jGHRFs3ci2GTDIkwyyzlOT7pxSVl1FOVCgcVJG?=
 =?us-ascii?Q?rzUiD9StdEjVYA05tMGzb0ZfBOJXVJD8Wn8EdM4usJadlRDZ17JIfFtjIPWO?=
 =?us-ascii?Q?g7dA78X/l3U3gC7SG5j2Vkp947Zynl10bLB+VqJYYa8H6ull6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wUUFCvRcq6CBkjiB3/vXIdOFf2ZxJdfcce5AqCCqr58EXTaUeLRIXsPkjpqU?=
 =?us-ascii?Q?bOmCb2V5+YNtNPmcDwzvqWULbPhIg6ehUzMei74cCuurIWsT+p1fItp5eSij?=
 =?us-ascii?Q?R27mKPMQ3lD9PBtfBR0dlPviyNe0/HGhlZX9036S3FVh5RNJK0zpWhg16/Do?=
 =?us-ascii?Q?qdwL14SYCrnDOqiVKooqHxSnDoN7Re51eN7i7mbyNononQ77MsWsNLcM34HU?=
 =?us-ascii?Q?JdM5lvz/hk1LDUqeRlt8FNCc1agmHFoGJJSph/gao116cH7U6UiUZdLbVK1c?=
 =?us-ascii?Q?seSZLblVX/oQxxOHtwyv7TkJlXMRMR6PRbPkWz68EKjC86tlgeR2+Pv7LmaN?=
 =?us-ascii?Q?oG75f9Z7YFS6AuDRr7z7WtDkDk1W2LZbgdecOZEOUFzVFl8xhY9Nihj0PB4K?=
 =?us-ascii?Q?TxqPaYFjEn6b2VsCdGPgsIJNnxcgxF43jCpCiovQvrGw7u7Q1cLqhhNDbD1x?=
 =?us-ascii?Q?3joQyWcQzkiALCxKjUyfoZtKWPW0oFgX+ro4shzSjw+Ew2SzzV1O4I5N7N0/?=
 =?us-ascii?Q?vfxxIZR9EhGAf6qAT5n+0h5R9psXzPi73M8PzvLCHObo9hOyU0S5FfYySyIu?=
 =?us-ascii?Q?nITAM8UnZToAn3kuPTWAy1HIxXPC8zb0CRCGbgi1ADBfrPz8terxExE9aXlN?=
 =?us-ascii?Q?bnW3wzNCp37HxxU2NaDG/s58r/BLkA7Dz1LejNZESZf/AwJg2ri0x3CVIAPb?=
 =?us-ascii?Q?+fhD+ciNblEYQUFZj1trP5dps2K7nim3V4r/LqgBxwnaU9m2ZCTN9//9VjmT?=
 =?us-ascii?Q?nLG3e9aYbXJ+Yh4Vtw6OeFj7W2K7dMwE6RO7Nwkl4xuZvRX0OZv2gbdbnJrZ?=
 =?us-ascii?Q?vBhOxEvtUhSBurHMYs26s9hub+Cqhdxd0c+L8+12mj2b1T36IAIufNLPtBRH?=
 =?us-ascii?Q?555aVmffIWeEKq+nxG2PPA9E/M835mAS66DsmJDCVA3+kgCn1FZEymeOzWin?=
 =?us-ascii?Q?EIbG0E53IwmI2LEhbunUtSfPbOkn8WJLnbnKApRldS4MG3QeMWOpErb0Ayel?=
 =?us-ascii?Q?JlqR5ZpsjGvhAUujkv1HXs6C83AOOAGjwGY5+SN/5jrr0LtxoNVb+5rHFapz?=
 =?us-ascii?Q?kewUXwNb5L9gV3iv91Ma6LzUk2r4Pj0BmEb9F4B4s0LLi9GI/TJYINYE73EB?=
 =?us-ascii?Q?dNeTcdESFsaGKYD4q8G2D6QP5Ucm0iTlVSE9m99ic/hdPhsbzCrZYKvzv/4S?=
 =?us-ascii?Q?qKygYn46Hc8sgshTXCuRY0ZAmOOvXb5c0z7s0WyQG+/rEnizQlKCdwYcEY4I?=
 =?us-ascii?Q?WxkmrOU0HErbiZWwVzFY2S6UxGI212miaNAYq5DbGC+KBTxK3cJtGLk7qkyi?=
 =?us-ascii?Q?HlLl9NMCIuXhq/0rDKerTTb3dKtvekjJzu9Iuns+LFiYPgHvgBv7b8+oSyRa?=
 =?us-ascii?Q?kBDlDE23vd3l7TqT+AA/etiGIpwSbRC3CjcgBnvwnFPfJO7hwCW2By0mi93T?=
 =?us-ascii?Q?9fHI6tXXPDCwwGrOrhuDe0b78F6OBZJ8U19AZrJuK241cFWU5iNO5V+CzNNz?=
 =?us-ascii?Q?oD8mwWAo5jcopsSGgJJi195qBH+Q+hsIQaWT8BywV8fowEy7NVxtyR2YDhrP?=
 =?us-ascii?Q?+Xk5KaZfFCgKdQsuE2DDEfLUQCCWF+pSnhF4Nx/tS7YsY73q1UfCeESgK435?=
 =?us-ascii?Q?N+IJfMKQ1I8Vw+TOkqwWV11qgTb4ghsJA6y+Ob3V+xZ7XfC4gcYpLX7efeaX?=
 =?us-ascii?Q?9eeZfs4Tlyy8nYkBnpqsacyUFQ68kWIR4aJw8rtPLc3YnHFRSo2ER46eHy3U?=
 =?us-ascii?Q?N4u2gPwMMlmCSF0bj9lHRG9SHTtfrM5O0DXv7SmukYpQJwc64Byu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c18281-f7f0-4870-398f-08de3f4ef9fe
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 22:35:56.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLseBnHO6GT/MWhdZzUzAJ8HSvWYH8q2LzN0rwQZ1OyIvCgp+LZJBgK1wg8STeLpWHXSjzdracbvGugqwQdEINmIdLr6uATP1eFlOwJBATmJwkBdQ/0P9JXoE2ZuihL6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
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

On Fri, Dec 19, 2025 at 04:06:17PM -0500, Rodrigo Vivi wrote:
>On Wed, Dec 10, 2025 at 05:03:03PM -0800, Niranjana Vishwanathapura wrote:
>> Add support to keep the group active after the primary queue is
>> destroyed. Instead of killing the primary queue during exec_queue
>> destroy ioctl, kill it when all the secondary queues of the group
>> are killed.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c           |  7 ++-
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
>>  include/uapi/drm/xe_drm.h                |  4 ++
>
>Hi Niranjana,
>
>Where is the UMD ack for this? Who is using this uAPI?

https://lists.freedesktop.org/archives/intel-xe/2025-November/105779.html

Niranjana

>
>Thanks,
>Rodrigo.
>
>>  5 files changed, 69 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 7a498c8db7b1..24efb6a3e0ea 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -177,7 +177,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>>  		if (q->vm && q->hwe->hw_engine_group)
>>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>> -		xe_exec_queue_kill(q);
>> +
>> +		if (xe_exec_queue_is_multi_queue_primary(q))
>> +			xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +		else
>> +			xe_exec_queue_kill(q);
>> +
>>  		xe_exec_queue_put(q);
>>  	}
>>  	xa_for_each(&xef->vm.xa, idx, vm)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index d337b7bc2b80..3f4840d135a0 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -418,6 +418,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>>  }
>>  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>>
>> +static void xe_exec_queue_group_kill(struct kref *ref)
>> +{
>> +	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
>> +							 kill_refcount);
>> +	xe_exec_queue_kill(group->primary);
>> +}
>> +
>> +static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
>> +{
>> +	kref_get(&group->kill_refcount);
>> +}
>> +
>> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
>> +{
>> +	if (!group)
>> +		return;
>> +
>> +	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
>> +}
>> +
>>  void xe_exec_queue_destroy(struct kref *ref)
>>  {
>>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>> @@ -650,6 +670,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>>  	group->primary = q;
>>  	group->cgp_bo = bo;
>>  	INIT_LIST_HEAD(&group->list);
>> +	kref_init(&group->kill_refcount);
>>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>>  	mutex_init(&group->list_lock);
>>  	q->multi_queue.group = group;
>> @@ -725,6 +746,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>>
>>  	q->multi_queue.pos = pos;
>>
>> +	if (group->primary->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_get(group);
>> +		q->multi_queue.keep_active = true;
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> @@ -738,6 +764,11 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
>>  	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>>  	xe_assert(xe, lrc);
>>  	xe_lrc_put(lrc);
>> +
>> +	if (q->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_put(group);
>> +		q->multi_queue.keep_active = false;
>> +	}
>>  }
>>
>>  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>> @@ -759,12 +790,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>>  		return -EINVAL;
>>
>>  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>> -		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>> +		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
>> +					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
>> +			return -EINVAL;
>> +
>> +		/*
>> +		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
>> +		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
>> +		 */
>> +		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
>> +				 xe_vm_in_preempt_fence_mode(q->vm)))
>>  			return -EINVAL;
>>
>>  		q->multi_queue.valid = true;
>>  		q->multi_queue.is_primary = true;
>>  		q->multi_queue.pos = 0;
>> +		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
>> +			q->multi_queue.keep_active = true;
>> +
>>  		return 0;
>>  	}
>>
>> @@ -1312,6 +1355,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>>
>>  	q->ops->kill(q);
>>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>> +
>> +	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +		q->multi_queue.keep_active = false;
>> +	}
>>  }
>>
>>  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> @@ -1338,7 +1386,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>  	if (q->vm && q->hwe->hw_engine_group)
>>  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>>
>> -	xe_exec_queue_kill(q);
>> +	if (xe_exec_queue_is_multi_queue_primary(q))
>> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +	else
>> +		xe_exec_queue_kill(q);
>>
>>  	trace_xe_exec_queue_close(q);
>>  	xe_exec_queue_put(q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index ffcc1feb879e..10abed98fb6b 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -113,6 +113,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>>  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>>  }
>>
>> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
>> +
>>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>
>>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 5fc516b0bb77..67ea5eebf70b 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -62,6 +62,8 @@ struct xe_exec_queue_group {
>>  	struct list_head list;
>>  	/** @list_lock: Secondary queue list lock */
>>  	struct mutex list_lock;
>> +	/** @kill_refcount: ref count to kill primary queue */
>> +	struct kref kill_refcount;
>>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>>  	bool sync_pending;
>>  	/** @banned: Group banned */
>> @@ -161,6 +163,8 @@ struct xe_exec_queue {
>>  		u8 valid:1;
>>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>>  		u8 is_primary:1;
>> +		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
>> +		u8 keep_active:1;
>>  	} multi_queue;
>>
>>  	/** @sched_props: scheduling properties */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 705081bf0d81..bd6154e3b728 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1280,6 +1280,9 @@ struct drm_xe_vm_bind {
>>   *    then a new multi-queue group is created with this queue as the primary queue
>>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
>> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
>> + *    set, then the multi-queue group is kept active after the primary queue is
>> + *    destroyed.
>>   *    All the other non-relevant bits of extension's 'value' field while adding the
>>   *    primary or the secondary queues of the group must be set to 0.
>>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>> @@ -1328,6 +1331,7 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>> +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>> --
>> 2.43.0
>>
