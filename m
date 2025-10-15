Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B07CCD194
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 17:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5D710E896;
	Wed, 15 Oct 2025 17:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDNS+fJz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173DD10E899
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760548075; x=1792084075;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ls/rZGIjnabxMOkm61S+xh2o1GU0lortCzU0XuMDu7s=;
 b=BDNS+fJzb7T6C00qeYc9lJpIHBMTuZED/7iRWYums0bjjaamgsFJR8Nn
 1A18lGnvGMetehZpagbrc4dCoO94RqZRAtUzAJZz37S6YCnqDMb651FpR
 Hf+7IxmvnRHDKWQGxn6HHT3/fsvagCab80SmMbPLbojfmqrMcIm1MEJAG
 EmjmXZTGt3lhay/87xg39dMDMdlrRsLJmA49diUD03/uP086gob35OOpl
 rx8EO5zCZhjskaaiBjpn4jlLjCLN/ZHwm44u77sP4B+hYj6jJa3yj2LdZ
 ROFnmQmiLk1cxl5djnd0TsY9sWEpTJzjOhPV+BgmjAq41XEr/MUlPEwXf Q==;
X-CSE-ConnectionGUID: I4eYQ9TyQe6k3uFAIQDVQg==
X-CSE-MsgGUID: 1kvEJL26QgqXmW7V+b3lAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62659521"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62659521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:07:55 -0700
X-CSE-ConnectionGUID: GBtWEYKjQ2SYHLqj3IHJGw==
X-CSE-MsgGUID: pvjBmt3SQECpeOPkrM3AZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182690429"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:07:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:07:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 10:07:54 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:07:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D59EV9qdFiiFNBprZTUyPyeSxNLMWpP5NdHwI1Tt24Dri2l3ayXfLuhUoa+bHW5YKkHLkst/aUZH4vuwM/9q6cim+cqAkt9CRy5Sp6NsNh6JHXO9y+YDEZC6i10kBOnSfRt4L6qTauKrDKq7AnbSDvtLtot4lTndwupDKX7QD045lmvWXbur4PcxmngwoKZR7BoOKrqbputZFbqY2vCRA9OWC6LWvTgSVkcpOBojobFR5cYrKBL+8oD1I/kEBczexVfmMJQtJ9oDuUeruRfNkSyZlDMAxLSoQaciqT0RhE5k2YrGrV1/b9w8TQC6G9/d6LdQNukJ7kWc9gC/h4uwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imuhjaU5y1GLnWrohY4ep1HiBKD8noeXjJoH8t+ikKw=;
 b=uFYn8fum0xRkaYhnA0B6onq5wJqJTgqqphegRpVIk2bhe6NmpH9AJZ3yqGaaCdOzi8m4x692VGp+xwy8+pBML2U/GEfYccIZgp8ZKfvzwj+NtsLS8kAtiw7bS6PFJDLAMXcPcxcoocgJTpWHt99B3zFUN8AxE5Fn+ilFkB+inOvUc8u1Nb5QapwDTIJ7junPXd3TOT/HliAFp1a8CVBPZtBp5+0Q+ffxuw+2czPyBzavlRUvbuFmjuzXFBfvCHch61BmZ4tPY7QKJ4zYMNIqS4wJ3TGYPBUG5o7yUErqnpFd2NQryEXi4nZg5R37vadWMnaAl0yUMBWaJkD5pPf7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 17:07:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Wed, 15 Oct 2025
 17:07:50 +0000
Date: Wed, 15 Oct 2025 12:07:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, S A Muqthyar Ahmed
 <syed.abdul.muqthyar.ahmed@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 20/23] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Message-ID: <ogshbvnk2ynz37otydx6l4e6ul6zc5n3h3rz43ajsrl5uuwqtl@hzul63lasfok>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-20-bfb74f038215@intel.com>
 <20251014180705.GY5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251014180705.GY5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 4029604a-9f6a-4f21-975b-08de0c0d5f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qq5irSoRNjkucWy31TKZ3PyC5GPk9rddfCQmGrbQNQFNWpk3iie9XypYgz1Y?=
 =?us-ascii?Q?mSc+aoP16ZaIIFANP8xE/mY28hH3HBd+hspk4bTiSqoToHAT0/xEKl4UxQh6?=
 =?us-ascii?Q?LJkScoIH8/vC6usVVMLg78BKzOvTcqvX/RInJqm+byR49Coo5isUI08WrNSg?=
 =?us-ascii?Q?GcTGc9NBU/0rQTSTumNasLovXTRUfjF1HzQR3beSPwJxiDoxh9woNqsQy+oz?=
 =?us-ascii?Q?qcc5kcEWmcL4XB+hy7ilyVjqef3KGIPL1yWK1lKJK4rz6MOMYc9VX2aAjaZe?=
 =?us-ascii?Q?y83deLFIhAwTUNPw4ACLhBVunWg+PLSQNVMZBKe21lXlAQBxQ3iENYdFgvuJ?=
 =?us-ascii?Q?lm00bGLOtkgfl+4esrh2V82XOHpaswIdG+r1Wr4LSTDtDG/IxnVrbt5Wp3of?=
 =?us-ascii?Q?7GnKCWwsnS8/AG7vCkA4vN/C4FxwIpGsH8g0K/cyJROwCkewUfyxafj8ej/e?=
 =?us-ascii?Q?JfZoCRqomZfmgkkCpKpsdcltpI0PN4mOCyerTIUHDR80dItQruJWPwauNjpW?=
 =?us-ascii?Q?+AtkrjDcn5tlfgTaw6nx9D7XgIyPeOTN4DaujkinhDEiar40tSmKIJK+f5ZI?=
 =?us-ascii?Q?5W6oJZciENPZ92srnuIiw9Rkq+nnM8Dl1KX9v/MaPGsqPKkJzBnaWgB+3rUg?=
 =?us-ascii?Q?/M/+KjVGvUkt/AxS0camxz9KoymMn9J4xgik4nFNMfXwgnCx67cG/BX7NYTj?=
 =?us-ascii?Q?U72SU9Vh3v5UQwL3KBQ2HLDi/b9XVaEpX8RIB3SqK1SWoIn9yZflG6VqFOcc?=
 =?us-ascii?Q?amOcLduJrR61xCiziIen00mXZ2wtCOwTA55cZ+zvPzdP+Z5+VTf3LAxeGsM7?=
 =?us-ascii?Q?Va6nvj/KtE+TuHi9I5yqpp2FQj43SOHj0fQZPI/sSIKCVoGGXQzgO2f4jxhj?=
 =?us-ascii?Q?EasC+Y2mJvDs3HGF4wONPYO2hoFF9OhZmElLMhg1RUtvNS8fKHizKNu7cWzx?=
 =?us-ascii?Q?vMJc3urf9CZTy7ihAX64K3DL618T/MUWMz4dwaxf/X5LE+81gtzAvrX8A8KO?=
 =?us-ascii?Q?P+HoshLqOBtjnJTE1cPUU5nbHWewidzln400vgTEE43smx5Xl6dxuiF52eXg?=
 =?us-ascii?Q?m84etc2GVB+XRRZN2ECjtyAZfn6+y+7xdRdfyTWz47gsQIxX3v0NMacv0oiG?=
 =?us-ascii?Q?BMXcRuhe01jlNjiPeQd3LX9L/OPCb3MSkTqBTY9pRj2D901hcMtUEou71HiH?=
 =?us-ascii?Q?hhJ5tqhL1kD0rJ4/eCB8aJSpEWstHh/t+tyZXicu6iykQeweJi9SlxFEonyV?=
 =?us-ascii?Q?cbZkwe5OT5ma16kC2zF6OCfZdnfZX70K85HSvB5kH78MIxJsAuC0N7hFxNCj?=
 =?us-ascii?Q?SVKSXC6WqEWpqGxX23R1H9xGvU1jF4QCGBi7SHMhJVB1IdeVJy0z6rcWiNoC?=
 =?us-ascii?Q?IdStKfWhoTW58mGb/6LobkIxqX+l5TXr4piqByoUmHwD8fv+YyhvTnuyO2ha?=
 =?us-ascii?Q?S8TMJmI9D+ymX/0KRzyA8jbQepJCVsnl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KabtDzMRrg3qBpJ28sEn0tkn/nIUxoEz2G+cM3Apc/s+Y6XJSXsDikSJsYWf?=
 =?us-ascii?Q?wQaCvm4lq9DuUOPgYvTfWGvyhp+tUA3IdbVoVGXPlk6LJwR4pjrhLLWYymp+?=
 =?us-ascii?Q?4ZI2g+lIo6B3YpSci7wbO020ywEQOCJM4ljRhcTQo1/Wz5b7GqiiRFp+j0bl?=
 =?us-ascii?Q?lU1sQ8AsVRFUNdj0EZt3jjvZdjv3nb4Dfxre6enVsYBnb0/cg92PA6Kw21SY?=
 =?us-ascii?Q?kM7ysZtXsetktC4U/BpK9RXperWRiUCmPjuGp2QndMNIcZQnEjRL8dW+F2sM?=
 =?us-ascii?Q?cdfFnpNnzwyMeYVq5uj9VLH/1D/QeaffvWkOXNkMqMdJQ2cw90L4Oo7S3Bpg?=
 =?us-ascii?Q?vCtTIXcwyxPEO81PyXs98EiWHsqSJzFpvzvcvYwqgnAawy6K3BKmQ1RMeAf4?=
 =?us-ascii?Q?40ixKnildMJbnJD51EN6iiQ3RcN8lEKmXu6gQTQpEFWcOZrZICVZn8nGn6RW?=
 =?us-ascii?Q?Xy1Go+ZVgBzaIy4CSJXcNdYik5xsaThZU6H8GDFMBc3esqYDCORzIXcMVeym?=
 =?us-ascii?Q?nXZZxa9OBwVDIXI9maY4u9goH28P9vZ0qS4AcBsxAysJl5zMAOLqLKg3q+Oi?=
 =?us-ascii?Q?RJUkBg0f5tq5m+vezIdPtwve09B7zzf0aO17Dwd80+QictdV9EEIb/V0bcTm?=
 =?us-ascii?Q?eggY4FEaGOT8gjU2cUNz5k4S1aOeflG8URX9ytkSmtwmBXLiRtnalj888RjW?=
 =?us-ascii?Q?YvruvpLN6q1Ni4Cz1rFZH0NFQ319HSu7OxdDEDPTdS5O/drsjX4Iqt1Fou+2?=
 =?us-ascii?Q?s/W+rwnt8/eFvvFNpVsnsIfRtOl/b/kiU4c5kCXOzDqpMDW2vNLVbi4SMPrd?=
 =?us-ascii?Q?75ArR+IM4600iW4n5KuImVe+yj74Oe1pJg4tgjUhKkPJtVoW91GbAVYYThMm?=
 =?us-ascii?Q?CcsNoIVqUT7lt09CY/uMtlQu0JaTAKMCQdxD0jMtDB7TnJNDSGfYWQw2Wydz?=
 =?us-ascii?Q?ncP8NX+0fZwgLmiCJ8DsimqeFQbLicbg06hwUGpLp30nin4tHjSpooOZHa73?=
 =?us-ascii?Q?5Rd2Cy8o4g6AUkSmLV/4d7CXSTm4PAc2o7bUGOy8HfFQ/1p3pb7yjcWmgIiL?=
 =?us-ascii?Q?HxE55J5LbaDDg/8rkwZ1vyQ01nje8fJCCRzwJ1OCO8aKYDQo5yLt7g+G09Mw?=
 =?us-ascii?Q?xHkVlsnpOjqRMxA0mosCMYBWj6TfR3Ck4gp3o90Qp++Os+XWoZmu5OPtVkF0?=
 =?us-ascii?Q?k1Ofcy6tBIPNVX4VtqQaHMgGj5qfkxq4VD8BD4CaNFoOS+KCYVSm/h/CgYjg?=
 =?us-ascii?Q?TaV0wm+44RNoPg1YrMPBWQA7fs39rsDAxYk6liWXgi0Dt9+8du5BhTkM7Mwp?=
 =?us-ascii?Q?X669alaQKEG2oHcpziHL2aWl+zFuvsc4Up7p2ropUM4loTrHb69Rmfjs9nko?=
 =?us-ascii?Q?uRsqXQCW5wptAGNWfMiqK8Ik+ALDBswiuEpQza3KeUzaqqk55m4v/IXaD/yq?=
 =?us-ascii?Q?+4shZJNhhSYZLOCtC5YbrGQ5COT7rFTzjxveya1FD8qaHfowA9Jx6eOq8KHz?=
 =?us-ascii?Q?e7n8sMkjCC2XFLtc42ymo0UBCW46mIvHatA7Xlugx2KnmLTYc2so38LgIZ8L?=
 =?us-ascii?Q?0YcRBQTWSA/mVWg/2G9oBcFh6w4AnWwphdotyPD2LsHQBZUokHhBS6yIY2Ug?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4029604a-9f6a-4f21-975b-08de0c0d5f00
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 17:07:50.3534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZxc0jiA2t1sq7lItB+s8eO5cDpSgUqL3cJI3G4Ytz2Wh4NgEVNxaLBLOHSe7jS1CGVIw3U2FzQ9p7EldXNDCk59XzzNav97p5f8Tpi2PO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
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

On Tue, Oct 14, 2025 at 11:07:05AM -0700, Matt Roper wrote:
>On Mon, Oct 13, 2025 at 08:24:52PM -0700, Lucas De Marchi wrote:
>> From: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
>>
>> Current implementation of compute walker has dependency on GPU/SW Stack
>> which requires SW/UMD to wait for event from KMD to indicate
>> PIPE_CONTROL interrup was done. This created latency on SW stack.
>>
>> This feature adds support to generate completion interrupt from GPGPU
>> walker which does not support MSIx and avoid software using Pipe control
>> drain/idle latency.
>>
>> Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
>>  drivers/gpu/drm/xe/xe_irq.c           | 4 ++++
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> index 7c2a3a1401424..9c46b5fb81412 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> @@ -82,6 +82,7 @@
>>  #define   GSC_ER_COMPLETE			REG_BIT(5)
>>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>> +#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
>>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>>
>>  /* irqs for OTHER_KCR_INSTANCE */
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index af519414a4297..e01b158895342 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -150,6 +150,10 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>>  	if (xe_device_uc_enabled(xe)) {
>>  		irqs = GT_RENDER_USER_INTERRUPT |
>>  			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
>> +
>> +		/* Enable Compute Walker Interrupt for non-MSIX platforms */
>> +		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe))
>> +			irqs |= GT_COMPUTE_WALKER_INTERRUPT;
>
>This bit only exists in the compute engine interrupt vector (bspec
>62346) and render engine interrupt vector (bspec 62353).  It does not
>exist in the blitter (62345), vcs (62354), vecs (62355), or gsc (63341),
>which makes sense because none of those engines can run compute walkers.
>Should we be making sure we only try to unmask and enable this interrupt
>on supported engine types?

right... but then we also have similar issues about being lazy with
other bits as well. Checking the other interrupt vector structures, bit
2 is not defined for them.

I'm leaning towards we are being lazy in the programming here and this
is not currently a problem. Then we can refactor this on top to stop
being lazy and make the intention of the code clearer (e.g. I don't
really like that use of smask/dmask because engines are bundled together
in a single register).

Lucas De Marchi

>
>
>Matt
>
>>  	} else {
>>  		irqs = GT_RENDER_USER_INTERRUPT |
>>  		       GT_CS_MASTER_ERROR_INTERRUPT |
>>
>> --
>> 2.51.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
