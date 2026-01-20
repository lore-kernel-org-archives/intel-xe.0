Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A1CD262AD
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 22:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9B010E186;
	Tue, 20 Jan 2026 22:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkNHg0Dr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB5810E186
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 22:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768947630; x=1800483630;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1NWZavNXr6h9mF0Lvg0J0EwbH2dkpInM4MssmlsDtjk=;
 b=YkNHg0Dr6KySBqjEO1AYO8xyvlW8Bzj0oW+KNYfU6tCJU44PEG//PB+g
 rCl0E9Q1D4C0DcMCKScmZvht4OHg5XBkhqkW59kiGC0l08tOZCSn687G2
 6o7aWpTXafpBfWIX493/lGbR+/d0NwUbMhYqNbWOZzj5yQc0zH4pJF1o9
 +urVM84aAiyOPGA7WlL42K8mxHAjoltFMxuKwt8YU4p09afSMgdATL3cO
 qc9QERPArJrSx1xlAVziu4EYbC6ujWVswWuJXm/fMbXII3vXJML9AIRQC
 hTUSR1bKojZq7/T0VMLs7GVBsfUF5J0+8xEGUX9ke9WK+j2f6Lv4yn+tx w==;
X-CSE-ConnectionGUID: gtQHMUmITquCSE5+qsXFsA==
X-CSE-MsgGUID: Wi6I8u4BQFKxMIL5iSp+aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87747841"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87747841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:20:29 -0800
X-CSE-ConnectionGUID: ycpa2EerTiW4FhQyF7lbwQ==
X-CSE-MsgGUID: WtOvKyepRnOcCHFzfJnqgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="211260812"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:20:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:20:28 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 14:20:28 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:20:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQ7eBSryUre2i7JyM91MB7qkQgW/43yXKDg73R+eFbvq+C3WisBgRcnTFbEMbU+wruG1BhUO+szL9AzfmaWXnNmKvyF5aggI6Vxf0I4u6Q116gc0LEPpd9g+QDazob4j+aD32ePetqCOm5Ps9VnfrVgR7faZkHiZuRDmKLxauSZpiYQ2CLBxPfzyBnQ2YmDJ2IEFJOthm0vI7reLQ7ptm0mNsDpYBujkYEDlJfYruSJ7waPML8uy7wU5kuJXief0aTRlufJPGHYr6t6RsM33IOanT6oi0YuRTIH1qCg4Cz32RuMbSo78d9oQ0Z4y1AaW1WGhyvTVASrFHkjm9NevIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzES3qR22X3VSo8c3aLUeqJwM3ro95QeJz4yV0/SA5U=;
 b=UKZydBqynJCmGcUAWnJ+FLkwubJ8JI8n4eUOTg/VOQfoMxOS3kOoeNzEQhxvvydYrBiNDTWx8l+gQJUpRrh6Bcht//v5vExlw2s3gS0VYQEIdg++7FMy+/z3cBeSkb3Sri7JOZKqZas0Sili07JBaYt456GjdIPBWzAielMYcT7yJBrsjBk2hI9xaiMkPPgQSlUommhltK/j7CFTVAWvhSXnkNrnedbdFojFaCn36BkYVne4N2QfAseAgTc82TtB4HtN1dvlB0Gq5clBeg1Exzz+aPmkHDElm6pMAxPKhUMB6GrUOPWttSBhtQJz9SwPIGPqtO23Fhx14NjmHCpwNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 22:20:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 22:20:25 +0000
Date: Tue, 20 Jan 2026 14:20:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 06/17] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Message-ID: <aW//pmK8UIGNxfps@lstrano-desk.jf.intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-25-niranjana.vishwanathapura@intel.com>
 <dc27df4f5351345d6925db872390f3b290909fb5.camel@linux.intel.com>
 <aW_uP9eTH76NHPKZ@nvishwa1-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW_uP9eTH76NHPKZ@nvishwa1-desk>
X-ClientProxiedBy: MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5f7420-e377-4d6a-ab2b-08de58721bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LeZtVyYqDjImf/Bu/E3gBECOq00RnNobuWcPVsUOrnCTYqgOqBq2Hlslmw?=
 =?iso-8859-1?Q?ZmNbrHLJK8pa3duTQUNMMCJ0QyqdYJyE8gN2w5SU2/cv6Cid1fPLC5kffp?=
 =?iso-8859-1?Q?E5qUWDqV9zBiuBK+qy9/ALMXt+iQGP4wky83NBLIE0xGHI0K71goIb59JA?=
 =?iso-8859-1?Q?jnkfuaOiME/upHNBoksycXQF056Do5eqiecuWKwqxJCbFgclwEhZxvndMW?=
 =?iso-8859-1?Q?x3jEA64dY651cdf+SEI31thIgqTaHLFoqhV2QJVj6p3cu9TTrka70RPPMG?=
 =?iso-8859-1?Q?iEdqBk+5SJejUglKtFXqf0VDRJ4WF8X79GxR+dVjvQcxfQ+i/TkyakRKY9?=
 =?iso-8859-1?Q?6v+YKIGAqFL9gQTVkgJw8bqodeYx471SuMiKV3RLMfmjrtlhs7CS9gXuyo?=
 =?iso-8859-1?Q?f0GsLeyaMPypmiqh1qirHSxfIhajmkmn/C+j2+s+oj47ib104h3t+FvVzc?=
 =?iso-8859-1?Q?ha/vx0oILuXOhhPU8Gd/soWiY/8UNDRnR/3ETeTxj6VLss/hhTrINwNrhv?=
 =?iso-8859-1?Q?iuiQ1kVG2lJ2weBmQblkz8AUaG4bvwPka5/Wj/3Fi5WhlzWJeznic64BaW?=
 =?iso-8859-1?Q?UfuzJ9JT2o+3pU44gYvG/qlo9uLxqNBlvKjEnDNKXlrIshAXOgTUsOfx1M?=
 =?iso-8859-1?Q?UViOa7uXhf2pULmi0R6qqEiQXmwhFGzlVvRNSrZOVhvS9a9g6yOQCedrPB?=
 =?iso-8859-1?Q?QCfaimwrDfphjkU5h+QTbnXUbiDuFDRnsHogH0KmotNO/2JgKkCBeDj2Nu?=
 =?iso-8859-1?Q?fHqNADRCR0A48XGh+ExU328+iYxSDU3EKSMrU1VbPVfFT/mn7PpW5c3UTc?=
 =?iso-8859-1?Q?Gdy7F+GjhWfb7wPwkdsnIX1ynAY5GTxmJUxqfwyXcU4MvBMWTVfh0GVZCM?=
 =?iso-8859-1?Q?G1F0nHsaoNDtaSjTWmTTkQ7LJ4kx37YlBDD5Di7fK6f4V6WHuU/0ypd6DD?=
 =?iso-8859-1?Q?pFqT2bk1BBb3gKArQ2XpnjeVMxbDh4jsrXOYvYiu2nuogNc785oWqhssw9?=
 =?iso-8859-1?Q?Qh1IfseHUaksehyYuDoIgD+iFBix4CxN+HABk5MDjVlm6xwF6yf6Inltba?=
 =?iso-8859-1?Q?E9MIHQUYwQpkw7j0PgH4ECa/uA1K3bLeXMrwK2/kwQiBkTWhfoZ+hy1UVT?=
 =?iso-8859-1?Q?W4yuDypkzhb7MO2iKQfFxnt2VCtDsmLVK7dZJQtKGFBKifW5xdpEeBikIH?=
 =?iso-8859-1?Q?yDatiigYRRRvHjArNEQLLYSk/fj67SWH/jLcSodI808nxPDFzVRYf8LGYM?=
 =?iso-8859-1?Q?InIugX1Ui8a8x8rDyvbnsuFgVKd5MkB3zuaBLU+8juklQzsetn7tsg5LIf?=
 =?iso-8859-1?Q?5GEGHwO2+BPGcd7DrDlfr+g7oS5ODVwnfX0a3qDxaJnMvm5g0ErqwRqSoS?=
 =?iso-8859-1?Q?5cgH/mBO8kHAeFS509rpRNQAu9VX7vFePusRxcrD06lfLBVu2UgmwJtuqJ?=
 =?iso-8859-1?Q?gol07kjGVOchJsgAOvnAiEdVqwtT8FoN+mBgY6w2lMx/1CQpPv+qvkENCY?=
 =?iso-8859-1?Q?lnpSUDPfV03/efx7KXw5OoFYro8+LvFie9oze8BzBLBHiw0dJoiuFCLjqt?=
 =?iso-8859-1?Q?cAvhA4ftYeRchdYA7PImxVJLsDrn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PyxjUsw3slEPhr/JLL6+gw36gce0kXIHDowg1MZGqT8O7/9VqNbizgwCTA?=
 =?iso-8859-1?Q?Dkrnc0e1WAnxhlwlUF4BNgXySMMEkJvKpDlgy8zIOdOHk/14jnFcJC+RQs?=
 =?iso-8859-1?Q?vvbOP3N3lxleKbNL2flN+UIqmB+YRVycW2vDH1A7578AJH90HT9IFhpxrD?=
 =?iso-8859-1?Q?3FtI+1OKYyFF4VGQYr7HPshZx5FSA5t8yPoSyyFn1eoUVeHTVLUevNZ2N6?=
 =?iso-8859-1?Q?lgkrkglthbnsQA1gmPDLGDs8gO+h9tRayp+QSZXkKcikBEWNz9pIJpnFXA?=
 =?iso-8859-1?Q?oaYHQQkpBaJC67+AKZgnSA8/AfL7iVSooqKQv/3cqDFM28yRjfhSd5Sq5z?=
 =?iso-8859-1?Q?LqpQ+rnHX8VOwtPOeLxumswjo8zj1neUW0rUATj0dX7cBeZ/EwKv7dN/vy?=
 =?iso-8859-1?Q?J5OVx1U3AxlDLJ72TPGI6elMM1P7UeGATJsm6D/S7CysE+qMh5j/QUgYYY?=
 =?iso-8859-1?Q?iJYVF6EnNlWUKEWX9kHRUZJDIDa1PaFWC5gn2nMPHcyO1pmtuMfVTm4D0J?=
 =?iso-8859-1?Q?0ksmkpjXreb3ABp/RwyodsXb8ERVOXmdNlcjNylKf96iuSqgW8o0SMVr0A?=
 =?iso-8859-1?Q?qz3YjCr5JfWF6H8E5RrEF8e057j+TdesMNGkXUkvO2K9wBXjH9BF+TKi1b?=
 =?iso-8859-1?Q?LV5xuj/2FU29IhEMqWIX0FzaQhHA1fsWLUYQw02ktpoV7gMzbEgMm5JsOE?=
 =?iso-8859-1?Q?Iyj7ijke4owcVIGoYfwKnJW8RNkJ29osadKkfssZcvwLHF0aCwbCLNiLhv?=
 =?iso-8859-1?Q?IdG9P50QB5+I5Umjz9fQ2lqO7pgWnaSTFtPTDwSZSPkfzxR3BoPbGIUsZM?=
 =?iso-8859-1?Q?TiWrR4POg+GJyhvRLLXSVSh7X48Ig47cCfbiQanCHYJhYkiuJ4O+rwu769?=
 =?iso-8859-1?Q?NonSwjZ0L4x/P5Din6IbqF6l+oPI/uYQ0VT6+YX6LmGECce7rcSkv1l+j9?=
 =?iso-8859-1?Q?faR7Tf6i9TbDf9czIK859CYpTQVVFzQdXo4tM+J6ftCpLCw/o+m0+T5DmI?=
 =?iso-8859-1?Q?k2Va4QTX6P99l79s3mKJ6vp8E6l0ETQpCNK7FcG9aQK1Ud0uOcrHjIiD/X?=
 =?iso-8859-1?Q?YxIbTLyc3y0vd1r/y5VdGkihkQ+tsDj8Sd/ePrRdYVIcVfq1a25V5Y4OQm?=
 =?iso-8859-1?Q?jKc6b6Kchielo/ywZ6l5E2mZ0vObAKbod8lQJB9v2VJkoA7G10QyfDeOJT?=
 =?iso-8859-1?Q?Ek7RAmLFYnq5CUThthpmKyp+cq8INly5mdOfkWoVGYrHZtfkYRFXcrmTUU?=
 =?iso-8859-1?Q?OmdxdXDbFelUVkbZZEq2Vu51qnloaEQpCSptKlIXou6l/p1J49l4Zj6fcs?=
 =?iso-8859-1?Q?1jQTHgZUHZzeYLhrdZwMfM+qitzbz6+VoYrZ614jVH1zIfs4Y8qv4dw7fH?=
 =?iso-8859-1?Q?xVkpM3mfFo9lP1vOj4k3r2jn0YBiuO3x3esHLj3MD834maOthUMe+SZr2W?=
 =?iso-8859-1?Q?0JtpG0HHMrlbfSYkIrbPk3XcK15IAH74iQbKRyTfTO+mJgQ8tCuXh/M5Xq?=
 =?iso-8859-1?Q?SCPkPC7/AaSAMd/tiGoq0dneZZKFwGgGAnqzknFafaXGeV+LMqwwdwJ9ek?=
 =?iso-8859-1?Q?mVHm30dMNUNobRLbg3wgHnDqKdLhKK0R0UWTiQOJu4RbLw5pqM7nZHguRc?=
 =?iso-8859-1?Q?LZQRFtR9IJo48xUDmVH1i7Ug1jVNKZnO+eK5EtBysv4sS6bgRcDiHdKFjn?=
 =?iso-8859-1?Q?vEOtfHunHtp3JowNRpJbIJNY1DiQI/HFhntQYORmNj0GTCv4la80iSZbWv?=
 =?iso-8859-1?Q?h5m2DTfpE8qRvpRv0fwcrpifGlpomm8jjFU0ZoYFIb3gqb7UldLU9T0SeI?=
 =?iso-8859-1?Q?NvblJn6RldffsgYPmAOCCu+zg34IvhQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5f7420-e377-4d6a-ab2b-08de58721bdb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:20:25.1499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UleB6B+3EVRY8/11qFM53M53dBg7OGGvoOMtntiarAeSP+HdNXgTp5T+x2P4KmwxORhV+MuuqITK+eCFjl4fxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
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

On Tue, Jan 20, 2026 at 01:06:07PM -0800, Niranjana Vishwanathapura wrote:
> On Mon, Jan 19, 2026 at 05:57:29PM +0100, Thomas Hellström wrote:
> > Hi,
> > 
> > On Wed, 2025-12-10 at 17:02 -0800, Niranjana Vishwanathapura wrote:
> > > This patch adds support for exec_queue set_property ioctl.
> > > It is derived from the original work which is part of
> > > https://patchwork.freedesktop.org/series/112188/
> > > 
> > > Currently only DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
> > > property can be dynamically set.
> > > 
> > > v2: Check for and update kernel-doc which property this ioctl
> > >     supports (Matt Brost)
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Two questions on this patch:
> > 
> > 1) I don't see any locking to protect the exec-queue / lrc state.
> > Perhaps I missed it, but couldn't this blow up if someone runs two
> > set_property ioctls in parallel on the same exec-queue? Looks like at
> > least the set_priority is doing non-atomic RMW assignments?
> > 

I don't think we'd blow up. At worst q->multi_queue.priority would race
between a set in guc_exec_queue_set_priority (parallel across queues)
and read of that value in __guc_exec_queue_process_msg_set_sched_props
(serialize across queues). Eventually we'd stablize on the most recently
set value in __guc_exec_queue_process_msg_set_sched_props.

> 
> Hmm...I think only checking and setting of 'q->multi_queue.priority'
> in guc_exec_queue_set_multi_queue_priority() is a potential issue
> (as the rest is handled by message handling queue and guc ct backend).
> I think we can fix it with a simple spicklock in this function.
> 

Hmm, I'm not sure what a lock here buys us as if two user threads try to
set q->multi_queue.priority we'd never really knows who should win the
race of saying of setting.

> > 2) Do we really need this to be mutable? In i915 assuming that lrc /
> > context configuration could change created horrendous locking
> > constructs that were later fixed by making it immutable at first
> > command sumbission. I don't exactly remember the details but do we need
> > to change properties after first submission? If not I suggest blocking
> > that.

I don't think this is overly complicated here given the actual queue
interaction with the GuC is serialized by the DRM scheduler.

My thinking is this patch is probably fine as is, albiet a little
harmlessly racey.

Matt

> 
> Yah, ability to dynamically change multi-queue priority is a requirement
> from the Compute UMD team.
> 
> Niranjana
> 
> > 
> > Thanks,
> > Thomas
> > 
> > 
> > 
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c     |  2 ++
> > >  drivers/gpu/drm/xe/xe_exec_queue.c | 35
> > > ++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
> > >  include/uapi/drm/xe_drm.h          | 26 ++++++++++++++++++++++
> > >  4 files changed, 65 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c
> > > index 1197f914ef77..7a498c8db7b1 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] =
> > > {
> > >  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
> > > DRM_RENDER_ALLOW),
> > >  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS,
> > > xe_vm_query_vmas_attrs_ioctl,
> > >  			  DRM_RENDER_ALLOW),
> > > +	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY,
> > > xe_exec_queue_set_property_ioctl,
> > > +			  DRM_RENDER_ALLOW),
> > >  };
> > >  
> > >  static long xe_drm_ioctl(struct file *file, unsigned int cmd,
> > > unsigned long arg)
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index d0082eb45a4a..d738a9fea1e1 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -790,6 +790,41 @@ static const xe_exec_queue_set_property_fn
> > > exec_queue_set_property_funcs[] = {
> > >  							exec_queue_s
> > > et_multi_queue_priority,
> > >  };
> > >  
> > > +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void
> > > *data,
> > > +				     struct drm_file *file)
> > > +{
> > > +	struct xe_device *xe = to_xe_device(dev);
> > > +	struct xe_file *xef = to_xe_file(file);
> > > +	struct drm_xe_exec_queue_set_property *args = data;
> > > +	struct xe_exec_queue *q;
> > > +	int ret;
> > > +	u32 idx;
> > > +
> > > +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args-
> > > >reserved[1]))
> > > +		return -EINVAL;
> > > +
> > > +	if (XE_IOCTL_DBG(xe, args->property !=
> > > +			
> > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> > > +		return -EINVAL;
> > > +
> > > +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> > > +	if (XE_IOCTL_DBG(xe, !q))
> > > +		return -ENOENT;
> > > +
> > > +	idx = array_index_nospec(args->property,
> > > +				
> > > ARRAY_SIZE(exec_queue_set_property_funcs));
> > > +	ret = exec_queue_set_property_funcs[idx](xe, q, args-
> > > >value);
> > > +	if (XE_IOCTL_DBG(xe, ret))
> > > +		goto err_post_lookup;
> > > +
> > > +	xe_exec_queue_put(q);
> > > +	return 0;
> > > +
> > > + err_post_lookup:
> > > +	xe_exec_queue_put(q);
> > > +	return ret;
> > > +}
> > > +
> > >  static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64
> > > properties)
> > >  {
> > >  	u64 secondary_queue_valid_props =
> > > BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > index e6daa40003f2..ffcc1feb879e 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > @@ -125,6 +125,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device
> > > *dev, void *data,
> > >  				struct drm_file *file);
> > >  int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void
> > > *data,
> > >  				     struct drm_file *file);
> > > +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void
> > > *data,
> > > +				     struct drm_file *file);
> > >  enum xe_exec_queue_priority
> > > xe_exec_queue_device_get_max_priority(struct xe_device *xe);
> > >  
> > >  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct
> > > xe_vm *vm);
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index fd79d78de2e9..705081bf0d81 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -106,6 +106,7 @@ extern "C" {
> > >  #define DRM_XE_OBSERVATION		0x0b
> > >  #define DRM_XE_MADVISE			0x0c
> > >  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
> > > +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
> > >  
> > >  /* Must be kept compact -- no holes */
> > >  
> > > @@ -123,6 +124,7 @@ extern "C" {
> > >  #define
> > > DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION,structdrm_xe_observation_param)
> > >  #define
> > > DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, structdrm_xe_madvise)
> > >  #define
> > > DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS,structdrm_xe_vm_query_mem_range_attr)
> > > +#define
> > > DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY,structdrm_xe_exec_queue_set_property)
> > >  
> > >  /**
> > >   * DOC: Xe IOCTL Extensions
> > > @@ -2315,6 +2317,30 @@ struct drm_xe_vm_query_mem_range_attr {
> > >  
> > >  };
> > >  
> > > +/**
> > > + * struct drm_xe_exec_queue_set_property - exec queue set property
> > > + *
> > > + * Sets execution queue properties dynamically.
> > > + * Currently only
> > > %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
> > > + * property can be dynamically set.
> > > + */
> > > +struct drm_xe_exec_queue_set_property {
> > > +	/** @extensions: Pointer to the first extension struct, if
> > > any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @exec_queue_id: Exec queue ID */
> > > +	__u32 exec_queue_id;
> > > +
> > > +	/** @property: property to set */
> > > +	__u32 property;
> > > +
> > > +	/** @value: property value */
> > > +	__u64 value;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif
> > 
