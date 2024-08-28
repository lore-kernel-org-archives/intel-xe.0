Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD7DC636E0
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 16:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE89A10E595;
	Wed, 28 Aug 2024 16:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwbFdJYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE7910E595
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724863586; x=1756399586;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Prkmf2qdy9Ew1/kuIFEedd/mss49KEALClGa8BpbNgI=;
 b=lwbFdJYoJGX5NIEASemmmDj+ob0/5YMuQtdp1wKmUGom3/bH3AMFKzkR
 JljDQ9NXq+d7gkG2sh0lprMrvN/7oTd0jQMqUKWWGEUik4xmB93HMzsJH
 xPCCIp+XNLx+iUQmvANCnz7g30Mp4ax8z78LeTxnFEqSforSDXnht0KEu
 3+YcKN9JyopX7/PjrZRz8XLMmWJAksGFdPq2J3Oqdgs+Vptj7Y6Spj0Ie
 hjlCxcvL11ec5s8VUed/TpRr/78JQBpB/ez24S5AhoSHB8Pbi+Rz6Ohy0
 Cp5kbG5ihr7AYlWiMqM6PuGk1Eh7L1qiqz/FZ+p6UK0RLhPcu1RdYg2aC w==;
X-CSE-ConnectionGUID: YqO/MQkdTmmByC+euf6tdA==
X-CSE-MsgGUID: jPolLcAsRnO2Z+0kOM2Btw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23215238"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23215238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 09:46:25 -0700
X-CSE-ConnectionGUID: /b3hXAFPQTi4GckTY8zFAQ==
X-CSE-MsgGUID: XWuL1NgWQHaa3IQnhcR1LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63618163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 09:46:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 09:46:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 09:46:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 09:46:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 09:46:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u06khdZeNqqgSSg/hiTS9HvLH3W/1ZpnW5T1E0pMizhtiHH/jizsHwpyZbGRUhtGTG+rSSfI+wADnVKsehFg8Bp5TWUPFJ1y9whO8iTksXpJ1irjZ/mrze3aamat5CoWALouQYxK6ynuuiXxt8bnCTjC2JOuv2ysks+bFNKe5uE1fXCYVwD33/wQbCby4ILRtBcQWM4h0rEYRnMfKTUM0dI/lGrJ9CGabyTff4n2ByesCXkRJFf0YLAB8N39Rcpab8DHSYsroWOgFFK8iygr1WX6q/zZTxNPRGq+MH02pe1z7VQX/aPMXxNJC/fYMZKkbfJNOMmX9Y9Nar1JOQ3wFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObzocTiEuQF8O9VyBKPxooyO8OqaZJWBe/zv7RuhsQ4=;
 b=zF9SrA19UkEmr9gLRsC0IfZptVvnonvA0FjNOR1yZAjkQfFQUWJerBNXRurRh2VNoWLhjGLib75tuikzDqaocIv+vzrxOZgrmnuXr2AMdi8hfmhyQgPFTriXheEDgVNxDNFsxA+yyllz0RoiIx612EIUOZ+bBKH5rmxcLMwdDdLQQTolLeBLKFkpWsUQ5uK++iWBjA6oxNw5O6re4s+c2jD8gDPFm+lLkXRDUiULeM0A9oGrpb5Cx6g9076Oh1FhHpy/pSTRHLjK6Iy03zvORpouuWtEQ0C6GNsm1H1zIIv+c8/FaDHKpF4itd6ZBWE5u0OE7JxZ6+3FQU4HfILPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 16:46:22 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Wed, 28 Aug 2024
 16:46:22 +0000
Date: Wed, 28 Aug 2024 12:46:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Drop force_probe requirement
Message-ID: <Zs9UWpFXsON6JAMk@intel.com>
References: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
 <kbmz3xqpsngb7yq6fhrtxvfxilh5wzpgbz5cgwujwrmv5s572k@vjedhdbwvukt>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kbmz3xqpsngb7yq6fhrtxvfxilh5wzpgbz5cgwujwrmv5s572k@vjedhdbwvukt>
X-ClientProxiedBy: MW4PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:303:8f::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e56111-cd0d-4f02-4689-08dcc780f27a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JWBv9r07qSa3ZDud7DwrBbuKSqJR0V5rptraoyj+UpB5ny2vRfgXYbC0Dw?=
 =?iso-8859-1?Q?5aJsTFsY3ZfM1gzCLxMEGXMPmtyu79bn3VF7VGH55J6/48jHHs6cLEyBiS?=
 =?iso-8859-1?Q?q8tRo0Z8xF/8BwGN07WIRa00fTBdJHisLUgRevUOXIstmhDwDRBHLiU5zd?=
 =?iso-8859-1?Q?dgWCRrzX5Z0RnQDKpfALAS6p0cP+4Roo9AyHTJk0ShkFmPryfu0pIQ/ebl?=
 =?iso-8859-1?Q?GQJ+O4W/jdbVYd/pKCSfbQM6fl6WPLwjTwHIl5I/HcXcUeQyQiXTVcZl6A?=
 =?iso-8859-1?Q?DSfWK570GUJzyY1V8B3Z/+XPImw8TnhM3h8lRGw+hp2Lmd/LASjnawyf5x?=
 =?iso-8859-1?Q?ymCFhKwFa4cweWcsVOx81u6qp1ghxWF3Ctub4ycV8FtBS9MH8OYRFwwrU/?=
 =?iso-8859-1?Q?Ee8m6W9ctr/3EthN995+q7PCguR0Ztg1muzx0KROoSGiN+x9dPv+vLb0GD?=
 =?iso-8859-1?Q?gF4GZ2zGAf87876WMuddKnWYFi+lGdVE2KRmjdFtdWET7zJmiSoMNGuBQu?=
 =?iso-8859-1?Q?jZInp0aTXgj0btjmKg4DLRocVYKtjY1n3OSqMHrIYr+B6tIcC4bjxW0mrg?=
 =?iso-8859-1?Q?6o+1kcfm8h8M6qRbuY2Poiid0r2H9YB6HHBDFykqw7H9uD6es6YhxKWcgR?=
 =?iso-8859-1?Q?wLYVGgMwh6KzWddIVeYmLdDj153m8ycSHi3PXIxjtPmtcph+XfJLmGA3we?=
 =?iso-8859-1?Q?deOAdAAZKG4iY82d/21SOkN7lnXY/GG+ZtiggNRFPjSMtcOnpYLRMIgTOL?=
 =?iso-8859-1?Q?skO8dlSS60kLwpk0XH/YvAfOgqhrjarz3Sz9eRI7ttXiCzepWgA+gxMcgZ?=
 =?iso-8859-1?Q?wg1ui/YnNGY/E1zS2Bko75Bzx65X6mTEXAf+8CJL7TPVo9Oa3deEnpyUDl?=
 =?iso-8859-1?Q?zd+sIwLqwRd/qfcP9uZNx57x9nyid6h/arloLGmayGpTW94Whv2mxRR7BS?=
 =?iso-8859-1?Q?SNXTuXWYnwIUkTYjQ67VTJCJgLpg8+UHvsrKHYqWjvmUP/38UitusEz+D+?=
 =?iso-8859-1?Q?R0kCCxgdCL47eXqnBOZ9gUkdv5Ie1EoqcSwocpUyZGUgZE0ebxM/dcIu/X?=
 =?iso-8859-1?Q?b8J3sC5xRqO4qJUOeLlVTVhGesoUpir+j4u/plS7q43iqZQhLoJyJi1l4g?=
 =?iso-8859-1?Q?KDLm7GwUNrud7a+MJIuanc/sprvacHrBqlfA++NvVPQPhZjxILm0VL1IxD?=
 =?iso-8859-1?Q?1Nz397dZyXcaJISdYU1PdXh2gVFV2q7BtwVdn1pkPpplOXyF2FmqkM0RWj?=
 =?iso-8859-1?Q?IuLYdFdxFqvyfZS8VO6VWNkzV93RSBI5o9vWK9wN4a8lym6zXRRgDBko3l?=
 =?iso-8859-1?Q?OLKMiu9QF3AxdSCMLKmF0nxX9C0/xtjdWLndBR5cTOJAlr63uHd3k0drB3?=
 =?iso-8859-1?Q?QgbdCBuDqpY12swJoVgfjDIQIP0w206Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aG3x0lDlTiGDz7ka5/7ezPRaeeUsexTEj8ZGb1LQWgtpI1qkMHGaNqNFNL?=
 =?iso-8859-1?Q?ArQ4YtxRIhqznRYlNTxGfPu+TGzA0KXKuT1zU1Y4viLc1uBYEGKqzZPSZo?=
 =?iso-8859-1?Q?GvnEq+U60xFb7D6xrO4W1yKz5seiFINgn4b5UfDMd/rJj6Fs6ssBLx/oK2?=
 =?iso-8859-1?Q?rgWog4x+eEOsRJvjgieMdfvNSNpUGyC/WhaI7xVIRhFLct1vjOsrng6Zn7?=
 =?iso-8859-1?Q?kfIkaCA0ESsjq8m14e0t6azjjEanC2vytmkLkE7uVNzh97X6QQmgllwySt?=
 =?iso-8859-1?Q?GdBeMITqPwbdzWyA3qZyIwKFb8QbjJLLA2rGqMBycGBRgv6KyXHUz4tzcZ?=
 =?iso-8859-1?Q?5egOOUynNNTatjslpNmt9qTSslceGkxULsnuINJnp93j9DtePw//lE5mQ8?=
 =?iso-8859-1?Q?sJbeWti7R/bbvQc3ePZbNOcuOQ/yYVSdQ5PBGzaprupsUlGJsfbcik+JsY?=
 =?iso-8859-1?Q?Y+7YgDTtLoYIJwbiutgcaawdpWowZcjCui+N6v5VnFwKur3vKaTcBayE+h?=
 =?iso-8859-1?Q?5nrdXOO+fDDH0otEdT5UwA2pEabkcN42HJFllDb+KyV+xxODrBFIoOAWlP?=
 =?iso-8859-1?Q?3wJ5GMBbHRnkv68EYboDrQFnkTXyAwq3AMQTH3RgQgzhyXtRQf7x67UFjo?=
 =?iso-8859-1?Q?NPAswz1lxQloQjwlDc7FSslkwiQcPJXKU+JqdwMASmoW2HBxxrTxFVY0eg?=
 =?iso-8859-1?Q?YgIw3/2IDLQPsOICI1u+AbyVgJIaZjF18ua8s5Mj4Y85MVKDyve0sARNUp?=
 =?iso-8859-1?Q?6dDfJC4cvOU9Bo6CZsMVEfLPKgJ/IqbP7PkvMu1eTYoENO0InORtwymyxk?=
 =?iso-8859-1?Q?myGfDLbeMgFCLpx+k6j/ErmQl43wwHPqDs6GcUetaraA3UYzRng1QsqtGE?=
 =?iso-8859-1?Q?CCUPjF/PPy3KqDzzGbSssPjIzBAOriK1UClYvFMtqZIjbqRmvCFyqMxgA9?=
 =?iso-8859-1?Q?/Ejd7uCHuKBmYGVSmJQOyyA9U4SVOZNaTdxALAFYY4niMP63c6Rau7q15n?=
 =?iso-8859-1?Q?Cgfu+rGkphdday7JbRgkLDX8dR5KFGgA4WXDpBVroZYc7ux6FlRqnzHky/?=
 =?iso-8859-1?Q?FEJbD1maVvMXmhs9BnEWsXF2++yJe7gub/HGgSEeukz33QLS7W9/+ct0rD?=
 =?iso-8859-1?Q?0GMgCWPicNKt4Wl5X3/ve0Hvu6tcAnpvo9JHAo17pkoYXrW4xtiZFiuG35?=
 =?iso-8859-1?Q?0az/gx/gT7mvtvGxhbAjNWCux34qYwdXzuAPoak3xxeZuafqko/0btqo42?=
 =?iso-8859-1?Q?2Nf2HNhXCH1i7P5f5LsUIRSborkZBSdnhEDsENpgO7YZjaG+/kgFgI36Jg?=
 =?iso-8859-1?Q?JIRoLy7IWwEgb4XBVNMWYL36YRk0HfgcVoRZNZplv/dR/hdvrSvxNohKPm?=
 =?iso-8859-1?Q?3+BqtCsZt7DyYs5xDpuAuMhRkx2thwYQZbE/sVNWfDaMV7yGh3pLE60Rj0?=
 =?iso-8859-1?Q?mAMEvdLFQ2VpQyaOusfQVZnvruriv8a06GiLNUkmu9D0NbrtM7+VWHA7F5?=
 =?iso-8859-1?Q?URB5YyD9tDUH6O3FKPe1t36oEF4JjUby32qLULzrB2CLhUXSuFYsRLU4eQ?=
 =?iso-8859-1?Q?w82ZoMxqOkwKDVyujUBkP2GcipZ0Q64Jdv8IZj2gP9x/zvxAJB4sXIfm/T?=
 =?iso-8859-1?Q?7tVCuJusqFeVgQB7XEYpJ3E4Ym8qvMGxAmyKUg5M1/gFLwURQIv0Nslg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e56111-cd0d-4f02-4689-08dcc780f27a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 16:46:21.9888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqs11Wv69tDpvfzTk0iat9LmKGXEQ5OUNic45zSASywi/jz66JnT6oeo+MPE5IqQlfH4BnIqK5hARNPJz7oJUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
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

On Wed, Aug 28, 2024 at 07:22:16AM -0500, Lucas De Marchi wrote:
> On Wed, Aug 28, 2024 at 01:51:52PM GMT, Balasubramani Vivekanandan wrote:
> > Battlemage platform is sufficiently tested and found stable. CI is also
> > pretty stable.
> > Removing the force_probe requirement to enable the platform support by
> > default.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> main caveat is that there are things needed that's going through the
> drm-intel-next branch. That is known and we are testing with the merged
> result. We need to get this in and drm-intel-next needs to get a pull
> request done.

No worries, the 64k-size-alignment for display is already in drm-intel-next
and going in tomorrow's PR towards drm-next.

So, let's just add this here in Xe and send in this week's PR as well.

Next week we do backmerge no both sides to bring everything to a sync
again in our -next branches.

> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> 
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/xe/xe_pci.c | 1 -
> > 1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index fa57996f9c37..330cd2d785bc 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -348,7 +348,6 @@ static const struct xe_device_desc bmg_desc = {
> > 	DGFX_FEATURES,
> > 	PLATFORM(BATTLEMAGE),
> > 	.has_display = true,
> > -	.require_force_probe = true,
> > 	.has_heci_cscfi = 1,
> > };
> > 
> > -- 
> > 2.34.1
> > 
