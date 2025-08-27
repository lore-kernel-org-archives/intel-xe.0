Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0193FCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 16:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD43710E868;
	Wed, 27 Aug 2025 16:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdDYv0Qs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B2810E868
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756310648; x=1787846648;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JamKBoYCvCYEcl8DXIfvGqOy479dxsU8uQ3hA65XaSg=;
 b=BdDYv0QsCzfBASXbhhMvEuPu2nN+/z2ngL4OTJJFXEGKwURTaomnfiVw
 7n2mPOb2qOYbI+pPyxXgnx4dF6tBuYHCfG287ohGpyuReZFU950kEB+ND
 IZG7HDDENtCC3ZlhNy/kO4SG0hXopX5zJ4EaUBbzJ+cFdZ09BMuxpE+bw
 lJLk/B2eNQJvC/anbzY1NOmLHMWt9nLH4AeY3TE1jQB4urDGFPROeHJBO
 Ag2RDpXanC6Vhcp/R03S3qQL/A5HhGpKrI+C8X8fzaf90Z8g+fysxcYtg
 09TsmhCChVRm7JfMWJkoTcRLi6ayeXZSQRChFxMcE02SSveSERTTNSDpP g==;
X-CSE-ConnectionGUID: iQ9BJfFCSz+rZQAbdFpYIA==
X-CSE-MsgGUID: 7WigLbWoTxiXqA4ZUP+peA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57588318"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57588318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:04:08 -0700
X-CSE-ConnectionGUID: rcHB5V/UTayrXfY789se9w==
X-CSE-MsgGUID: V/YStTm2TEKxkmZFC62wiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174268216"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:04:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:04:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 09:04:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.77) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBxhBMjVK+V5YbQL0n3ryLwimL3BmjFRxgGu1pUDUpjOt6DQwLiVaOXrftSy0Uj4VFFAcAKXlfgtbYIYoc610XAeCwEpgaB3gnJLlPLksyOTzFHX2c4qEpR/r/UnP28Xs69oacLyoIPakzZhKC5AabNl6ZtSHhn4URLmHLAgs4s+J70Ey0ohRZrMnpksXLFb9qP99Jihd7xJ1xTKvpumO81Zj9GeZD472KvjiU982Xj42reI88HVTsNTrFO7ZEUI0/sKVQnAY5M2pp2WrWePnwFeBsS+oHAaDW6wDKLKJ/jgnddVj2u4syJQ2IUqPyZ3HSn5FVoatDO0EhTgB/q1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x140AecoBvNnTb3WzeI35SE+rKQrsv9rIBunA32kNKQ=;
 b=sW0O22ODf58u4WIs0sO3/043Jonzh6cii2kLT8AhjVwuuqGRjekbUp1ZzhnKkXXa77Jbs0BgdL1o+ZlUTI1VkpfYjn/fc+ZCSDqlmk3j9kz5ez0H4rbTO0U63ybFRTVLMQb95px9OP/4Mqow2n7/59C6bofrKvQdexeIv7GZ01U2IfhEKtBwgVZz7hhM/vdZLDVpiiGKAzLbYgfNsO0c+dClAHNsypFPqxlTF37jM1KEfGZ2Ni6ydhI3v1JbViS7+ynxjWFg81ILQthx3n/eBbzPvfzpo5YNaRQfDO0UEwgywpK3eJQKQ3D8aIoJJznxNgnO0IFILs8yyFXgKalt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB7125.namprd11.prod.outlook.com (2603:10b6:303:219::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 27 Aug
 2025 16:04:02 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 16:04:02 +0000
Date: Wed, 27 Aug 2025 09:03:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Message-ID: <aK8sbZxVd+MlS1ZX@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-2-matthew.brost@intel.com>
 <aK8kauwpALcoSxwr@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK8kauwpALcoSxwr@fdugast-desk>
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 8168da68-2a1b-4d53-9fba-08dde583564b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R05kZnFzZ1YwbDJqOWEvWHhweUM1UDBoenYrZUVVQTEyN1pXZE1nMk5QdVY3?=
 =?utf-8?B?emQwYVJzcUg3YWNxNGE4SnAwMWJoSXFIYXhYNkZwdkVrVGhmdmJDWFlKSE9i?=
 =?utf-8?B?akpod3AwMy93bk9VaGRESzdSWWZmaDU4RndMbDd3QzRTanlHRlNvMDJWVko1?=
 =?utf-8?B?cmpTb3FPVjg5V25GYnc0UDIxaFRPNGJlMXM4UW9UNlJzc3Vqck4vclhocWIr?=
 =?utf-8?B?SWI5WVBHKzRqeGhSVWhJVW1MSEdjb2IzdDlJbDNBZUhCMUxNSEVaV041OEpB?=
 =?utf-8?B?RlFyZW9aM3hzYmVtMm5DTSsyTmdzNGdUWGt2aXZ1cUwrZlB5NGw4b25vU2ll?=
 =?utf-8?B?ZTlrcFJoVS9QbjZpU2MzSlJKS0tNZ05aOS9EbS8rSVZkeXh0ek0rN3RNb0xz?=
 =?utf-8?B?dnZzUVFKZHkvdGVrOXVzSzg2TzhWdFA4ZjVqZ28zd2tCcExza2kxUGVBSVdl?=
 =?utf-8?B?cGdZOStZODJEY1p3YUNlb0ZzdzQzM2YvMjdYNjBSdERDYUdLRWxOQTlCc0pD?=
 =?utf-8?B?aTFOMWVvdGEvVS9vRnQ5bzRkdmZnNHRzY1YzOFFWM1dPczdTaFpoSGswU2hE?=
 =?utf-8?B?U21OdVE4K2Z0N1lSWkNnTUg2Vkh6alpTMHFSZmNUQ3B3Mkl4YnplRXB2ZHdU?=
 =?utf-8?B?L0NBODBSbWNhR3FYdVFxelh1ZEkwc1VmRlZTM2Y2bC8rd2J1OTFZczhSTkJG?=
 =?utf-8?B?VVFCa2VIRm9DS25CU1VXS1ozZ1llOEtxT2dmeW5MVGlveFhMcXc5ZjBkWmZN?=
 =?utf-8?B?NlhIL0thczhXcm5ISTlwL0ZyV2puclhmUDczcm1tNDRuOFNyMjNNcjNQT3d0?=
 =?utf-8?B?Tk5vWGJQb25iSzZIRlc4eVVzYmJmVHRwNk92ME00RDFUNlRhMElJS3l5N1FI?=
 =?utf-8?B?T0ZneWhZY0VEd1ZUaFFDL0RKbVlDbmdPN3BLT2U5b2NQK3V0bW9OdmtrVm1h?=
 =?utf-8?B?ZUFvZjJJK21FRERRNHJ1bFJFakN5cVZKNHNNdXIwV2dicUdhaTVpT0RPRkU5?=
 =?utf-8?B?QTVsTE1SVVhmV0lPaXUxMGJhb0Z4VDVvZWdMVUhpaWZQdmMvSFZGM0Z3Yk04?=
 =?utf-8?B?RllHdnZYZXhZODVGT1pQb1VjTDkrYVN3cWdIbmtZYUVoamRabE15TytzQzRO?=
 =?utf-8?B?akZZNTJhbXU4czdWK1VYNEhMcGpGU0pySjQrY2podnVQbXd1ZnJsQUZOeW5q?=
 =?utf-8?B?aWtvSmQ2YkxwakpMSnVtNklIU1JRYzZPV3B1dUs1TFNaTldmelVLaTZMVldp?=
 =?utf-8?B?QVFjMS9WazNWRCt6emFmRWU5MDFzeWN5clZWSmR1TGdRSVhlYjhjdU93SWdr?=
 =?utf-8?B?d0t1QTNXbEwwU3o1eTZUbmttd05uWjdHQ1lkeUhpWmlFR09la2pLUDhFeVdS?=
 =?utf-8?B?dUlsVHkxS2IvdkJxcnBNcEh4a0l3NXNGYnJMZTFJRXgxVFFnc2t6enViZzcz?=
 =?utf-8?B?MFJNWVlYSEREaS9sa0FTbTlFMCtYUldyZVRkUjNzU2pXWmxvK3MrT3p2K3hM?=
 =?utf-8?B?ZjJ6MDUxM0o5NS9OeFE1c29XbkhPRUJWU3pZTjdOR1BHSHJJek9uamZ6aVBn?=
 =?utf-8?B?VWhvY091MXVZNUE0b2xrM3BaeHJMUFdGZ0NzT0Q5QWlrR09kVGJpeWV3akEz?=
 =?utf-8?B?MzBNL2VTSUZwamt5VE1tZThvOUpMWmxsQS9oemR4d3AzVDIyNml5NjBZanRU?=
 =?utf-8?B?N3pSM2RuUXcreGZLaWFINFhxQjVDaS9OczNGMkh2bjJaZ1lFOCtWdXFIMzZx?=
 =?utf-8?B?WjZCajNyZ3VrdzdUbWhYdjIySUxqR3hjZVJuSEQ3dHNGV3FJU2VEZ0VvTlcw?=
 =?utf-8?B?QTV4N0dFMk5PQXRnUUIwS1R1ekJjdjNPenI2NWhSTlFtbDFvUGVuckZucWJl?=
 =?utf-8?B?YWNIc1k4bTdzcUlDcElLdEhBQm04cldPY3RRR24xWXVOa1ZCNzA1SDVTZmVz?=
 =?utf-8?Q?MnOL/NkxTZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVlGRHNjVHpzeEYwRTZ2bUtzeEc5ei92cVF6T1VYM0t2bUFsL2oxQ2tUSFh6?=
 =?utf-8?B?a0pDZEZkV1VrYWM5L0x5Z0d1bm4vdkhjaWVrQ0NSZTFqOU1zQkhGV2p3RlJy?=
 =?utf-8?B?N01WdEZZZkprQnd1QjZMcG9ZbW1WczJJdXp1dzZZVkFIbHBoR2ROUmdpdy90?=
 =?utf-8?B?ZUtyWnUyVTljTzlFVDhhcnJhaWk2M29kWm03aEY4K0x1U21mSUFVV3lCRTZB?=
 =?utf-8?B?NmRzMlJoaDR1eXM0cU9TM1Rqd0FzR0gxY2J6cmczSFBTc1N0SlZsaEg5bWpW?=
 =?utf-8?B?VTd6ZFNzTFNTRkpMWi9yTVQ3RzRRWXUxN2hPUzFXcUdkZmV2Sy9xdzJ3aU5m?=
 =?utf-8?B?UkpzTlJMZnlTc1NGL1BRWk5qa0Z3Ti9Hck5NZmgwVTZSTnpOK2dMcGlBM3Ft?=
 =?utf-8?B?MXZtMXVpYmFIYmh0N1YrM1EzQ3ZTN21kdGg0S3FsVlQvbE96Ym4yUXNWNERZ?=
 =?utf-8?B?R0w5VXFWYjRwWW9Za0g2RW9ZeXJNU1c1bVZVS2o4TXhtTWM2OE1ncDhrVUdT?=
 =?utf-8?B?MDFyY3N6dnVPOXVWMzdxNm9zSkFiUWlud1RjR1R5cTFjb0ZINXZzSmVGUVkz?=
 =?utf-8?B?dUJhT2tiaWRBN20zZ0ZEM05yKzI3a2ljeHZheWRhZmdqWlRKcS80SXA5NWpD?=
 =?utf-8?B?ZjJMbk5WbnhwdWx3eHVXaTU2U0xHTEFlOWhuUm4wOFB3TlA0dDZnT1V1NUdU?=
 =?utf-8?B?eXBaUEwvRExia2NBZXY3eEFOa2lQdE1wQW9nSWxSam5sMzEvT2wvMVhFUHVt?=
 =?utf-8?B?b3RQRmJ0VDNuNmJydzNCbHduUlM4Z2lGNHJPZkFXNGt5Mm5NWk5mTVRFV281?=
 =?utf-8?B?OUlwbUJ3Yms3dWZEMld3YlRLa05LSWxocU8vaktjNThPRnlacHZCbWxrQzF0?=
 =?utf-8?B?LzE5MnNibzltN0FkYlhLZStXY3ZLMkMxWVBnK2NXWUtiOFUraFpjNk9tYkVx?=
 =?utf-8?B?TzI5TVlZUjNsaGJxdUVCQjBxUXRqUXRGcWhUYkZXR3RNNzRIdnVTaTRaWXhz?=
 =?utf-8?B?VTVqeHFqcVhIb1JuT1BpQkQxNEpuZWVhdnplSi9IMDFwZGRIejV4Z2VtTGlF?=
 =?utf-8?B?ZGlqVVE0Y3pHTTFVSm9mYUhyQWtGL3laQkJ4TmtRS2JncFhBTzhVVFRFdllZ?=
 =?utf-8?B?OW5hajZRU2VqazkvS3RQNXNmemU3MVlGbHZzYmpscUJqTjRudHk4dTJUVEYw?=
 =?utf-8?B?RlVxNmRZM3dTa0dJbW1HTUNENFcyNTlTMlNKbUVPOXAwSnk2bG80cmZQY1Vz?=
 =?utf-8?B?YXJYTVoyR0crYWhwTHlVcXQyaTRuUlM3Z2VuRTlZSzRISVNQVkFzdHhTZGpW?=
 =?utf-8?B?a0h3YnZ6ZCtBenpkTFFDZHk1L1RNVGJpc3A0TmpmRTZGWjZnci9YSVAvaGVo?=
 =?utf-8?B?U3NsU0dwTENXMUhsRVVDYS9WRG9QcVo2UjVlVmdjbHNQc1FHUHliandvYlJw?=
 =?utf-8?B?UmlSb3g3SWpHbjNDSjBSZVU5QTMvOUVYODI5cXJhM01BY0tsVEFnbVdjUHZF?=
 =?utf-8?B?Z2NTUzFxMjJXZlQ2blhlSHRnUmNKb2cvS0tyQzZpdXJ0amFvRk4xdlB6WTcz?=
 =?utf-8?B?NEN3UUdmMkV5WlN2VWpFQW1qaGJBMHYzVHB0RFJPT0l1OHgvRC9zc1BkSHBt?=
 =?utf-8?B?L3NNcXM0czNwR2JPalM5V1lDNXVZMDMydW1SOWp1cmYzMzlnTlpRNlEvbUt5?=
 =?utf-8?B?OGZkemY2Ni84RHh1c2d4cENseFphZjA2aVBtMVNSczZicTU3UmhGcFBDbXZy?=
 =?utf-8?B?V1k0dThKL0xZVHYxTjg4QXZYZ0o4TEVmSUZTWk1WUTUxRWlnaUFXcWx3Yk56?=
 =?utf-8?B?eEZrbmo4QURkQXUrMFhiZ3Z1MHptZ0xQY0xrZSt1R3U1Vjd1RHc3cTN0U1dY?=
 =?utf-8?B?MXBmMTllRzlpYTlTd0lKYlgyOTdVZFZWeVVEM3Qwa2xJaVllK3FzUmlnNlRW?=
 =?utf-8?B?Mk9LbnFDdHJWcElYZy9wRU9KOUNIbkVaTy9CQXJWSUVhdkZNdTJEdVVWLzJi?=
 =?utf-8?B?T2tNQ2tYSGZwRDI0cGRpaFA5UkVENHRDY1o3K09SaGlGcUxYaktFMk1QRldm?=
 =?utf-8?B?LzJHSFBuRDdRZTBjUUFFbzBDUEd2VE1saEdDZWVsLzYxOXlpbjRrcUlQeFFz?=
 =?utf-8?B?dHJWdDNMWVdEWU9mVHhXcHhqdmdlWVc2am5ONnFxRkhIL1duZTRqVStqUjBt?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8168da68-2a1b-4d53-9fba-08dde583564b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:04:01.8774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z44D37jxGZswh7dS64B2gnAeAun+WvcEk4xuKDlZOihd+iGekgfX+Fc+Jk9ZaC6Tq/PfSHOrs/IjHD0zTlylGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7125
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

On Wed, Aug 27, 2025 at 05:29:46PM +0200, Francois Dugast wrote:
> On Tue, Aug 05, 2025 at 11:22:32PM -0700, Matthew Brost wrote:
> > Stub out the new page fault layer and add kernel documentation. This is
> > intended as a replacement for the GT page fault layer, enabling multiple
> > producers to hook into a shared page fault consumer interface.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile             |   1 +
> >  drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
> >  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
> >  drivers/gpu/drm/xe/xe_pagefault_types.h | 125 ++++++++++++++++++++++++
> >  4 files changed, 208 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 8e0c3412a757..6fbebafe79c9 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
> >  	xe_nvm.o \
> >  	xe_oa.o \
> >  	xe_observation.o \
> > +	xe_pagefault.o \
> >  	xe_pat.o \
> >  	xe_pci.o \
> >  	xe_pcode.o \
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > new file mode 100644
> > index 000000000000..3ce0e8d74b9d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_pagefault.h"
> > +#include "xe_pagefault_types.h"
> > +
> > +/**
> > + * DOC: Xe page faults
> > + *
> > + * Xe page faults are handled in two layers. The producer layer interacts with
> > + * hardware or firmware to receive and parse faults into struct xe_pagefault,
> > + * then forwards them to the consumer. The consumer layer services the faults
> > + * (e.g., memory migration, page table updates) and acknowledges the result back
> > + * to the producer, which then forwards the results to the hardware or firmware.
> > + * The consumer uses a page fault queue sized to absorb all potential faults and
> > + * a multi-threaded worker to process them. Multiple producers are supported,
> > + * with a single shared consumer.
> 
> I am not through with the series yet but xe_pagefault seems to be the
> consumer code only, while the producer code will be located elsewhere
> such as in xe_guc*. If so, might be good to write it here or in the
> functions below.
> 

I didn't want to mention the GuC specifically as it is intended to be
generic. The GuC is a firmware, which is called out as potenial
producers.

> > + */
> > +
> > +/**
> > + * xe_pagefault_init() - Page fault init
> > + * @xe: xe device instance
> > + *
> > + * Initialize Xe page fault state. Must be done after reading fuses.
> > + *
> > + * Return: 0 on Success, errno on failure
> > + */
> > +int xe_pagefault_init(struct xe_device *xe)
> > +{
> > +	/* TODO - implement */
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_pagefault_reset() - Page fault reset for a GT
> > + * @xe: xe device instance
> > + * @gt: GT being reset
> > + *
> > + * Reset the Xe page fault state for a GT; that is, squash any pending faults on
> > + * the GT.
> > + */
> > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> > +{
> > +	/* TODO - implement */
> > +}
> > +
> > +/**
> > + * xe_pagefault_handler() - Page fault handler
> > + * @xe: xe device instance
> > + * @pf: Page fault
> > + *
> > + * Sink the page fault to a queue (i.e., a memory buffer) and queue a worker to
> > + * service it. Safe to be called from IRQ or process context. Reclaim safe.
> > + *
> > + * Return: 0 on success, errno on failure
> > + */
> > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> > +{
> > +	/* TODO - implement */
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> > new file mode 100644
> > index 000000000000..bd0cdf9ed37f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_PAGEFAULT_H_
> > +#define _XE_PAGEFAULT_H_
> > +
> > +struct xe_device;
> > +struct xe_gt;
> > +struct xe_pagefault;
> > +
> > +int xe_pagefault_init(struct xe_device *xe);
> > +
> > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> > +
> > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > new file mode 100644
> > index 000000000000..fcff84f93dd8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -0,0 +1,125 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_PAGEFAULT_TYPES_H_
> > +#define _XE_PAGEFAULT_TYPES_H_
> > +
> > +#include <linux/workqueue.h>
> > +
> > +struct xe_pagefault;
> > +struct xe_gt;
> > +
> > +/** enum xe_pagefault_access_type - Xe page fault access type */
> > +enum xe_pagefault_access_type {
> > +	/** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> > +	XE_PAGEFAULT_ACCESS_TYPE_READ	= 0,
> > +	/** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> > +	XE_PAGEFAULT_ACCESS_TYPE_WRITE	= 1,
> > +	/** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
> > +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC	= 2,
> > +};
> > +
> > +/** enum xe_pagefault_type - Xe page fault type */
> > +enum xe_pagefault_type {
> > +	/** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> > +	XE_PAGEFAULT_TYPE_NOT_PRESENT		= 0,
> > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
> > +	XE_PAGEFAULT_WRITE_ACCESS_VIOLATION	= 1,
> > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic access violation */
> > +	XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION	= 2,
> > +};
> > +
> > +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > +struct xe_pagefault_ops {
> > +	/**
> > +	 * @ack_fault: Ack fault
> > +	 * @pf: Page fault
> > +	 * @err: Error state of fault
> > +	 *
> > +	 * Page fault producer receives acknowledgment from the consumer and
> > +	 * sends the result to the HW/FW interface.
> > +	 */
> > +	void (*ack_fault)(struct xe_pagefault *pf, int err);
> > +};
> > +
> > +/**
> > + * struct xe_pagefault - Xe page fault
> > + *
> > + * Generic page fault structure for communication between producer and consumer.
> > + * Carefully sized to be 64 bytes.
> > + */
> > +struct xe_pagefault {
> > +	/**
> > +	 * @gt: GT of fault
> > +	 *
> > +	 * XXX: We may want to decouple the GT from individual faults, as it's
> > +	 * unclear whether future platforms will always have a GT for all page
> > +	 * fault producers. Internally, the GT is used for stats, identifying
> > +	 * the appropriate VRAM region, and locating the migration queue.
> > +	 * Leaving this as-is for now, but we can revisit later to see if we
> > +	 * can convert it to use the Xe device pointer instead.
> > +	 */
> > +	struct xe_gt *gt;
> > +	/**
> > +	 * @consumer: State for the software handling the fault. Populated by
> > +	 * the producer and may be modified by the consumer to communicate
> > +	 * information back to the producer upon fault acknowledgment.
> > +	 */
> > +	struct {
> > +		/** @consumer.page_addr: address of page fault */
> > +		u64 page_addr;
> > +		/** @consumer.asid: address space ID */
> > +		u32 asid;
> > +		/** @consumer.access_type: access type */
> > +		u8 access_type;
> 
> For type safety we shoud use enum xe_pagefault_access_type instead of u8.
> 
> > +		/** @consumer.fault_type: fault type */
> > +		u8 fault_type;
> 
> Same here with enum xe_pagefault_type instead of u8.
> 

This structure is carefully sized to 64 bytes. Unsure if using enums
here will throw off that sizing. I'll check on this, but I suspect it
will, if it does I think u8 is the correct choice.

> > +#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> > +		/** @consumer.fault_level: fault level */
> > +		u8 fault_level;
> > +		/** @consumer.engine_class: engine class */
> > +		u8 engine_class;
> > +		/** consumer.reserved: reserved bits for future expansion */
> > +		u64 reserved;
> > +	} consumer;
> > +	/**
> > +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> > +	 * by the producer and should not be modified—or even inspected—by the
> > +	 * consumer, except for calling operations.
> > +	 */
> > +	struct {
> > +		/** @producer.private: private pointer */
> > +		void *private;
> > +		/** @producer.ops: operations */
> > +		const struct xe_pagefault_ops *ops;
> > +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW	4
> > +		/**
> > +		 * producer.msg: page fault message, used by producer in fault
> 
> s/producer.msg/@producer.msg/
> 

+1

> > +		 * acknowledgement to formulate response to HW/FW interface.
> 
> s/acknowledgement/acknowledgment/
> 

+1

> > +		 */
> > +		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> 
> It is clear from patch #6 why it is more convenient to have this in
> struct xe_pagefault rather than local to the producer but this seems
> to go a bit against the elegant abstraction provided by this new page
> fault layers. producer.private could store a struct with {guc,msg}
> but that is probably overengineering so up to you.
> 

You can't malloc (with GFP_KERNEL) the producer path, at least for the
GuC as we are either in softIRQ context or under the CT lock which is
the path of reclaim. The only option is have these fields populated in
the stack xe_pagefault structure in the producer which then is copied
into a preallocated page fault queue, sized to sink all possible faults
on the device, on the consumer size. I can add kernel doc explaining
this.

Matt

> Francois
> 
> > +	} producer;
> > +};
> > +
> > +/** struct xe_pagefault_queue: Xe pagefault queue (consumer) */
> > +struct xe_pagefault_queue {
> > +	/**
> > +	 * @data: Data in queue containing struct xe_pagefault, protected by
> > +	 * @lock
> > +	 */
> > +	void *data;
> > +	/** @size: Size of queue in bytes */
> > +	u32 size;
> > +	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
> > +	u32 head;
> > +	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
> > +	u32 tail;
> > +	/** @lock: protects page fault queue */
> > +	spinlock_t lock;
> > +	/** @worker: to process page faults */
> > +	struct work_struct worker;
> > +};
> > +
> > +#endif
> > -- 
> > 2.34.1
> > 
