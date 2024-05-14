Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C59AC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 01:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209FD10E23E;
	Tue, 14 May 2024 01:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOJEisi+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E9610E23E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 01:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715649876; x=1747185876;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2LGR+223ZPzyLf/WM1ygtDnSAdHg+32HHuaEdSZVhl4=;
 b=EOJEisi+WcN1wsBlohQMEtkDGhwOr7yZcj9xqBdY3D92MKJBGJK5uako
 8c3jgHV2Rp1CSSj+jBV9iXY0Sm/AtSqbUztRlNF1mh51CWXky1JSKHr7g
 pYIm9r329TYpcxVq3Y/TVdNrJsOgogTAJH7uR6QEOkQv1412HcTZk1BFu
 kKLV6krnU9Eor3mQcOpIFefRXXA9mpGfzM+Yv0Qk8oScsFRxBA05iQOzo
 PWmptcprlWZWbINBLpRE49wcqMqSrfX58yqQDWO7QXQpOOSpgTeAPp30t
 CY/Sa2oqC9V/JSVzFdoDe5fYHvZoAZspz/X9b3rD1tq/bNRn7Ufh36dDZ g==;
X-CSE-ConnectionGUID: vC9humdzQWuqJNX6mSPsJQ==
X-CSE-MsgGUID: 5v8Myt+KT6GdY5FhBM7DKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11430754"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11430754"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 18:24:35 -0700
X-CSE-ConnectionGUID: jxE8Eu/XQBa7RwPdAaD4Sg==
X-CSE-MsgGUID: KQ7MznNQR7+s2lezRl57eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30457689"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 18:24:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:24:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 18:24:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 18:24:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 18:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oShX/ndfdjtnAok50eXWXqswee1xaZ6aGe7lprr7VwB87Zupaze46w6ysh/UfOCKYyxLjG+tGKWCjaA21rtP04mEXVVC6bWgMvVTzSdIVfrwdBDgtljLhYOh8VrS8IeA+CfEW+oQYV5kScsUr6QzYHAVJsXDfswB9HY6mMNN/Z/aESk8Lms6JDHRzGQR8HWyKVeD/VvugS0/v6t7GKfXeO7yTl4WVncWelISiQNOecE67pgoZRzNJDfXdWo76aN6DAdxxnRHEruowNghjdDpBV/Qe8jUubW4Wh1fLpGvoghVo6eLzMQ8zp6HjX55zcQ4QGJGv+d6+/+umhIv1cVD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ/vs2sznLPdah+NWx/cDH8bBLxDZYtjZJvMz+r9YtQ=;
 b=bAtxXshxXapkGRxvXhBKZiVyyCHNk4BsEOjrLIgldyDkXL6GU7sivtpjmDLc6GqY3eL6e0Wy/OcUq7SRhCarxUjsVOp3by/q9Xc+7Sq4pBqSUXewd3gLTnJ0lbK5l52VpYkVWrJ6ANaPxOA0MRL+vEP8hOcy8qfkR1pUUeVEMg8Wf32/op0OXJ19CqobSG46NDIhRI8uezRSN+zeB91p4CGO8TKCImHGIbvt/maAF5wZJbWVQGWeNTr+0EZiA1iXIRUmTyYyZixxCX1lcE07M5m+amjAj5oxF1b1wAXhM+6S1q3FoF7tw3yIrY8K06zWBkIYFBXE9/qJDSsF1SS/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 01:24:32 +0000
Received: from PH7PR11MB7719.namprd11.prod.outlook.com
 ([fe80::ee90:677b:2e84:4971]) by PH7PR11MB7719.namprd11.prod.outlook.com
 ([fe80::ee90:677b:2e84:4971%3]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 01:24:32 +0000
Message-ID: <fb7563bf-5fb6-4ab1-9aee-da0fc25b7994@intel.com>
Date: Mon, 13 May 2024 18:24:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Only use reserved BCS instances for usm
 migrate exec queue
From: "Welty, Brian" <brian.welty@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20240415190453.696553-1-matthew.brost@intel.com>
 <20240415190453.696553-2-matthew.brost@intel.com>
 <faaa56a0-8579-4294-ba57-fe63c1f429fc@intel.com>
 <ZjrmpDa05PSL6B1h@DUT025-TGLU.fm.intel.com>
 <7660b286-5dc6-4edb-bdf7-d16da1614017@intel.com>
Content-Language: en-US
In-Reply-To: <7660b286-5dc6-4edb-bdf7-d16da1614017@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:a03:167::26) To PH7PR11MB7719.namprd11.prod.outlook.com
 (2603:10b6:510:2b4::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7719:EE_|CO1PR11MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a45f5cc-408d-44c9-07f0-08dc73b49b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnhUcCtJRWpKbHJaTERPZ3FDQUZrRS8wVkVpNEs2WXlsZnJhbGtJeG9JbzFp?=
 =?utf-8?B?Ny9vVlFZMnJKNXlkWlFEaHZubm1TN2FyL2ExZCsydWhTc2FWLy9VOTNIRVFV?=
 =?utf-8?B?SWhPdXFOa2J0THFuejBPcm1IL1BIaWZEemd5VnIyeUdDYVJZdGdzbkxXeTFn?=
 =?utf-8?B?NS9DLy9OdnpDUjZwSE81NkxwL2trUXFhSkEzU3dabXNiVFliaTZldnJBV05v?=
 =?utf-8?B?NEcxZmJxUVdmMVB1d0pGR01xbXVabUpRSGk3Yk5xRW8yNStaSXZFbVNUYUhn?=
 =?utf-8?B?ak5TTDFwbm9TaXovWHVYeGhscllWQWUrZ2hLTHRBZzRyRmNaZHhwRGZnQ1Rv?=
 =?utf-8?B?bWRkWVlnL0FUWFo0K3lhVGlTUlY0MXZRQmZnV1RTcWFmVnIvdGN5cm5FaDZv?=
 =?utf-8?B?U2NEZndUWFZiZ2Jxd2IvbWFUcGZVUXZMcUNUTmVLK3hoQ2FGRDViYjhTMjBT?=
 =?utf-8?B?NXA0d0J4QUV6bzRXdllaUkhlTlNzNjh6eXpDbmVJaW5lTE5QZldwdjl5UXkv?=
 =?utf-8?B?L2dRczRBS0xvSUNXcE1ybU0yRC9yTU5NMVczNHN2OXAwTnROYXpQS0tFWUV2?=
 =?utf-8?B?amR2c1B1TVZyNS83MjRJZVYyblZubjd2VFp3aGE5MlpMdzV6b0JhazJ3NVZX?=
 =?utf-8?B?OGlsL3Ftc2h6Z2IxOWwzRlIrcStSTHIxTXlWMENFMlpKbThGM29LYXRkcVFX?=
 =?utf-8?B?LzhFY28zYW9UZ01Obmw5cExadmQ3UGcvOEpnSlpPTEZzZ0RXZmZRTkdCL1RO?=
 =?utf-8?B?d055N3ZBR28zY1prRnpoNzVsV1lMQ2M4cjV2akdrL1doWVRGMkFoWUpKR1lG?=
 =?utf-8?B?aytKaTNISVgzWmUwZjd5bW9GTzYxWlpmNm5ZaHZscFJPdWFBZVdpQkNUOWZD?=
 =?utf-8?B?MXdyWGpza0xRRjcrd2VLTXQ1Uk8zdVVONXZRQnlUZlB4bUFsUjRoaXlhOThu?=
 =?utf-8?B?NmY2eVNQcGluMHowK1V5cStRVDlmRXdhY1FLaklwS1l3ZUZwTFZxZ0hlaE9Y?=
 =?utf-8?B?eWdOREZveGdqUDFRQ280djkxSHRIZGhHdkFMNEJMeS8rZ1ViTm9hc1NYdGJX?=
 =?utf-8?B?OWV2YWhxZ1RGOHlPcmxsejFrRTFFbEJsMTJSVFpuSHYzcHR1UGYvVmovdGNm?=
 =?utf-8?B?WXUzNy9kTzBrSDZBUjRDTDZmOEhoNTYyQ3RxWHpuZDh6cGhLUjRUenBMSWhm?=
 =?utf-8?B?Ynh3eWRqM21iaWgrQ3VueTlyejFlM3ZkalNvMmd5NGp5YXA3cDAyWkNMSjkw?=
 =?utf-8?B?SkhLZXBaM0theDJUNlo1US9UbUVuQmdSN2dRcUUwNVZMYUtQeGJ3UE5CR0I2?=
 =?utf-8?B?dEFXRi9pVUdZYWdsR1lqMUxXYWhsRnFkN3g1RzFYazlNeTFGVDllaEFMcjBu?=
 =?utf-8?B?d1FYVUplRURFUGNrYUZocUp6WmRCd041RFFGRm9tb056cnM5TzFjQ0lNM25q?=
 =?utf-8?B?bGpTOFM1Sm9PSTllZDVyVHpUbkdUNjNqRmZodDZTWTMyUC9hcy9qWndFdmFr?=
 =?utf-8?B?cm9NcXg0MVFtQ3psSnN1T1h3NEsvTUQrTTBFeTNFN2hIYUYwUGlMK25jZmNn?=
 =?utf-8?B?eHE0WnJqa0EvM3EzN3JEM3JjcitzalNXWUtCcEVQckJ3YkNYV3lRQzdSNkoy?=
 =?utf-8?B?ZDZlcnhlVnVwTmRKbTNmQnFCN3dtRG5iMEJQSVVIeEJHbXNDZzh2YkVIelNn?=
 =?utf-8?B?WUNHZ3E5ZExrcTVsbXVaanhON3MwZFd6dWZxMVNsRURmVjBlem1nU293PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDlzMUNDa2VoNXd0TTZVeHJHeDlGQnUxNU4rVm5CNmRuQno1bzkzbGQ5MFcv?=
 =?utf-8?B?bVhNS0IxZksyeXBsNlprR2JSTjhaeC9pZ2RUNGppeERWcG96WmhzSGRwR29R?=
 =?utf-8?B?Sm9Pam84Yy9vOURTSHhFdVEwd1BxVVFuV3ZOZ0YzcytLMDA4YXNTbVJibWwz?=
 =?utf-8?B?UmVZSkR0dWRqOTYwN2FKcC9oWm85ZERkT29mRHFkd1I3TkdFK0xvdlNxM0JH?=
 =?utf-8?B?L3RtZ3J0VkFsSS9CL0daaWxmRTI4Ni9BYkNtdThqUk42eGV5VTBiRytyTjVx?=
 =?utf-8?B?TzZWQkxmWnhoUnFHeWdTYllEaStmQmtzNHN6Ry9ueTd2OWx2aG1NQVV2R2p4?=
 =?utf-8?B?S2I0R0RTNXViZWVic0hlMFYzTFpBTkdnMzRQVmFJTWhxV1JKNUpPN1d2dTlY?=
 =?utf-8?B?d1QwSUUvZUZSa3pvNVlTOTAwUDhEVXVZQzRaekwrTmRBTFZVcUtlRGpJTFpE?=
 =?utf-8?B?ZHJ3VXdhNWYrMWRKS3hka2c4VWplMVliZlM0c3NFZnlTN3BPMWRMTFphaldV?=
 =?utf-8?B?Q3FPNGIyVktreFRJZVdSNkhxSkU4VE04c3g3RUxIaSs2Vm9KMVNrRUl3ZlMz?=
 =?utf-8?B?QStKRXBOREZlODZYQWVJVis0Y01ZOTl2UzFLSmNqSUs5cTcrdGRCeDRpNWhy?=
 =?utf-8?B?QWhNSWlRTU1HMDdOTVNaNmZhSzQwT0ZYanFtRDQ0SmRaMTliWEQzUVc3REtp?=
 =?utf-8?B?STl5NGY1NjBpT2ZnRmRlTWxFWjR2L2UwTkxSblFBWDlndTBlWkJ0clhiNUox?=
 =?utf-8?B?bmRnVEFzWkRLUEgwazYrRXhMZUoyNncvMFROWEFHRmg1TEhoZlJRWnJlaEZm?=
 =?utf-8?B?elpFZ0NiMDZwTkFHRTRuYi8yTHZWa0hZUFhsYk1Ga0lFblpzUVZNb0gwZHdv?=
 =?utf-8?B?MThMaXRVaHZhSS9adzE4a25TY2VhZmVaakdySFM0Q1FWSi9CL1ByQTA2UHk1?=
 =?utf-8?B?RVgyeWdSQjN0elhUbTNMOU95ZGlYVVAwaVE2MzRDUkJvdU0rSk1ac2psMTdN?=
 =?utf-8?B?VDV2SWN0eXB2aTM4bURVMU1lWm9wa3VYT2JMQTA0NERFT2w3Y0EzdjlWd09r?=
 =?utf-8?B?eS9TTlBrZG1YL2xpZUVzNUErNmVEendUZW1JTDBTMHNQcThJUlQ0cGMvSXQx?=
 =?utf-8?B?MlZ5cjMyeGRYT3BzaUFZWFZPKys1U1hCZFQrMDNWbERBenJFcjY5aUx1dDlR?=
 =?utf-8?B?WkpzUG13OStkOHlVUFUybVlVQW5oZmNoZUxJMmt1Z2RHeWpaK2FCM3NNK3p5?=
 =?utf-8?B?RktmQ2NwaDBrRko3NGhkK04zQnlReExvNi9UdTBjeFV1MXdWcGY1RGszaGEx?=
 =?utf-8?B?T2hPVEhrSVBSaUdlcFRSZ0lNZVJ2RVFPaW10bWlqYjIxVHhySlJkRFV3ZnNJ?=
 =?utf-8?B?ZjVuTDQ2STQrS0hUMXZKaExScE5LZHo4dWFUK0dPbTNNTzVPMGN2YkxQNUEw?=
 =?utf-8?B?OFFjekxZRklsK09GK0xoL01ZOTJYVkhEaHZZbFpCTlNpOFdpdEI0OFFUTkVi?=
 =?utf-8?B?dWFscEVpcnVVK1hFYUNIdkRYUnFveC91eVUybVU0c3VXMU1FaUdtN3l5UW9N?=
 =?utf-8?B?N1B3ZDhmVHYzN01EeDVFVEM2ei95Tm5MT3hMRkRtWDNmdSszTHQ2YlM0NlZx?=
 =?utf-8?B?TG1iWEozZER1REE4SXZ1OFoyRndhbEdZdlhpL3YvYlEyVytwcVV6bEFmRnd3?=
 =?utf-8?B?L09QOG1UR0lRaUg5V3M1MjI0cWJOYWlMU0N1dnhpTzdhVUkvVXpmSXh0OWVa?=
 =?utf-8?B?Z3M0SHRLcGRTQ3JwMC9tWHNLNTVMR3dOK3BsazZnU092YmZCam1XRGd5bVYr?=
 =?utf-8?B?Q3ZhVngwQ1hVSFgvczg4RjNQMjd2dzFiZDNsOFV4YXB3OUY3K2pOSkVVSXpB?=
 =?utf-8?B?d3E2RGhJZloxSmZtaGJaSm45QVdZZStxbjdnaitmZ254eklZaXRCakh0ZFZN?=
 =?utf-8?B?RFJjVWNjVlNxTjJORm1MSHR1MDFFZW1iRVVCblA1MVJ5dWFqNTNqMWk1N1lk?=
 =?utf-8?B?UHBKNFd6dFJlaVdkSEVkSm02TUc5eWVBQzREK2VYZXFmeGFyajh0ekI0ZnR2?=
 =?utf-8?B?cjRMNFUzd0tlOHFSTnBOdHl2RXJGQzNYVkc3ZXhUY2NoM3JvQk50UjJxeWlz?=
 =?utf-8?Q?p1Ug6lPb3Z/OjQje8deGHExiT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a45f5cc-408d-44c9-07f0-08dc73b49b63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 01:24:31.9554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/komPuW1xJ1pUrMTHhUdginjJpbUBI/+labUMSFBZj3jL3/ecp8/pb0pD+aQfpLcc9tW4bfbRDyNsvtBonnBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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



On 5/8/2024 11:18 AM, Welty, Brian wrote:
> 
> 
> On 5/7/2024 7:42 PM, Matthew Brost wrote:
>> On Tue, May 07, 2024 at 04:59:25PM -0700, Welty, Brian wrote:
>>>
>>>
>>> On 4/15/2024 12:04 PM, Matthew Brost wrote:
>>>> The GuC context scheduling queue is 2 entires deep, thus it is possible

Minor nitpick.  Maybe this ping will help get it merged.
Typo above....  'entires' above should be 'entries'.

I gave R-b earlier below.



>>>> for a migration job to be stuck behind a fault if migration exec queue
>>>> shares engines with user jobs. This can deadlock as the migrate exec
>>>> queue is required to service page faults. Avoid deadlock by only using
>>>> reserved BCS instances for usm migrate exec queue.
>>>
>>> So the underlying concept was always broken here?
>>>
>>
>> It seems to be broken.
>>
>>> With the mask of more than one engine, the virtual engine still won't 
>>> always
>>> pick an idle engine?  HW may end up picking an engine and
>>
>> I thought the GuC would always pick the idle hardware engine but it
>> doesn't appear to be the case (I can see a clear deadlock before this
>> patch, resolved after). Maybe the GuC considers 1 exec queue on the
>> engine idle so it doesn't pick resevered engine?
>>
>> We probably should follow up with GuC team on this but for PVC as a SDV,
>> I think we should get this merged.
> 
> Makes sense.
> 
> Reviewed-by: Brian Welty <brian.welty@intel.com>
> 
> 
>>
>> Matt
>>
>>> confusing it to have been idle?   Because the extra 2-depth thing is not
>>> being considered?
>>>
>>>
>>>>
>>>> Fixes: a043fbab7af5 ("drm/xe/pvc: Use fast copy engines as migrate 
>>>> engine on PVC")
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_migrate.c | 14 +++++---------
>>>>    1 file changed, 5 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>>>> b/drivers/gpu/drm/xe/xe_migrate.c
>>>> index 9f6e9b7f11c8..c37bb7dfcf1f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>> @@ -12,8 +12,6 @@
>>>>    #include <drm/ttm/ttm_tt.h>
>>>>    #include <drm/xe_drm.h>
>>>> -#include <generated/xe_wa_oob.h>
>>>> -
>>>>    #include "instructions/xe_mi_commands.h"
>>>>    #include "regs/xe_gpu_commands.h"
>>>>    #include "regs/xe_gtt_defs.h"
>>>> @@ -34,7 +32,6 @@
>>>>    #include "xe_sync.h"
>>>>    #include "xe_trace.h"
>>>>    #include "xe_vm.h"
>>>> -#include "xe_wa.h"
>>>>    /**
>>>>     * struct xe_migrate - migrate context.
>>>> @@ -300,10 +297,6 @@ static int xe_migrate_prepare_vm(struct xe_tile 
>>>> *tile, struct xe_migrate *m,
>>>>    }
>>>>    /*
>>>> - * Due to workaround 16017236439, odd instance hardware copy 
>>>> engines are
>>>> - * faster than even instance ones.
>>>> - * This function returns the mask involving all fast copy engines 
>>>> and the
>>>> - * reserved copy engine to be used as logical mask for migrate engine.
>>>>     * Including the reserved copy engine is required to avoid 
>>>> deadlocks due to
>>>>     * migrate jobs servicing the faults gets stuck behind the job 
>>>> that faulted.
>>>>     */
>>>> @@ -317,8 +310,7 @@ static u32 xe_migrate_usm_logical_mask(struct 
>>>> xe_gt *gt)
>>>>            if (hwe->class != XE_ENGINE_CLASS_COPY)
>>>>                continue;
>>>> -        if (!XE_WA(gt, 16017236439) ||
>>>> -            xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
>>>> +        if (xe_gt_is_usm_hwe(gt, hwe))
>>>>                logical_mask |= BIT(hwe->logical_instance);
>>>>        }
>>>> @@ -369,6 +361,10 @@ struct xe_migrate *xe_migrate_init(struct 
>>>> xe_tile *tile)
>>>>            if (!hwe || !logical_mask)
>>>>                return ERR_PTR(-EINVAL);
>>>> +        /*
>>>> +         * XXX: Currently only reserving 1 (likely slow) BCS 
>>>> instance on
>>>> +         * PVC, may want to revisit if performance is needed.
>>>> +         */
>>>>            m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
>>>>                            EXEC_QUEUE_FLAG_KERNEL |
>>>>                            EXEC_QUEUE_FLAG_PERMANENT |
