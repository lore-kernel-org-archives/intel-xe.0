Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B5C61DB2
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 03:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AE510E2D8;
	Wed, 11 Jun 2025 03:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5v64lo7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3436810E2D8
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 03:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749611021; x=1781147021;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wKX5+s1dC6wq8T082Vz9HrEQnS0bUmmQgqEsB08WJyw=;
 b=g5v64lo7KXEf0bWvKjiKLT8f3J1Nd9ONlcUjYtZqHRE/U9m5DYGA0HJC
 PRTxn8oExnJYiq1uIKV+hL/wt0gMkCMV86Y1qABQ2t/9kzGD4i/dA+LYB
 JC+Epn1WcTqypwQB8q9EgiCiW8nxWsTVchGnv3J4ByknbqatmlvGyuIJ0
 csk6YxGUyCd1vObnX3tDzkpC3X2Nb4jSNHgiLJENbRb+nsYEHVa96QFlz
 L0YPoObK8hyVxlDy71Jr4DpRLKnjM5NPJx4Yoae9lSap5ejObbUizcm/a
 yRJwwqz5ZdO5L/I6UO/dk02pfE6mG8YKQvm+RSjSwlxwInOfLYhgpHX+o w==;
X-CSE-ConnectionGUID: E5o4T0tqQkC9yaDjNWYmvQ==
X-CSE-MsgGUID: xU85gcZ3TDWRAhFYV0N7nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51878582"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="51878582"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 20:03:38 -0700
X-CSE-ConnectionGUID: p9EUyBaFQjaLae+MoPVOSg==
X-CSE-MsgGUID: hKGeYq+ITZK81ph3cJ54gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="147960337"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 20:03:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 20:03:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 20:03:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.53)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 20:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPEwPm2v/fxC1e8sq47uS8z37mDX9NbymPJy6OiRuvWeNorW77fs7QqHYY6o1C64XDOjLkTm6fq3wDunhGqloddonp4Um7rBUbC+a1yaQMAXNjz1SwkbneMZEnK5ErsFibpT4O9vvN+aU2/hjP2AWoKf9OsYYpnLBuJN9QkCz28do80f9zPqi1j41vgyLAEXZvAUy7gbTMTblxomqNefc4HYxirNupW6SDOjbSgQ2qtJ5oiiKCY3PCWNC5cXy+fxBZWESOS7ftrT1nGLMKftTm+9Q6fwTA212AqxVEDQnxcsYQkk4J5UOQzS3nNR1f7UjEdAoRFck9adT7GF4+s43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofn9lrgLeQyv51Vo0Uo9m9iKqoPyFhgMHhKWA7o1TL0=;
 b=diXpFFDaY7kpczHyfhtFsM+cxOlHadckg21/svDs0cigcd8UQP+p4V6n5B4jW5XCnYgSPs2S3RMKio2igNspk1fwli47a9FxJQE7RAO2XYtYKGN+dchVoDAIdJgwdQqkloxq2YqFI8dQxHcrlClV61xdb2Sx17ZjiaIAbXv9yyimPgI3ODrAXRx0R6luqteg/D2XqJfikdnnz14hpujM02gfcbIDXD5WKT5dzfFtK1oYHYnAWEKBsfyxD4Rj4FiMDcOxzRILvQ19KEk3r5c8sAQdtdxH8LrVhHGPFpKfx6kuPrTM0A4k5zXI9iQIHWlRTF2++rOA+QnMLmrMJkkK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 11 Jun
 2025 03:03:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 03:03:32 +0000
Date: Tue, 10 Jun 2025 20:05:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <koby.elbaz@intel.com>, <konstantin.sinyuk@intel.com>,
 <yaron.avizrat@intel.com>, <moti.haimovski@intel.com>,
 <didi.freiman@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2] drm/xe: Support for mmap-ing mmio regions
Message-ID: <aEjyY95iWKqvl7j7@lstrano-desk.jf.intel.com>
References: <20250609095938.16782-1-ilia.levi@intel.com>
 <aEcByyaKe82P91RT@lstrano-desk.jf.intel.com>
 <20250609215820.GR5080@mdroper-desk1.amr.corp.intel.com>
 <aEd86MvDFJXR+wnE@lstrano-desk.jf.intel.com>
 <705cb146-0ac5-4e5f-adee-556293706ec5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <705cb146-0ac5-4e5f-adee-556293706ec5@intel.com>
X-ClientProxiedBy: MW4PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:303:8e::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: 555e6b0b-9aa6-4625-bec6-08dda8948c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xXq3VVtINMFAwzkhdbU/xyjQkCuE4XPXkU6eJbAIBB8DO87adYloHN/UkcP9?=
 =?us-ascii?Q?5O71DQeX8e3ABZ/eJ0cdPQmQXi7/m31GMPQdTLYY4IelMnNJf9i96OXHHjy6?=
 =?us-ascii?Q?LF8692ckH977X5i5HPhU1GzM3NisXcK6JAHS32ht3Ivq3IzBrESQdKrsE+29?=
 =?us-ascii?Q?TZlwFLFsTMBTFT/YEMqtAY7fzD+qWCdUMYMvYH0AXPBmclvoYcji8W3zEPSr?=
 =?us-ascii?Q?f2Ob2TJOR4dfCDUsXRaNJXoTN52IrtaKpbWt53dibubNfV9fIjlt1bA6TAYU?=
 =?us-ascii?Q?Yt6RVLP3LNrdajXnT/G9a7CSsRezdykMDTyqHiPdGHQEhVmRv4SpMQuNMmDy?=
 =?us-ascii?Q?8vLOLjmYfDCgiTfpBAotu9Z1Xeob2Q6rReS+j3S5zdFHVMzzVsS4QfxtV2rY?=
 =?us-ascii?Q?ICzskRsWPn8SEA4MvF3j0m3VLSQnOh0fRYpcUwyaGvTKbaF7UMPNEcWeCHbQ?=
 =?us-ascii?Q?Vj1RtB5h/yggQEskcAeIBDTE9BAs2hE+1HU7SbB3rn4NBYXVUXbuJ8TnFDAi?=
 =?us-ascii?Q?UUZXBSKv6ICaHGdOZtAcJse6Pw9La0pCww7pEBIxBHyqfJhSrPLP1kxlIg7f?=
 =?us-ascii?Q?93OGRcQhp01j3Qdb6/1R95P6SNvkly0RLHIcxMG81/SPxF5BXkhvlaQlExc2?=
 =?us-ascii?Q?idmWTTYMuG7RsMg33pX3JoJN3rqqZrLMAJOIAQlZWdUX2ViiiE2cssFECL7q?=
 =?us-ascii?Q?KL1xf5xYa/7mGBctDU8g/Ke8WYs7tlqjImevWTE3pNrMaQNixXinKUFdznp3?=
 =?us-ascii?Q?pmrZwHP7rNW0R0N/1C5MKg+Bzot4jGgrAYdA4M5QhrZev6bY9MMJqDu4ufgr?=
 =?us-ascii?Q?IeU7Pp5LRzqrrz+kubPjUKL3RP/hutJlFWGAD75d3sxRwsLV0FTyF2MO96xC?=
 =?us-ascii?Q?zEsPwQXSMmexGBMQeicCuxlhjG1S9gkSNPcjBwySTVGSodJRXB/7ES+9PgU9?=
 =?us-ascii?Q?ESB282FCtWzm3ziDcS7cE++HuTxfuVGbcmEglPhp6nKXB70En+BPiZazS7hY?=
 =?us-ascii?Q?7lBgo5n2selme/Io0O9o59CSDv4SLmhU8bF7x029qdNUiK6KZcX6k0vyraZc?=
 =?us-ascii?Q?qbrHvNjYwxBmg466KpoGFN2/XuMCKYkjelRaqAcAB+p/GXo8eBH0xnSvZikR?=
 =?us-ascii?Q?XHmBtLVf0/xMwX/wDGTS3O+uS98FMfDwrhUJsJVWm0JVtDRPp/A7J8GRctU/?=
 =?us-ascii?Q?myEZUcJocQ9lxgsnzdsgsKwQzywx4zJFs5Up3heeeLxx1E6dBZKZBGQTq9+o?=
 =?us-ascii?Q?ypd5FBt2qV0gM6VbT96VjHstio6PzWUhMBsHbSFt4NoV3SCtO2XGRd4A1VlE?=
 =?us-ascii?Q?9fHntfxpW7sdWXe2UOJu9t94gFhwuRShgE+koe7CvffDHXy9pp0SYPgSEQK7?=
 =?us-ascii?Q?Rrz2GgyKFKShE30/Ebaexm93FOSFZUj12yJcn44QVnHo/fE99qyU35lZpIkl?=
 =?us-ascii?Q?4oTg+LZfhW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hr7ZpALxGvdv1sJ7CcNQsaIf4iKfyTjHCW+zWNijMCZtiodVPey3O1H8E/92?=
 =?us-ascii?Q?h2BBt1XjFUPNW5jLRXMxAPPpdZVAZLumvpILLfy8cMlOKLFYFgZ/D9wRBgwj?=
 =?us-ascii?Q?90Ky29ySDCb8YmSJbeA5FGdXsK9nAlYbc2t6OgojzsPvJk+bdzWYlTFyKbNW?=
 =?us-ascii?Q?+2k+ju4UxVo79oZUW+ICxG3+zMtyjCMRCU2dFY9GUQk6OplNFpIW1BJp05l0?=
 =?us-ascii?Q?m2eixcUTKcvkl5xEl+XZc8QJWLFpcDVO1aYEz2YwhICVjmSf8IFmQ6byQdbU?=
 =?us-ascii?Q?kr/uh8eklGJfgb8q30eW1XnWX20/DLw3cGoWYfzMMlgLd0XsICK1/06R4iiu?=
 =?us-ascii?Q?ACBbsjbM1J1g2inVFGKMjwCM2y4DKeMbv5v4OyodZe+s8FTIRFp3LajAnDnE?=
 =?us-ascii?Q?O+CB6QHms4IVKEn4IScKgzVpLeT1IlDBVQLxFwZz0Rh7v65gcjDCaOgyQMZI?=
 =?us-ascii?Q?4kE7JbQlSMKtuEFgBjOvg42EgR+3vZbcmTcvcL030y1KjkpUqbLpeejyma9D?=
 =?us-ascii?Q?xo3MvVpwLh8A8BOU6tM+BiQdG4IMlYwcRAsoGnY/8nmZ4jbUEOiHO5311euy?=
 =?us-ascii?Q?8sDbcB9K97vBeUmTwoK2yl+PwlGsOVqU1nYKD5nz7rGqFMqlI+zZqNST1Wrv?=
 =?us-ascii?Q?QtgVBNPHB6vf7jHLxiRTOsq4ZokP9kgSQeDO8gdJ06Q0sj4TcREl0tEyjXFx?=
 =?us-ascii?Q?T5LnRS2Clp1PKDH4XuvFx0JlWR8tKxOtO6Gm/yXKG+vKjYWfxSpHkv44XDLv?=
 =?us-ascii?Q?E7Sf397Yio0yDxWkwrCZ73D9pbtB/alPlB86SYGQd8IMr2V2e6wmlulh6Rqx?=
 =?us-ascii?Q?+hibvDaP/nkdOUS+lu7uXp2Rzn7nxKOwfxSiv/981LKRN1RpLllNYKVjabe5?=
 =?us-ascii?Q?A9KyYaHjtUCUBXrKz0Z3BvVs/IUsMl7SGADz1tDq5RqiVh+c+cGf3Q6dGfcS?=
 =?us-ascii?Q?DufuIRPk8pKU85DWYIZojbWyK3l+njoEcnSfuOhHzbe1k2vabfTlzKtalOM5?=
 =?us-ascii?Q?lDahV6vUJPwwlyvZJQJtKqcRTqUI1ZefnfTsDHE/BylsmkFoF0RiIrFQmoND?=
 =?us-ascii?Q?n/QvHNyfkA8//gDJgq+YTV5lXhw4ckczUfdgLNMdqwI77ZhdXt7Fr9tCMY6i?=
 =?us-ascii?Q?wCyKvA2e9O5uel8FJfzkoWTNu+pzuRL+ssVARQ9KfG8q3XVW6K7zllDFkrfN?=
 =?us-ascii?Q?7NBEquI8RWMbtRWzthg/K5PTXNuwAZ6YucXdXC6/Yd7jBaq+c8UVgPQOggbo?=
 =?us-ascii?Q?xCc8rUQTrmttHmUAFPsTAHZpEqzeW8k3rGk11KvWoVz759v63VHJilc4BncK?=
 =?us-ascii?Q?EDqsuQIgxes/a8CNJnMgI/V5Q5GAqipqQaGvQQnJZcPoJhPvMS2UyaJp6rIF?=
 =?us-ascii?Q?PE9UzVxxwo9hZxJIi/Yh6ftDtJRc/lgazvI5b5ZdReXEa2oieiUSngnA9jAA?=
 =?us-ascii?Q?jeTrKHHd4i6C+QSbHOD51kPIH7RPMgRpBpXaFWDwRg7DkK42z5+covMLuX0C?=
 =?us-ascii?Q?o5Z9Rtvpr0ayU0z10hMRL/0WESJ+bXWRZsr5JQPt7oS1Gcb0/WSEcTahxLud?=
 =?us-ascii?Q?xHl3mzLVWEhVcvi8Z9SsOMQUt3KgFJtfMVknDUH+PnpQNH7Ox0YroWKSoeqa?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 555e6b0b-9aa6-4625-bec6-08dda8948c9f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 03:03:32.8622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wy+k2SBpBF2Y1cwfBTsVEao2qF1ePZZrT5JLcQYsVNAwLaM+OWdrzcd8MWR80gZM5KT3f3LSOTpgft9BgcxuHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

On Tue, Jun 10, 2025 at 05:25:14PM +0300, Levi, Ilia wrote:
> On 10/06/2025 3:31, Matthew Brost wrote:
> > On Mon, Jun 09, 2025 at 02:58:20PM -0700, Matt Roper wrote:
> >> On Mon, Jun 09, 2025 at 08:46:19AM -0700, Matthew Brost wrote:
> >>> On Mon, Jun 09, 2025 at 12:59:38PM +0300, Ilia Levi wrote:
> >>>> Allow the driver to expose hardware register spaces to userspace
> >>>> through GEM objects with fake mmap offsets. This can be useful
> >>>> for userspace-firmware communication, debugging, etc.
> >>>>
> >>>> v2: Minor doc fix (CI)
> >>>>
> >>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/xe_device_types.h |  14 +++
> >>>>  drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
> >>>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
> >>>>  3 files changed, 160 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >>>> index ac27389ccb8b..78542de0d48d 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >>>> @@ -10,6 +10,7 @@
> >>>>  
> >>>>  #include <drm/drm_device.h>
> >>>>  #include <drm/drm_file.h>
> >>>> +#include <drm/drm_gem.h>
> >>>>  #include <drm/drm_pagemap.h>
> >>>>  #include <drm/ttm/ttm_device.h>
> >>>>  
> >>>> @@ -161,6 +162,19 @@ struct xe_mmio {
> >>>>  	u32 adj_offset;
> >>>>  };
> >>>>  
> >>>> +/**
> >>>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
> >>>> + *
> >>>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
> >>>> + */
> >>>> +struct xe_mmio_gem {
> >>>> +	/** @base: GEM object base */
> >>>> +	struct drm_gem_object base;
> >>>> +
> >>>> +	/** @mmio: The MMIO region to expose */
> >>>> +	struct xe_mmio mmio;
> >>> Any reason not this is not a pointer to xe_mmio?
> >>>
> >>>> +};
> >>>> +
> >>>>  /**
> >>>>   * struct xe_tile - hardware tile structure
> >>>>   *
> >>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> >>>> index 7357458bc0d2..6bfa915a9602 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> >>>> @@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
> >>>>  {
> >>>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> >>>>  }
> >>>> +
> >>>> +/**
> >>>> + * DOC: Exposing MMIO regions to userspace
> >>>> + *
> >>>> + * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
> >>>> + *
> >>>> + * This can be done as follows:
> >>>> + * 1. Define an xe_mmio instance that represents this portion.
> >>>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
> >>>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
> >>>> + * 4. Provide the fake offset to userspace.
> >>>> + * 5. Userspace can call mmap with the fake offset. The length provided to mmap
> >>>> + *    must match the size of the xe_mmio instance.
> >>>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
> >>>> + *
> >>>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
> >>>> + *
> >>>> + * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
> >>>> + * Make sure not to expose any sensitive registers.
> >>> This is no secondary issue, it is a primary one. There is no way we can
> >>> expose entire PCIe MMIO register space to a non-root user (a root user
> >>> itself can just mmap the PCIe MMIO bar bypassing the XeKMD if it wants
> >>> btw).
> >>>
> >>> What is the requirement for this patch? I know on other PCIe devices
> >>> I've worked on we had similar issues where we needed to expose a subset
> >>> of the PCIe MMIO register space to user space for kernel bypass
> >>> submission - everything we needed to expose in that case was 4k aligned
> >>> + tied to a single process via a KMD config before mapping to user
> >>> space. I suspect to do anything safely here, somethine similar needs to
> >>> be done.
> >> I don't think it was the original intent of Ilia's patch, but I can
> > Yea, I think I figured that out after I sent this - the xe_mmio
> > structure through me off here as this structure currently only exists in
> > the xe_tile, xe_gt but I'm assuming now xe_mmio_gem_create is called
> > with a xe_mmio that is subset of either the one of those, which I can't
> > say I love this as a design - I'd rather have xe_mmio_gem_create called
> > with a pointer + size to avoid confusion.
> 
> 
> Actually my initial implementation was with bar offset and size. But we plan to
> use xe_mmio as a "view" on certain portions of the BAR (i.e. hw blocks) in
> upcoming platforms, so it lends itself naturally to be "exposed". See the example
> from my previous mail, and if you still think it's a bad choice - let's discuss.
> - Ilia
> 

It is hard to tell without a complete picture, also a bit of bikeshed.
My preference still would be offset + size, but it makes more sense to
use xe_mmio with upcoming changes, then with it as is.

> 
> >> think of at least one feature expected on an upcoming platform where
> >> there is a page or two of registers that the hardware team designed
> >> under the assumption that they'd get mapped directly to userspace in a
> >> read-only manner (i.e., information read-out only, no control of the
> >> hardware).  I think some of the internal discussion was considering just
> >> going our own direction and exposing the contents of that register block
> >> via an xe_query instead since the contents likely wouldn't be changing
> >> after boot, but if this infrastructure exists it might be a simpler and
> >> more natural match for the hardware design.  +Cc Shuicheng since he
> >> might find this interesting.
> >>
> >> But if we're allowing this to map registers to userspace in a read/write
> >> manner (or map any special registers that have side effects on read)
> >> then we probably need a bit more scrutiny of the specific use cases to
> >> determine what kind of permissions are required, whether they're safe to
> >> access in concurrent / racing manners, etc.
> >>
> > I think rules basically are - cannot read another processes data, cannot
> > issue a write that has any affect on another process. I'd assume if the
> > hardware is designed with mapping MMIO space to user processes in mind,
> > it would be designed in a way to not violate these rules.
> >
> > Matt
> 
> 
> Sounds reasonable, doesn't |VM_DONTCOPY| + drm_vma_node_allow present in this
> patch cover this? Or am I missing something?

As Matt R. suggests, the security here is baked into the hardware in
that we don't expose any problematic registers which would break the
above rules.

Matt

> - Ilia
> 
> 
> >
> >> And of course since this is new uapi, the regular graphics upstreaming
> >> rules apply and we'll need an opensource userspace consumer fully
> >> developed and reviewed before we can merge the kernel changes.
> >>
> >>
> >> Matt
> >>
> >>> Matt
> >>>
> >>>> + */
> >>>> +
> >>>> +static void xe_mmio_gem_free(struct drm_gem_object *);
> >>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> >>>> +
> >>>> +static const struct vm_operations_struct vm_ops = {
> >>>> +	.open = drm_gem_vm_open,
> >>>> +	.close = drm_gem_vm_close,
> >>>> +};
> >>>> +
> >>>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
> >>>> +	.free = xe_mmio_gem_free,
> >>>> +	.mmap = xe_mmio_gem_mmap,
> >>>> +	.vm_ops = &vm_ops,
> >>>> +};
> >>>> +
> >>>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
> >>>> +{
> >>>> +	return container_of(obj, struct xe_mmio_gem, base);
> >>>> +}
> >>>> +
> >>>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
> >>>> +{
> >>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> >>>> +
> >>>> +	/*
> >>>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
> >>>> +	 * In the future we may want to store the physical address in struct xe_mmio.
> >>>> +	 */
> >>>> +	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
> >>>> +		(uintptr_t)(mmio->regs - xe->mmio.regs);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
> >>>> + * @mmio: xe_mmio instance
> >>>> + * @file: DRM file descriptor
> >>>> + *
> >>>> + * This function creates a GEM object with an mmap-able fake offset that wraps
> >>>> + * the provided xe_mmio instance.
> >>>> + *
> >>>> + * See: "Exposing MMIO regions to userspace"
> >>>> + */
> >>>> +struct xe_mmio_gem *
> >>>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
> >>>> +{
> >>>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
> >>>> +	size_t size = mmio->regs_size;
> >>>> +	struct xe_mmio_gem *obj;
> >>>> +	struct drm_gem_object *base;
> >>>> +	int err;
> >>>> +
> >>>> +	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
> >>>> +		return ERR_PTR(-EINVAL);
> >>>> +
> >>>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> >>>> +	if (!obj)
> >>>> +		return ERR_PTR(-ENOMEM);
> >>>> +
> >>>> +	base = &obj->base;
> >>>> +	base->funcs = &xe_mmio_gem_funcs;
> >>>> +	obj->mmio = *mmio;
> >>>> +
> >>>> +	drm_gem_private_object_init(&xe->drm, base, size);
> >>>> +
> >>>> +	err = drm_gem_create_mmap_offset(base);
> >>>> +	if (err)
> >>>> +		goto free_gem;
> >>>> +
> >>>> +	err = drm_vma_node_allow(&base->vma_node, file);
> >>>> +	if (err)
> >>>> +		goto free_gem;
> >>>> +
> >>>> +	return obj;
> >>>> +
> >>>> +free_gem:
> >>>> +	xe_mmio_gem_free(base);
> >>>> +	return ERR_PTR(err);
> >>>> +}
> >>>> +
> >>>> +static void xe_mmio_gem_free(struct drm_gem_object *base)
> >>>> +{
> >>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> >>>> +
> >>>> +	drm_gem_object_release(base);
> >>>> +	kfree(obj);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
> >>>> + * @gem: the GEM object to destroy
> >>>> + *
> >>>> + * This function releases resources associated with the GEM object created by
> >>>> + * xe_mmio_gem_create().
> >>>> + *
> >>>> + * See: "Exposing MMIO regions to userspace"
> >>>> + */
> >>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
> >>>> +{
> >>>> +	xe_mmio_gem_free(&gem->base);
> >>>> +}
> >>>> +
> >>>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
> >>>> +{
> >>>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
> >>>> +	struct xe_mmio *mmio = &obj->mmio;
> >>>> +
> >>>> +	if (vma->vm_end - vma->vm_start != base->size)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	/*
> >>>> +	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
> >>>> +	 * whole buffer from the start.
> >>>> +	 */
> >>>> +	vma->vm_pgoff = 0;
> >>>> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> >>>> +
> >>>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
> >>>> +		     VM_DONTCOPY | VM_NORESERVE);
> >>>> +
> >>>> +	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
> >>>> +			       base->size, vma->vm_page_prot);
> >>>> +}
> >>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> >>>> index c151ba569003..2990bbcef24d 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_mmio.h
> >>>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> >>>> @@ -8,6 +8,7 @@
> >>>>  
> >>>>  #include "xe_gt_types.h"
> >>>>  
> >>>> +struct drm_file;
> >>>>  struct xe_device;
> >>>>  struct xe_reg;
> >>>>  
> >>>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> >>>>  	return &xe->tiles[0].mmio;
> >>>>  }
> >>>>  
> >>>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
> >>>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> >>>> +
> >>>>  #endif
> >>>> -- 
> >>>> 2.43.0
> >>>>
> >> -- 
> >> Matt Roper
> >> Graphics Software Engineer
> >> Linux GPU Platform Enablement
> >> Intel Corporation
> 
> 
