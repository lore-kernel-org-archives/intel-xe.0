Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AB3CA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 20:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DA010E07F;
	Mon, 22 Sep 2025 20:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpTsr3n2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC3C10E07F
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758574367; x=1790110367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xBXdSAtIzH7XX1pYc/zorFXFrqfanke3wISXYOJQT+A=;
 b=UpTsr3n2OPpISH7EjTdm01hFi2j458A2G25SN4+fvckYlkEZh7POaDa3
 030dyjcGFpM4DWWrsSad/5zqYZQL5bCdn6djmzceyEZCgC1nfTF87iELJ
 EA+qiIqGobp6gBDHJYkyYOqeEVn2nkiRTJObG1LJrpZjlADZ4iVVk+r/Q
 X6zToxahGQ/F5yt+t5YW9xn7pDE+xBrnUdaZt5npFAMrQTRX1kpsY9Pwg
 o0ykLfxJ21jkw8ZuRXFyxDM/4SuSnvw28o67+/AB0hp2GYjAU3ME8K1q7
 Yw4YD3AxWru/128wSWm/PahlX2SsjQHzg5yudz3qmNfmAyU/9OxVVvhGt w==;
X-CSE-ConnectionGUID: x0y08QdBQJ2EDNVy3qR76w==
X-CSE-MsgGUID: thUmGOVSRD+GCTlKOJYyQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61011370"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="61011370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 13:52:46 -0700
X-CSE-ConnectionGUID: MirwanvsRKGCAHP4cntSEQ==
X-CSE-MsgGUID: ug3xvaJ6QMKMJHs1kp6Plw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="177353477"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 13:52:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 13:52:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 13:52:45 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 13:52:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn9BpVWkN3hRPpmDaKfnGYPAt583Q8G+0dU8LRwVsTNCz0riQoo9YzGc/8mwNPdkbmGVVuLDdrLA/bXOCP39H9p1WoAKNr0KXHQGZIeH2w6MxofoOEkymrYZkYr4VRR/Fy2nZrlC6EqYB1J1+loBQ0pVA2zL2/+FfFgZEuFrRDggEOHyQpAD7faVJ5E+Ca9vTM8yj7QkxMsl4TWEyn8nKxYbJut3vfpZGbR7g07mEJWV6cRwplab7SPUHyeAcQqMcq085ytUpD2bLaqgTuU9+CNagjaBcb5yII3H9h0BdH707d3LEK0cphhkE5vPuItpmHpxBpIMqmCZK/AiLz+r0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxCzNE2rUNJn8F/rRTSllhCNTT42RJ0L2quIznCX2k4=;
 b=C27n6IyPkruk0pHCXarJ82T1zWoeE80hMqqoMkv52oLjJiDPQ39mX8QIVH8DlmjAs4lUsfVI3OpEER7d898wJlSVntT4aCQizzJT6AIMfhxkeJSeOqKzvMtvyk3w0YTZZ2rlComdA+EofpnEPVeqZrmpJBIHpeaRC7EZcCtSiBo8fINi2L2SOFWFCDpcKVJwllhTQo/43BfNvk7dc+IbSbz4O/CNBB07ZAmRqU85hmC9ZhoyPARzjrer6qVtdB4vnDeTa/sBfy5zhkNvNmKR3MU+j6mleD97HoJBBeQYdQN9eAZFVpRiVTTuSNbWVLA1T7Wv2fB0Pkd/fD8FIoD10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 20:52:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 20:52:42 +0000
Date: Mon, 22 Sep 2025 15:52:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [bug report] drm/xe/psmi: Add debugfs interface for PSMI
Message-ID: <dcfyppphvrn4xq63bqtfi5nd3ipsqkkhfehjdt77pyr2nlfmd4@xfmqlycgi3cm>
References: <aK1nZjyAF0s7bnHg@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aK1nZjyAF0s7bnHg@stanley.mountain>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f4ed4b-76d3-4909-0fc8-08ddfa19f99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1uVz9lNikelo7gCx3EQqp90eB6TjXltYKFjvuYC+fX4qV80xm+irNnqYoj+q?=
 =?us-ascii?Q?ErTT9/Ux2lvpKQ8OQp66uOG4dwAwvUOD7pjttT8+Hf3oov9WdraDAw7ltrUU?=
 =?us-ascii?Q?dMYTeMfnpjHb7K0f7Xyz5wy6/QRWSp3EMHTxvvcPRfPIzPkPoprUF0hCTnO+?=
 =?us-ascii?Q?03LicDpuqVKQMEXIqkSNshU+qxMRVcqnmaQsjK6wiCAHeeIRaxpke8toqrat?=
 =?us-ascii?Q?OLsnSQUZhHURo7N07mIlRGNVbOysCEb/E2X/57G+W6XaPqEqz2QGp8HN2yS+?=
 =?us-ascii?Q?3R5+gVpbfvNFBQvzLLdh6cqxZncJzZq05qTwpud/G7FDx1XIxQcAFAUF2lH8?=
 =?us-ascii?Q?qj0mCdW+WfEfbLcCHCz4pAyZ4YB9wNrbHiJsE80db+BbHYEjaVPpH3JCVaHp?=
 =?us-ascii?Q?SVnYpPOmbvmAsmqdhpVdBEZHpDIj/r/qHInhon1fMj58OTUtlDII15trpyuA?=
 =?us-ascii?Q?moYZVl8NXFl+a7AUPIZYHUJerFfEhlPR75DH5mytc6VP32OT+qs9Hjym+Zzy?=
 =?us-ascii?Q?ayMZY/P5UM9dVNcv8+i/q3GuVdz/EwhFi5CxB380jqJGlwOTnzcyqHtOUE+x?=
 =?us-ascii?Q?bVO7PuWCSPxBanBGKSPRecVVQUO3DIlGLjnrfBQYi424Nj9S59ETOUaOmjKq?=
 =?us-ascii?Q?oJojki57VQRu0kiYJaufwmOyQpXIDjGQeuGyji16hvk+Jjfvn4sEtH/flAVR?=
 =?us-ascii?Q?F+P42ReJmixsCeJKMtHvGG+I9/RhrhFvsgJleq2maRZt/l4R747FHOv5amOb?=
 =?us-ascii?Q?C9St2MNIVJR8ZXjwj29TQUn4o9oZVN6/tyr8frddkQEX9QYQ88l22SEJt0+X?=
 =?us-ascii?Q?sCHyt7AtQlalB65DLuVzXFSqYCg+p+Whko8k2FasJ+kw5xX1t2+M7Jijg7Bb?=
 =?us-ascii?Q?cut4Gn47A0SpqAkXBc3nR93tHWeCMHbaBfw9vAeiNhqNxkS9odMmIwYpnqoh?=
 =?us-ascii?Q?obI6HoH+lozIg1o5sQwkcvcNS1Fsm+UHhWe/VeuC1do5vT0ok/kTg7gdujZe?=
 =?us-ascii?Q?xIeGH8Vvcbzzw0zGMRe/lFQXJOjyQUwTJmX6JsqxQ2RM/Ek60zrt0d6L4AiR?=
 =?us-ascii?Q?kUc0754W3ptGrPeSfz6DdZroEscYj66+wSbh61G3jeNuXdoJGXcGYGKbP6Cj?=
 =?us-ascii?Q?SMltbYExVqKqmDzXdsghLjKE0L9zDyrB+3Abx90OwNyJLBrmY+Hix0axzIkL?=
 =?us-ascii?Q?xtXOAICmbHSj209N5erRnKZoSccU/paLLrGJNGgFYg8N+9KevC9Id/iLrkew?=
 =?us-ascii?Q?O6qhzrLieL31prEQMgw6gXyWSgnGITPTgB1S5t5huS1L4RQDPWF8tCIVSNyZ?=
 =?us-ascii?Q?ngkpGwSXD5s2kKCD1T/26yKbnX65D5gPS9v/WhZmnuFiMjf8pXT13Hzh1t0y?=
 =?us-ascii?Q?OQMwfszkKYAcL6gDY5cn4zLzJXmnaFLk9GVIXGnEIOG1kakhmh1upUMI/0xo?=
 =?us-ascii?Q?E46WD0OcqqE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nfeZFEUXG49Lf72qhyBzVqmHR4P4NYvhmqI+HWEZvf41DWRwk0KZMeGSybHV?=
 =?us-ascii?Q?ysyyAPA9o0Mq6lVUBx0+EoywvNlsdhPB11DfKpxCaI3ZEtmGzJFXNt3d2pfP?=
 =?us-ascii?Q?dLzuy7ToMCE77Rs/FYV6qI0Deq47uFu8KI9ekwduNFoZrRnB8yC2WnfPmgxe?=
 =?us-ascii?Q?h92xHV64vma3iY/weohVM9hCAB5aO8+3vJM7Um/9ySei4rhK0D3nqlfyitTW?=
 =?us-ascii?Q?ReQyi0c2/Pd1OfI2816j3ivL2eCgSHaaBjwZ+2Xf0xpRP82MmFpjA6Vq0QCQ?=
 =?us-ascii?Q?q6UjCHo0VJkjabwtngOKX2p6UEUb1fDplsEzoN8ryK53FeaJkx+uWGM0y+MR?=
 =?us-ascii?Q?vCpcXmqZiSJ3ElgARhocrvslYTGTAdAynX1kVlJTfS2LHrlApfWu+e6GxtoX?=
 =?us-ascii?Q?E0Y2MxRHeMb4fMvFIvKf9vxSrFB3CDz1tClhc1Y9kcIuq6q0OQNg7smIMXY2?=
 =?us-ascii?Q?HllTt2dtHHNPNyicIiG1lFAyB2pad6znPuz0Zf7vP4IyQ2myDUX5WZNku7bj?=
 =?us-ascii?Q?I/L4KgPZDojj2cO/M4ujEeXU+g1i5YKaWdX+AKBvmmcjduRw4vNzWGnSVy6J?=
 =?us-ascii?Q?gn2S3vZTzspIfNb89qW/aXVsb4VBLWzzyYDPM3QZYdSypnJvbyLS32UYGQ6p?=
 =?us-ascii?Q?Bk1mV3h7XsUYr0V0uo4o0Xwg5dS2ts5r/PK27A3DSAvB9ZR7GETDhlkA+7EK?=
 =?us-ascii?Q?DoAeNE4qFp5E71wLmh3RdPqjqAD6UhfrgmJbtBRsfJo1fazIwnlY9waSmj4f?=
 =?us-ascii?Q?Cc8fwYN7Jy+IgA1K5XyXfykQDnIN4n/rGafSBtcrAZQECcRI/y5UpGtgH8mb?=
 =?us-ascii?Q?4pxOZ2HAmRS0ZkT40W9C21imTGUN+FRYGB5Gcs38Pr5/Mvk0FTi0g3INaWXA?=
 =?us-ascii?Q?m6pKma0XIgrM11cNMtMmPsSlAey4/Lc7BoOXfd0DdJS/Yd6pPAVmVPGWObdk?=
 =?us-ascii?Q?gw1xe+5rV3M04ZJJrNJYo8eyPTU7oMz853hye1DXBPpcolfAhVMzg9k2cWpy?=
 =?us-ascii?Q?mai3O/ENOVT+w0Y2M7hlBEuSRWJBiT0k1vBRWLgMBQBNf5jqxA8kTZzhZj0V?=
 =?us-ascii?Q?J3hLVZzyAX5lVuNZhmwvGNYRqNizJia0bLa2LvqkeMjsjker+aRYGC86+8V3?=
 =?us-ascii?Q?lYUj7zjjyDmvHMdlgDFsBx8LMAQ+C8xq/RPoEW4VLzWmIrQVRRLrDuhEL1jc?=
 =?us-ascii?Q?xUpkpuQCBQ1YNVUM12gX5MXMzq7AxT3AY3Hf4uITczpn8WsseWDPwuiMbV5q?=
 =?us-ascii?Q?nDSus4XzWnXRd0MuMOfUYYqFY7lcQDK1sKtX796nG/nQDJZdzjIj72iG3+7y?=
 =?us-ascii?Q?PQyw2xwMfubw680qYIqEgQB43LwhVMWBKGtDdn9cAqUZbBGLM5lVVisrdLFx?=
 =?us-ascii?Q?GTwNSBjDE9rLmiVKad3aS5zZNXgRzFSlGux/5BjIT2q2Ea328ysFTv2SsUPG?=
 =?us-ascii?Q?BbOGqLHJ+cOe/DhjJKCsyVq8mTAYj7shwGZKXMe7hvdGofSmZEx9LH6J8/xR?=
 =?us-ascii?Q?EsFRYUVvbvamni1qhdJRMmP/oX8qXCrqj6tc+6CQsqt2wD3vtqUJo3n9ZGIZ?=
 =?us-ascii?Q?OUEp5g/jJTfaPZSUetlsb7euFx/obKf9FdT9PZUyjbSHcX2zwajiaeSOkk9W?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f4ed4b-76d3-4909-0fc8-08ddfa19f99d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 20:52:42.7243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PLppDPWWhAsqIq3vKob1Gye7EacR5VnK5UefqnzFADIawDpwClKy4oQB5CMpZm1A8P6RbhTC1qOZgfrs39XoNFe5ksYdw7E9BTrfMU7Mmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8269
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

On Tue, Aug 26, 2025 at 10:51:02AM +0300, Dan Carpenter wrote:
>Hello Lucas De Marchi,
>
>Commit aaa0c1f50a3d ("drm/xe/psmi: Add debugfs interface for PSMI")
>from Aug 21, 2025 (linux-next), leads to the following Smatch static
>checker warning:
>
>	drivers/gpu/drm/xe/xe_psmi.c:93 psmi_alloc_object()
>	error: 'bo' dereferencing possible ERR_PTR()
>
>drivers/gpu/drm/xe/xe_psmi.c
>    68 static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
>    69                                        unsigned int id, size_t bo_size)
>    70 {
>    71         struct xe_bo *bo = NULL;
>    72         struct xe_tile *tile;
>    73         int err;
>    74
>    75         if (!id || !bo_size)
>    76                 return NULL;
>
>I really encourage everyone to document why functions return both error
>pointers and NULL.  Here "bo_size" can never actually be zero so that's
>an impossible path.  Presumably id can be zero, but what's the point of
>storing a NULL in xe->psmi.capture_obj[0]?  It feels like it complicates
>things...

neither id nor bo_size can be 0 at this point. We could simply remove
the check or replace by

	xe_assert(xe, id);
	xe_assert(xe, bo_size);

id == 0 means system memory and that's blocked by

static int psmi_debugfs_capture_region_mask_set(void *data, u64 region_mask)
{
	...
	/* SMEM is not supported (see comments at top of file) */
	if (region_mask & 0x1)
         	return -EOPNOTSUPP;
	...
}

>
>    77
>    78         tile = &xe->tiles[id - 1];
>    79
>    80         /* VRAM: Allocate GEM object for the capture buffer */
>    81         bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
>    82                                  ttm_bo_type_kernel,
>    83                                  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>    84                                  XE_BO_FLAG_PINNED |
>    85                                  XE_BO_FLAG_PINNED_LATE_RESTORE |
>    86                                  XE_BO_FLAG_NEEDS_CPU_ACCESS);
>    87
>    88         if (!IS_ERR(bo)) {
>                   ^^^^^^^^^^
>Better to flip these around.  Always do error handling, never success
>handling.
>
>    89                 /* Buffer written by HW, ensure stays resident */
>    90                 err = xe_bo_pin(bo);
>    91                 if (err)
>    92                         bo = ERR_PTR(err);
>                               ^^^^^^^^^^^^^^^^^
>bo set to error pointer.
>
>--> 93                 xe_bo_unlock(bo);
>                                    ^^
>Dead.

I think this is now fixed by commit 1f1541720f65 ("drm/xe: Rework
instances of variants of xe_bo_create_locked()").

sorry for the delay replying to this

Lucas De Marchi

>
>Don't we need to call xe_bo_put() or something to free the bo before
>returning?  Something like this?
>
>	if (IS_ERR(bo))
>		return ERR_CAST(bo);
>
>	/* Buffer written by HW, ensure stays resident */
>	err = xe_bo_pin(bo);
>	xe_bo_unlock(bo);
>	if (err) {
>		xe_bo_put(bo);
>		return ERR_PTR(err);
>	}
>
>	return bo;
>
>    94         }
>    95
>    96         return bo;
>    97 }
>
>regards,
>dan carpenter
