Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4143BCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 14:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF72310E11C;
	Wed, 27 Aug 2025 14:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Agohxoom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA4A10E11C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756305817; x=1787841817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VcfSBsZsjnyptI0gWDR2KxCRIsD9FJO1JnnLc7snf+k=;
 b=AgohxoomKVdDGtD0zYxtyTT/07ffuGgxyFd2DfrCrhZ9N9EyB1gquXV4
 Er9ZSSB/0atkKQpNXDSv1DdusHJThzq7e6WS93urNoYF8xdUIqfD1u9j4
 y9U6vJxYRwljjEteXmUgWGPczDprCRtrN+XUBhjIyBZKYHqAzmqPQ1RiY
 2H9NvyQnv4NRHlM1eIhRwiHo5ljj85+d/dkRhmP/DVb6OwJTfwxP8x65e
 wi17ht25ZXHylyYi3ykB0V4tCQNyztGJHoHC2KZ9DgHk5diZ2LDv9gec5
 tvrfyF+kkE8ELfseOTDjNKhxFnNXroy7OfRKiZq3TfRtP7IlJoBszvX3i w==;
X-CSE-ConnectionGUID: rq1WevlmSq+xoqGpZKtUfA==
X-CSE-MsgGUID: yTfcfLh5TJuNV2hg0jUhBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58268923"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58268923"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:43:37 -0700
X-CSE-ConnectionGUID: 8wjRsz3oT8qtO3n68di4+A==
X-CSE-MsgGUID: 3y9NP5skR328r5SfY88qsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174019632"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:43:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 07:43:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 07:43:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.43)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 07:43:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Prhxwy1Nh/s/J/QQpM/7f2I4Cn6YNX3B6q8VZMvLBFqZTjnfAbhX1UdGkwjdiWp6kk2ss9bpo0D3hCnJEFIzbY4vHftyKfYK+fVheMEA6mmUzxk7Jdd4Yj4xK6T4fJ47W+WwWjDDyhpkZo9vZSG41wniQrN4RUHBQka/Zzmz0Vv7U2qLRfBCvPEXtoKVyC05jVAWrlIB+kSsMaNyuvCh+EBGZ7kzIwslYKmDwpFec04rsyR4S3/Qz0zwA7U2hP7//ZESli3QJbxmgIlUINSQNLN+sUPVak0IYnajFXxoHJ+ZzxZwIJtiuxKCUFFT2akE1z+ivH+3x1veQ6bXphKZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyFZh9W+Qn58d122vrS4Hl1Vp0fA/sMfV3SOJY2vM+4=;
 b=SwJUy0ioLgaLVS+rRddP9YUlGFnB3x6KKa+/ezmRM8WUQZPvjIvvno7uzjG+T62vfLjjUXI9Qs6OrqxKcofjcursStZZg6sser9rByResi9FamWigdkKAic9LgUPAE0TjQ0vVcZA0+5KJoQCdNi9XtAcCNSk0kmopY3rl3QVBVX5SO9KLaTARVtl6ABUNBns4qr1d0WKR1WhVPYaAnKn6kWlYtO80nel5YTmSmVnd9/Y0XTThMBH3AD+trHlMkee5SwmURwkou9ZSg4ajNE2RBfOGLRJ+v9yMF0rvymCWC/TUbNKDcAiqHRLOlKiExgTOpsedGWooGo9WgpIXklQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8000.namprd11.prod.outlook.com (2603:10b6:8:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Wed, 27 Aug
 2025 14:43:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 14:43:23 +0000
Date: Wed, 27 Aug 2025 10:43:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: PCODE Mailbox failed: 1 Illegal Command
Message-ID: <aK8Zh_H15feuB4cv@intel.com>
References: <531fe019-eccb-4cbd-a60f-9e2241a73c82@hogyros.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <531fe019-eccb-4cbd-a60f-9e2241a73c82@hogyros.de>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: b59253f3-85e1-4d82-6711-08dde57812f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uO4FOYoLbpU/GWAFRaFwVoej9/Hj6qZeTewd6iy9huPgB8SLprpQrY2l6w4l?=
 =?us-ascii?Q?52dCVja4rtgObCG5DYf/AgGjxFkiRMPbXDhElSRTOPhN/h1TPcJgWzYVtQae?=
 =?us-ascii?Q?djovzcECFdXs35m429QPO1qWgXv2/Tm+afMSGb1nDFV4tTYLdNsMc8BQvFMp?=
 =?us-ascii?Q?/F+kbVj+SJzIK53v7IqIatqFnBE+z+4CY+SKI8pKrh3duTrLcptpzN6vVf1C?=
 =?us-ascii?Q?NT5Dy1snoVI5FVzjQRypRU8Oc2uSDqSi2FYgDv7emFqzkjd+mt+Sq3HFn15o?=
 =?us-ascii?Q?ck4c1sYxPQaUGYbv8o24rH8g6Q2ZFeLmOz8WvA6jOwn9TzJjG6em9QCrcB6p?=
 =?us-ascii?Q?RyRp2B+uIwJ+5SBIau7gkv49Qfbv/bS8WZa/lYSMbZPIwQhV4gII5/0lCEc+?=
 =?us-ascii?Q?1QVRwB72Tiy3SnSmZL6avLrzjp+SLV+asD4B3VbB8NrweQ7XtdYdD3k6JyAu?=
 =?us-ascii?Q?T7CInvubNhVRAhNKe8d9hzfB1N0ygk/Rnu13WMOWyCZm0IX4ytt38aTzzipt?=
 =?us-ascii?Q?r/s/t1+yNrWTDJRhpxdECkjfAvWYGp3Iznn1Hmsjo2eU7Qu9BzrqxYTwdtWI?=
 =?us-ascii?Q?lRnob8I/VTL7HZNjxw5qM5ecivEGwiltdKUljFsXElBbHdxUBW3OwuitsQhH?=
 =?us-ascii?Q?mlXY8u6K8PHnkAheHZruglnCznj9VXu5z/mM8arVGbJ+lStVyVXcmly+ud+y?=
 =?us-ascii?Q?UKdBbO861bA4ku4M2389odg+rzVGh/Ccc+qs6lVz2tIw4XROmXgui0L9OwHb?=
 =?us-ascii?Q?/DYoipf4MhnA29Rlwi+HIb3+gpV8gctt4Age2fNu10wxDpB1fuLTvt37F+cE?=
 =?us-ascii?Q?FIvH9ohM74n6PnENGwyquHT7F+SN/16TRvVfEKsxOfSk51ROnk87Hl17f6aH?=
 =?us-ascii?Q?/JIKf1EvThJgvox9obMfaGGNKScAXMeF/h45Ma5z2sjCw4/y82rPwdSqPe7r?=
 =?us-ascii?Q?w6aoaDKFu5K+158YQ3S8N0Kd2iKs2RS/AaKJV3LJhHRCuAj/qbyKb1gyXnju?=
 =?us-ascii?Q?5a6CkHZOg7fXwJAU+tEwb9RIIwqpW5aipVk+qN10LfN3tvRK+O57ORPlgHex?=
 =?us-ascii?Q?HoXc5UzXpVj6z9shtQwqIz7K5ZRWhTHgjrO5emnlX/6C/JG0hfiJUWrWariG?=
 =?us-ascii?Q?0gh1XJQoMkn7gxYKuVrn8ZVcMR3YIxN6V4qzxcZO+iebaFOQ5JxO5xA0Lk6v?=
 =?us-ascii?Q?F4BS/sDgxl9DQ/l0pFIDP94jdMUsr39iv0XGnHK1GDnMdhIh8oL5c2II52BJ?=
 =?us-ascii?Q?eZHtaLsFVqJMxBmVPOWddz/HcJIVfQZ98ETyhBX9gpQtd5oJ7EEEawDdwgtB?=
 =?us-ascii?Q?KLJXIE6KPJVjGxJZbKqzWQ6DwwGU0PTFVay6BNqXTfRAvc+SNmwgrUNWxv+o?=
 =?us-ascii?Q?ncJsGMM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CouBHyB+ccO0lB9G+aEM603vGYfgaWq745iIdfSi9GUzVgqNbEZ690J/jwhT?=
 =?us-ascii?Q?jNGX2PwI2Y4L8sQt6ZlDmFAnfSB8sRVaQqYRAEsSvoiD7/JrwvNQy+eYyQtz?=
 =?us-ascii?Q?sMbmwpB/qLLfNn2UjNvCYrJkjXaZ0yIt+CwR+wsOdwdYAetoc8DtoYHzZj7p?=
 =?us-ascii?Q?9LR00Th6IcOx8nIEgBgcimIf91EwcHzmWXuZHvPmH4uU07OVKbgZU+0lKZgs?=
 =?us-ascii?Q?vyY/3MM68tBBVwJ35WTJCyIuuE5DOXvdrPE8Ax8OaC/idOGatH96ZvZ+vcBP?=
 =?us-ascii?Q?1VU+rZPi0mVfetArEVCi3LahaXLutvI+1hXqfpEUETceseJDIfSpHMPuptxG?=
 =?us-ascii?Q?69CumcD2vYm0Pt+E+j7ap8fNoGL6IbMjPsZP4VOc6Be1Y0BxO42WBG4qvT9+?=
 =?us-ascii?Q?79wI+F/HpjRvPrMBHLgX64gb08JyhrIRMWsERo9wOxmZgq0/Up0CTmf+q43r?=
 =?us-ascii?Q?jbq8N6PUNEeFtXmbsSoOpK+t55sQdaK8i9c/qNvrTi8i50mJFIddI7UJkC63?=
 =?us-ascii?Q?JmXuvfm0uSlxb82BWt6QAulgnV07wSrVABfy0Ft/SjIiYF8DxorI3oHfCnbI?=
 =?us-ascii?Q?qBHgS2NBIFX0xpJaHjC6Q1ilVM9aWIsveD5xG9CXYBHZnQdWKg5GMNNg2NL0?=
 =?us-ascii?Q?qKPfeTNZdc9S7KvuUzWbdhk1Owl25nMzLBnJkmeYvU2lJBEh0iU8Vh6AR0fD?=
 =?us-ascii?Q?tVo6Bc5Qle8jWnI14uGme4i2/DLVRttKVucjoBB8igKIIOLbx2Iu2/smmoRs?=
 =?us-ascii?Q?JW6XT2v6xy+SOQQnkqZW3+xeS8JBlNUHLxmaTMoyGozvhPywX+MJROW02Pez?=
 =?us-ascii?Q?rsakcR134/t/5T/F9JqcrXADV4jAJ6Nc3oAPUAbBx9ub1iP9MEjD5Xn9tfLN?=
 =?us-ascii?Q?te3berZzEziXV4DF8c3T68bCdZNbS9rkWotu/GWBjD55MurpbUq89gk9j69E?=
 =?us-ascii?Q?NNDnHmriXzagw2PXpKbTexqGV8JjlhjJQpNW8Wj7BpZwcAMFoWL2VyFkNl2m?=
 =?us-ascii?Q?YW8/LmhRGmuQK9fo4DACj+kcW+d34wqmYieZO5RZ1phic17pGQnBc1p4KZrd?=
 =?us-ascii?Q?fQ4FpL6EtzSOoM9ttxTk7NEIQFnP7GOO+z26x7GJ+gUPp0/5mDrGCSZlN0p8?=
 =?us-ascii?Q?9FyIJtkAhQemsbr0YGrvsh81d4WVxeL4cXkMMjy1A/DTTLAtjqQzYWGChVgs?=
 =?us-ascii?Q?UGz4Qdcl8YPU4Mrb+sy3ZNI9JLCSHiAA0KjTT3FIifYJXCEw887zr/LpPoAI?=
 =?us-ascii?Q?ktJzQ96Q2/R2hbhs4KRT09X7ofowVhKZuCidR9D3Z8NGrqN0UVTGueqWz3cp?=
 =?us-ascii?Q?iNnEvCu4Jrmnn0VmTcxXAMmJZzyU/EOOUWSA512ZvLvseFDYCf8MRmCRFkV1?=
 =?us-ascii?Q?dSHoXsErhlbG3CSaDtgGQMelpHHJX/GNfX/jM3/Bk2g/JrO0+/T9q29an2R8?=
 =?us-ascii?Q?y9cvxRd7RSCWk1bg9vXrgOyKpRjTFPVHZh68DRObfmadWpR2I01bXTvWve0B?=
 =?us-ascii?Q?DmMgT+8VS33rdvuBic+QTZ2u3aOok84hIWsk9EGgXXZXazyOh5XR0r9OMMqD?=
 =?us-ascii?Q?2X98VbxfmhYRlJn5JBR125mldneGcfmQNXA49QhC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b59253f3-85e1-4d82-6711-08dde57812f0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:43:23.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2GmMRVYPJPQSkZGUSpRBWDqU1MxCoFlyafvpwuJxojjx+HS2IuHeN//SwcxcOF2Oq0xUJW8JHxQg7Ro9L55qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8000
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

On Fri, Aug 22, 2025 at 06:11:00PM +0900, Simon Richter wrote:
> Hi,
> 
> one of the plans for this weekend is to look at why I'm getting 14 of these
> on boot.
> 
> The returned status code is 1, so it's not the same problem I have in other
> places where MMIO accesses return 0xffffffff, so I suppose communication is
> working and there is really something on the other side replying that I'm
> doing it wrong.
> 
> Might still be a page alignment issue, although there is only a single tile,
> and the only alignment I see in building the MMIO memory map is 2M.
> 
> Is anyone else seeing these and has already spent time on this, so I don't
> duplicate that effort? Is there a checklist?

Hi Simon,

I couldn't find anything related in
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues

could you please report a bug there following:
https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Thanks,
Rodrigo.

> 
>    Simon
