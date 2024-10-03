Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5544ECF34B0
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 16:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70E10E1BA;
	Thu,  3 Oct 2024 16:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjoXNAea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1719710E1BA
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727973148; x=1759509148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EZ2RHpJCfSq0p8EH5Cl9RouU2jxS3vIJ1aSA3JAk+38=;
 b=LjoXNAeaphQt9WFgb3XuwcgP69Z48Lvquaz9FlK79ucvjEBvnhvIPKJw
 NDc22+KfR7/kDgfYGHma2rcvl91Pqdo9vCEq3s9RdZfkrvgO21FeNAglT
 5XWsNIz1dHnJfTFW/i6GgvFBDz20NI6P8GAPSX8jBXc4LfJFA+upVJlQf
 vfC8Q6VpCgaxLsbhU5qAyw5WdeZ+QFvXT/hcqbP3QR1tBwxskvpHmDgIO
 dnmmbpuNox9Guy8SsR1hPcSYz+CgBFwtSOtXi3M0L9QECCl17GvLAZnIr
 e/40prJzJYRiDzLycR0KyI0jJC9h1txWhndKggROnV3SEqo0zSHrcx5HV A==;
X-CSE-ConnectionGUID: haQ5o3GYTGqRZesyw+5TfA==
X-CSE-MsgGUID: Y1hzjd2JQPGoH3eQ+1dRnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37741296"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="37741296"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 09:32:27 -0700
X-CSE-ConnectionGUID: pT4xQroVTGaLSFBH8BrxHQ==
X-CSE-MsgGUID: djYk+cebRbyyBeKuV6JZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="79371633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 09:32:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 09:32:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 09:32:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 09:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHv7u9h6D4p3UYZlh0T4/W+ohWkbP87N4c0uGMK9JX6eBOMMwVq68tz388GRwMBePbqeZ+Mes2l/PTGHFx5/gBlDYU9LBCCUwGEnpmr9jeEdU6yRK1oioU2Bg/2sHUz77a/8ne0J5NYBXkuaGCIRw0bFgIiL0c9n5feFSQPr8VrlNmCPere24tD0+CNb8ie+5eB4cy+RutLyiPDF8YsSjKoXeL8KI1bU08b1Pa/bWJhv0MZ94hKslclsK53LLnr+ED8yxBTqHpviInn5vzHuPWu86ZzprEnl6TQF67mQIzUAg6YkwXhHJMnvqwksEm3djFVvjR4mX3cVwdA3h5Dsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JggU7VJ9X7LJkbI7Hj9bbPu/YlHOlURWxS39Q7/ei3Y=;
 b=vMWsigsrd+ylWKqpK+nrG7n7C7eHuHNxaS+O/yjStf2BYoE7INX8IJFmwewWztKAPSkaMs/yBtbBNzWgj1lTvx2Nts6GxmljclvKlG+pFP4nQxvV9FiDds7pv1UFHpUjr86zL1mzoMQ4d7jw0MbMqB3Rs76/qTJgObmcaJ0pTIcSqMN2VkDrM5IlsycbJTCfcPztGHzEbjqWCttdWStKMhXWwVymnBhFA0+BhNRW0O4RmocXWESuCwhA3Zk61ao/m+7UC+Kr93ECpiQGc3LieXyrXSJX/RUIzBP8FbN2T+Sm7onnxDl0dyQZCizA07fyFBWEOLn0vWycZvXRAVr13A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 16:32:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 16:32:25 +0000
Date: Thu, 3 Oct 2024 16:32:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/18] drm/xe/eudebug: Introduce discovery for resources
Message-ID: <Zv7HEWW2jNYId7he@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-4-mika.kuoppala@linux.intel.com>
 <Zv3oMj4rkhZHw5JZ@DUT025-TGLU.fm.intel.com>
 <87wmiphchz.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wmiphchz.fsf@mkuoppal-desk>
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d219ee9-1cd7-46cf-2497-08dce3c8f69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2JYwQxz0Z3T8bJi0DtySj9vgKz6G6H+06YFHdwFkbegDozOwgO2M7IfRO3F3?=
 =?us-ascii?Q?rNghb7Dp10Oj8s936gIbQPSC1+dXc/2UPOFUestAltqXxvTHo+luL7xFIvd1?=
 =?us-ascii?Q?wq1Bcow/psUz6ZtZJA7t724PllEfSc6Cbq5a/gr6ez0aJrRENKCwZEmUWOzf?=
 =?us-ascii?Q?l0HU2TCv2oAma55fWU2mMQ+u8aoR99SnOQgWAk/TPG8Wbah4otuipkbNzplz?=
 =?us-ascii?Q?eKU0YtAWAdmyndX/QaU19fW7sMPst3h1ceJCqjG+Gn3a5noIY7viwpHjW7hl?=
 =?us-ascii?Q?uxsccr2feY+uu87H7sAaAxuhKIglO3qQXOJcx15gXbbkplem2hD5GZ8aUc05?=
 =?us-ascii?Q?9VsJXmSc0DBZVNgvRsQ56LFuNf0yVfRFV7hKqZdGBr6OcEtS06FIN09pbq1k?=
 =?us-ascii?Q?s01+txJvPUVc6Em3kSfmjJZ2WtU55NhGEPSqyzHWRs5ldQtZ3hB4WKzaaUhM?=
 =?us-ascii?Q?gfGf/SlB6w5XoSxDU+x3BiROo3hR9kFW6gdvHiYT3nu4w7WS9bq0HNNrgDPo?=
 =?us-ascii?Q?Lxk3xSNA3siTl9MyNa6t9LPC+38n8p+BwX0afhgGFfk++gXPG19FIBryKeqN?=
 =?us-ascii?Q?Ol6BHp6SdI89TVWqkM4GPKo9ehiqYw4xLuQuO5VaTm2LlkQVEnzOsUhjqw6C?=
 =?us-ascii?Q?9rhqug/Pv+DM3ivsZ2TXBle3AROCESqgfbfg2V1NyVBGnQ62zw27Swdbglxj?=
 =?us-ascii?Q?GsKIX6XHTSc/PrGUf8MLlL1Cptmtr5iwugHXT8iw6ZEG96q+dbaDyfLQvHrh?=
 =?us-ascii?Q?ZO9Ed33pjDupkhm4AddUudImMKA20dHTrxJpJp2q8qW6bwCho0nARRd29ZbS?=
 =?us-ascii?Q?l/7zM8oqR7XUg78l7hSLNJk5n6OhcLQIECEUhj7LZo3mDh5aU5AQ2PU5uG8a?=
 =?us-ascii?Q?0NU3u1ACvdwJcF26iNEXGa3/bIybrZsmRYFkgwx+6wjloRW6bSaTEXHQ93e8?=
 =?us-ascii?Q?IK8K6PgtHVcmo82B0XrR5C/wh7hF7zJUn0xOLyaDuaeZ7NXWUV89+HkfsNUP?=
 =?us-ascii?Q?VryeVzk6W8cyrSjc6fXZ/oCRx2zQlWdf6pcnwMdmY4zSSrryEQjngXOLeIOb?=
 =?us-ascii?Q?M4EYeW82qOe+S1qhuNvEQhwSgoUYsVG47Z1ELDxDm2lktnV/W6j/pq+SC4WA?=
 =?us-ascii?Q?4TODlvbfQUjoYA8Ml/OTAl6XxHPqeiOkiIS4PYVjNgDLsRJV82OS3GusGmsX?=
 =?us-ascii?Q?Pv7aqwQRn8nLFZCuAW4e6TBDkvOEldM8u+ro4c+8rA9NQqkYwnP1GRqPF6Q4?=
 =?us-ascii?Q?uTECHucxvs0lf4wAuCids2WVqx2nileY2lgGBVwtYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?esIoi6AUtIdcOKXh4TcIGsfbzP1f4JJenxvKNBYio+ZziCLg96nnudDDLu/C?=
 =?us-ascii?Q?s3koCcG20m3CwJcWW7DCnOmF5qHBwoWNfaUJVTiBvNsonifOtW0kyQD1GCKM?=
 =?us-ascii?Q?R/qH6aEKgjhHDK8y47owgwDGK+lRU20rA/0HznlciBN4qE9Sgx18ABlcynQq?=
 =?us-ascii?Q?+VL4Uhf5BR3yq5UP4JEPaQoZOd0bGvVW8RdE/Bzo/AqJX34wv0KuZ2kAFBj2?=
 =?us-ascii?Q?Yu5j8vy1NH++ve8zmrLP8kOe5CA+gj6GjggdlZ2BdidSSmnSzHEEn9AsXmpf?=
 =?us-ascii?Q?lZdpZRKKcFjDsixWiemRKVGgQQf9Iodewq4pIh65YnEHQYS/PUToqhmdgaIQ?=
 =?us-ascii?Q?41CKA5DRA/DlKCrtIVdvkQcIdznN84qnyZicytEkV/oxaKT0FKzyDrkU+H+M?=
 =?us-ascii?Q?rLzG2rOL4CRxd2iOh5LO1iPE4Iq/7ixRkSKgVlkCppzXlLIZsC12xgYmun42?=
 =?us-ascii?Q?CR805W23RKmwWiBBa4mBa2oTWDUxKln1d5eP6/I8qmIAxUx9q3JCU8yPtSod?=
 =?us-ascii?Q?VhuBRWlyAgjfbXEiRQ+9qrp+rI2O+AllvkYbTuviOVPGg5muiEs0MZN9PDij?=
 =?us-ascii?Q?f2XJBPLqDmMyEhIamf0vsVRkaYWdG7KDsdwmMR3WKEaTUfT6jgKhxdY/2X76?=
 =?us-ascii?Q?8IBRcVYqD9hRPerxj7qzMmO5ZClOTwVgi+//ZwF5dZ2beVzhP6TJsgq4HBMr?=
 =?us-ascii?Q?tbl+xPoo7z2R7ihJsWZAzu0Cfr0/S/LDgl8sykKz950rIUvvIcV4H2c2KJxf?=
 =?us-ascii?Q?a0de/3REqLgeFccdi+40dP2D1WKv+k+ad+Zku5yor/tP3EsCHYeMJ6G/jqAL?=
 =?us-ascii?Q?Ob2YC2oV173zYAb+YtU3mzgVfH7K/XkUNEqP83S9g9ruJUOwuTaLCXlJayq7?=
 =?us-ascii?Q?r03B4Og+pCwA9ktmJTXKyjWvi7gVhytKsYkAgAfzAbW1+R5eMSRkXGBZM3tq?=
 =?us-ascii?Q?FCgj1CEE8T6nO1gufCZhdZZIM8O/YImAtnvqkNAYYK57c+9NukD8RpT4/4bd?=
 =?us-ascii?Q?fTupvHpnefcW5FELT1Wt7SuNWcS8eAWUBTqioNmUku2svGBPblIjCxYNS6hJ?=
 =?us-ascii?Q?rHOG+7Er/1TTGcrhpyeHQTGW7DHZFOadb/j3PObHVz2kVYgg4WPcRUdRw0wF?=
 =?us-ascii?Q?eo/S9OCWbVcRgLcAIpDZexZW7bPjHD+w3aHXhiE+Zl1jTH5hy5F6IhlST823?=
 =?us-ascii?Q?ZAWgM4K/GlM4oVUv9KztSbr7klLgbDyDcm2nSPEibnHxjhlxug0ZrJpn546/?=
 =?us-ascii?Q?5fss+PmxZkuY7TWZuFQ5RMZFQvtFYke/3K3QPxxjpFPusePmSFjbtf22Wf/0?=
 =?us-ascii?Q?zZv3FVkplOZOK+0Acw1GYvUuBk5lCUF2STY7fdtOpkT3zcnpniVDScjWZUNZ?=
 =?us-ascii?Q?UFRaVY9Kq5Hsg9kx9JjBSOSMgDks3VhAP0hazGWq4/kyIhUupVb0dFBxUIrs?=
 =?us-ascii?Q?us86cg503emYEZ4SCqeleauheEifB/wHCcZc/cuf7PLvL4Y6VMLe8lZ58u/U?=
 =?us-ascii?Q?gAJyIIKrv3LOlwGMoKznWtCZdUZ9uYupT6ioUG/Ltutc3BIzECOIQFZxegc5?=
 =?us-ascii?Q?sYnNvHc6WD+uAZjj9/ZkxUUdFd468OzDDqIKzxZz8pZ13Krf4FW3nNortUhU?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d219ee9-1cd7-46cf-2497-08dce3c8f69e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 16:32:25.1397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aER4EtlOHg5wdCxqfpBCtLW7t3PrSZ0VfZgVUX7kVZbTSdKbfeRnVskiFupwRr89RTgW46llWPhc/ch8PR8FfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

On Thu, Oct 03, 2024 at 10:27:52AM +0300, Mika Kuoppala wrote:
> Matthew Brost <matthew.brost@intel.com> writes:
> 
> > On Tue, Oct 01, 2024 at 05:42:51PM +0300, Mika Kuoppala wrote:
> >> Debugger connection can happen way after the client has
> >> created and destroyed arbitrary number of resources.
> >> 
> >> We need to playback all currently existing resources for the
> >> debugger. The client is held until this so called discovery
> >> process, executed by workqueue, is complete.
> >> 
> >> This patch is based on discovery work by Maciej Patelczyk
> >> for i915 driver.
> >> 
> >> v2: - use rw_semaphore to block drm_ioctls during discovery (Matthew)
> >>     - only lock according to ioctl at play (Dominik)
> >> 
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> >> Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> >> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> >> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_device.c        |  10 +-
> >>  drivers/gpu/drm/xe/xe_device.h        |  34 +++++++
> >>  drivers/gpu/drm/xe/xe_device_types.h  |   6 ++
> >>  drivers/gpu/drm/xe/xe_eudebug.c       | 135 +++++++++++++++++++++++++-
> >>  drivers/gpu/drm/xe/xe_eudebug_types.h |   7 ++
> >>  5 files changed, 185 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> >> index 5615e2c23bf6..ec5eedbbf320 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.c
> >> +++ b/drivers/gpu/drm/xe/xe_device.c
> >> @@ -215,8 +215,11 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >>  		return -ECANCELED;
> >>  
> >>  	ret = xe_pm_runtime_get_ioctl(xe);
> >> -	if (ret >= 0)
> >> +	if (ret >= 0) {
> >> +		xe_eudebug_discovery_lock(xe, cmd);
> >>  		ret = drm_ioctl(file, cmd, arg);
> >> +		xe_eudebug_discovery_unlock(xe, cmd);
> >> +	}
> >>  	xe_pm_runtime_put(xe);
> >>  
> >>  	return ret;
> >> @@ -233,8 +236,11 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
> >>  		return -ECANCELED;
> >>  
> >>  	ret = xe_pm_runtime_get_ioctl(xe);
> >> -	if (ret >= 0)
> >> +	if (ret >= 0) {
> >> +		xe_eudebug_discovery_lock(xe, cmd);
> >>  		ret = drm_compat_ioctl(file, cmd, arg);
> >> +		xe_eudebug_discovery_unlock(xe, cmd);
> >> +	}
> >>  	xe_pm_runtime_put(xe);
> >>  
> >>  	return ret;
> >> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> >> index 4c3f0ebe78a9..b2fc85b1d26e 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.h
> >> +++ b/drivers/gpu/drm/xe/xe_device.h
> >> @@ -7,6 +7,7 @@
> >>  #define _XE_DEVICE_H_
> >>  
> >>  #include <drm/drm_util.h>
> >> +#include <drm/drm_ioctl.h>
> >>  
> >>  #include "xe_device_types.h"
> >>  #include "xe_gt_types.h"
> >> @@ -191,4 +192,37 @@ void xe_device_declare_wedged(struct xe_device *xe);
> >>  struct xe_file *xe_file_get(struct xe_file *xef);
> >>  void xe_file_put(struct xe_file *xef);
> >>  
> >> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> >> +static inline int xe_eudebug_needs_lock(const unsigned int cmd)
> >> +{
> >> +	const unsigned int xe_cmd = DRM_IOCTL_NR(cmd) - DRM_COMMAND_BASE;
> >> +
> >> +	switch (xe_cmd) {
> >> +	case DRM_XE_VM_CREATE:
> >> +	case DRM_XE_VM_DESTROY:
> >> +	case DRM_XE_VM_BIND:
> >> +	case DRM_XE_EXEC_QUEUE_CREATE:
> >> +	case DRM_XE_EXEC_QUEUE_DESTROY:
> >> +	case DRM_XE_EUDEBUG_CONNECT:
> >> +		return 1;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static inline void xe_eudebug_discovery_lock(struct xe_device *xe, unsigned int cmd)
> >> +{
> >> +	if (xe_eudebug_needs_lock(cmd))
> >> +		down_read(&xe->eudebug.discovery_lock);
> >> +}
> >> +static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd)
> >> +{
> >> +	if (xe_eudebug_needs_lock(cmd))
> >> +		up_read(&xe->eudebug.discovery_lock);
> >> +}
> >> +#else
> >> +static inline void xe_eudebug_discovery_lock(struct xe_device *xe, unsigned int cmd) { }
> >> +static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd) { }
> >> +#endif /* CONFIG_DRM_XE_EUDEBUG */
> >> +
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >> index cb4b52888a4b..54ceeee7cf75 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -542,6 +542,12 @@ struct xe_device {
> >>  
> >>  		/** @available: is the debugging functionality available */
> >>  		bool available;
> >> +
> >> +		/** @ordered_wq: used to discovery */
> >> +		struct workqueue_struct *ordered_wq;
> >> +
> >> +		/** discovery_lock: used for discovery to block xe ioctls */
> >> +		struct rw_semaphore discovery_lock;
> >>  	} eudebug;
> >>  #endif
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> >> index ea0cfd7697aa..c294e2c6152b 100644
> >> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> >> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> >> @@ -299,6 +299,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
> >>  	}
> >>  	spin_unlock(&d->connection.lock);
> >>  
> >> +	flush_work(&d->discovery_work);
> >> +
> >>  	if (!detached)
> >>  		return false;
> >>  
> >> @@ -409,7 +411,7 @@ static struct task_struct *find_task_get(struct xe_file *xef)
> >>  }
> >>  
> >>  static struct xe_eudebug *
> >> -xe_eudebug_get(struct xe_file *xef)
> >> +_xe_eudebug_get(struct xe_file *xef)
> >>  {
> >>  	struct task_struct *task;
> >>  	struct xe_eudebug *d;
> >> @@ -433,6 +435,24 @@ xe_eudebug_get(struct xe_file *xef)
> >>  	return d;
> >>  }
> >>  
> >> +static struct xe_eudebug *
> >> +xe_eudebug_get(struct xe_file *xef)
> >> +{
> >> +	struct xe_eudebug *d;
> >> +
> >> +	lockdep_assert_held(&xef->xe->eudebug.discovery_lock);
> >> +
> >> +	d = _xe_eudebug_get(xef);
> >> +	if (d) {
> >> +		if (!completion_done(&d->discovery)) {
> >> +			xe_eudebug_put(d);
> >> +			d = NULL;
> >> +		}
> >> +	}
> >> +
> >> +	return d;
> >> +}
> >> +
> >>  static int xe_eudebug_queue_event(struct xe_eudebug *d,
> >>  				  struct xe_eudebug_event *event)
> >>  {
> >> @@ -810,6 +830,10 @@ static long xe_eudebug_ioctl(struct file *file,
> >>  	struct xe_eudebug * const d = file->private_data;
> >>  	long ret;
> >>  
> >> +	if (cmd != DRM_XE_EUDEBUG_IOCTL_READ_EVENT &&
> >> +	    !completion_done(&d->discovery))
> >> +		return -EBUSY;
> >> +
> >>  	switch (cmd) {
> >>  	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
> >>  		ret = xe_eudebug_read_event(d, arg,
> >> @@ -832,6 +856,8 @@ static const struct file_operations fops = {
> >>  	.unlocked_ioctl	= xe_eudebug_ioctl,
> >>  };
> >>  
> >> +static void discovery_work_fn(struct work_struct *work);
> >> +
> >>  static int
> >>  xe_eudebug_connect(struct xe_device *xe,
> >>  		   struct drm_xe_eudebug_connect *param)
> >> @@ -866,9 +892,11 @@ xe_eudebug_connect(struct xe_device *xe,
> >>  	spin_lock_init(&d->connection.lock);
> >>  	init_waitqueue_head(&d->events.write_done);
> >>  	init_waitqueue_head(&d->events.read_done);
> >> +	init_completion(&d->discovery);
> >>  
> >>  	spin_lock_init(&d->events.lock);
> >>  	INIT_KFIFO(d->events.fifo);
> >> +	INIT_WORK(&d->discovery_work, discovery_work_fn);
> >>  
> >>  	d->res = xe_eudebug_resources_alloc();
> >>  	if (IS_ERR(d->res)) {
> >> @@ -886,6 +914,9 @@ xe_eudebug_connect(struct xe_device *xe,
> >>  		goto err_detach;
> >>  	}
> >>  
> >> +	kref_get(&d->ref);
> >> +	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
> >> +
> >>  	eu_dbg(d, "connected session %lld", d->session);
> >>  
> >>  	return fd;
> >> @@ -918,13 +949,18 @@ void xe_eudebug_init(struct xe_device *xe)
> >>  	spin_lock_init(&xe->eudebug.lock);
> >>  	INIT_LIST_HEAD(&xe->eudebug.list);
> >>  	INIT_LIST_HEAD(&xe->clients.list);
> >> +	init_rwsem(&xe->eudebug.discovery_lock);
> >>  
> >> -	xe->eudebug.available = true;
> >> +	xe->eudebug.ordered_wq = alloc_ordered_workqueue("xe-eudebug-ordered-wq", 0);
> >> +	xe->eudebug.available = !!xe->eudebug.ordered_wq;
> >>  }
> >>  
> >>  void xe_eudebug_fini(struct xe_device *xe)
> >>  {
> >>  	xe_assert(xe, list_empty_careful(&xe->eudebug.list));
> >> +
> >> +	if (xe->eudebug.ordered_wq)
> >> +		destroy_workqueue(xe->eudebug.ordered_wq);
> >>  }
> >>  
> >>  static int send_open_event(struct xe_eudebug *d, u32 flags, const u64 handle,
> >> @@ -990,21 +1026,25 @@ void xe_eudebug_file_open(struct xe_file *xef)
> >>  	struct xe_eudebug *d;
> >>  
> >>  	INIT_LIST_HEAD(&xef->eudebug.client_link);
> >> +
> >> +	down_read(&xef->xe->eudebug.discovery_lock);
> >> +
> >>  	spin_lock(&xef->xe->clients.lock);
> >>  	list_add_tail(&xef->eudebug.client_link, &xef->xe->clients.list);
> >>  	spin_unlock(&xef->xe->clients.lock);
> >>  
> >>  	d = xe_eudebug_get(xef);
> >
> > This looks like this could deadlock.
> >
> > - discovery_work_fn is queued with &d->discovery not complete
> > - This function runs and grabs &xef->xe->eudebug.discovery_lock in read
> >   mode
> > - completion_done(&d->discovery) is waited on xe_eudebug_get
> 
> If the completion is not done we just return NULL immediately.
> 

I misread the code, I was thinking xe_eudebug_get blocked on the
completion. This looks fine then - sorry the confusion noise.

The locking here looks much better than the previous revs.

From my review PoV - locking:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Yes, previously when we actually used wait_for_completion() here
> it was a problem. But in this version completion_done() does
> not wait. Looking at completion_done(), the not done path is just
> !READ_ONCE(x->done). Did you mean the taking the spinlock to
> sync against the complete()?
> 
> -Mika
> 
> > - discovery_work_fn can't complete d->discovery) on
> >   &xef->xe->eudebug.discovery_lock in write mode
> >
> > The summary is - it not safe to wait on '&d->discovery' while holding
> > &xef->xe->eudebug.discovery_lock.
> >
> > Matt
> >
> >> -	if (!d)
> >> -		return;
> >> +	if (d)
> >> +		xe_eudebug_event_put(d, client_create_event(d, xef));
> >>  
> >> -	xe_eudebug_event_put(d, client_create_event(d, xef));
> >> +	up_read(&xef->xe->eudebug.discovery_lock);
> >>  }
> >>  
> >>  void xe_eudebug_file_close(struct xe_file *xef)
> >>  {
> >>  	struct xe_eudebug *d;
> >>  
> >> +	down_read(&xef->xe->eudebug.discovery_lock);
> >>  	d = xe_eudebug_get(xef);
> >>  	if (d)
> >>  		xe_eudebug_event_put(d, client_destroy_event(d, xef));
> >> @@ -1012,6 +1052,8 @@ void xe_eudebug_file_close(struct xe_file *xef)
> >>  	spin_lock(&xef->xe->clients.lock);
> >>  	list_del_init(&xef->eudebug.client_link);
> >>  	spin_unlock(&xef->xe->clients.lock);
> >> +
> >> +	up_read(&xef->xe->eudebug.discovery_lock);
> >>  }
> >>  
> >>  static int send_vm_event(struct xe_eudebug *d, u32 flags,
> >> @@ -1112,3 +1154,86 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
> >>  
> >>  	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
> >>  }
> >> +
> >> +static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
> >> +{
> >> +	struct xe_vm *vm;
> >> +	unsigned long i;
> >> +	int err;
> >> +
> >> +	err = client_create_event(d, xef);
> >> +	if (err)
> >> +		return err;
> >> +
> >> +	xa_for_each(&xef->vm.xa, i, vm) {
> >> +		err = vm_create_event(d, xef, vm);
> >> +		if (err)
> >> +			break;
> >> +	}
> >> +
> >> +	return err;
> >> +}
> >> +
> >> +static bool xe_eudebug_task_match(struct xe_eudebug *d, struct xe_file *xef)
> >> +{
> >> +	struct task_struct *task;
> >> +	bool match;
> >> +
> >> +	task = find_task_get(xef);
> >> +	if (!task)
> >> +		return false;
> >> +
> >> +	match = same_thread_group(d->target_task, task);
> >> +
> >> +	put_task_struct(task);
> >> +
> >> +	return match;
> >> +}
> >> +
> >> +static void discover_clients(struct xe_device *xe, struct xe_eudebug *d)
> >> +{
> >> +	struct xe_file *xef;
> >> +	int err;
> >> +
> >> +	list_for_each_entry(xef, &xe->clients.list, eudebug.client_link) {
> >> +		if (xe_eudebug_detached(d))
> >> +			break;
> >> +
> >> +		if (xe_eudebug_task_match(d, xef))
> >> +			err = discover_client(d, xef);
> >> +		else
> >> +			err = 0;
> >> +
> >> +		if (err) {
> >> +			eu_dbg(d, "discover client %p: %d\n", xef, err);
> >> +			break;
> >> +		}
> >> +	}
> >> +}
> >> +
> >> +static void discovery_work_fn(struct work_struct *work)
> >> +{
> >> +	struct xe_eudebug *d = container_of(work, typeof(*d),
> >> +					    discovery_work);
> >> +	struct xe_device *xe = d->xe;
> >> +
> >> +	if (xe_eudebug_detached(d)) {
> >> +		complete_all(&d->discovery);
> >> +		xe_eudebug_put(d);
> >> +		return;
> >> +	}
> >> +
> >> +	down_write(&xe->eudebug.discovery_lock);
> >> +
> >> +	eu_dbg(d, "Discovery start for %lld\n", d->session);
> >> +
> >> +	discover_clients(xe, d);
> >> +
> >> +	eu_dbg(d, "Discovery end for %lld\n", d->session);
> >> +
> >> +	complete_all(&d->discovery);
> >> +
> >> +	up_write(&xe->eudebug.discovery_lock);
> >> +
> >> +	xe_eudebug_put(d);
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> >> index a5185f18f640..080a821db3e4 100644
> >> --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> >> @@ -19,6 +19,7 @@
> >>  struct xe_device;
> >>  struct task_struct;
> >>  struct xe_eudebug_event;
> >> +struct workqueue_struct;
> >>  
> >>  #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
> >>  
> >> @@ -96,6 +97,12 @@ struct xe_eudebug {
> >>  	/** @session: session number for this connection (for logs) */
> >>  	u64 session;
> >>  
> >> +	/** @discovery: completion to wait for discovery */
> >> +	struct completion discovery;
> >> +
> >> +	/** @discovery_work: worker to discover resources for target_task */
> >> +	struct work_struct discovery_work;
> >> +
> >>  	/** @events: kfifo queue of to-be-delivered events */
> >>  	struct {
> >>  		/** @lock: guards access to fifo */
> >> -- 
> >> 2.34.1
> >> 
