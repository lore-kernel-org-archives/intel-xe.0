Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54072CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146BA10E00D;
	Fri, 24 Oct 2025 19:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8egdnwa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E85910E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761335283; x=1792871283;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uOkr+C2Cn+GMU+92pja2nOqeL11Ybxg+7N6tjdoxe/M=;
 b=R8egdnwaNjphZelLGczV0pJnGbCDBNg4YG6dTcNi1iypz5LicsCDIbBG
 UCUDCmFdG1Uzc0rYQlMMtQsKkKK9w9uWTAHl28zLg/7Wn2vbK6kKin7pq
 rFtvKtmSystQJClqJqZw8d5qMkEAjiJiWRjNqiXcE5FWFiidHew8vj/Zq
 rgBbwzu5v0MvDXcRaQ8cBXrHxw1qedbZDWqpiIuxtKlEptxRu5m2fJkAO
 XGf+62lV/LnCv9hm8jK08eHTAGt43dxTXAtum+TNvKahUj8SJMCGat+Xo
 N2Lken4vEsv0NkdwL8z4fMDwsBeMyL1w4WpiyjG8ZcU9SOMS2vklwdd/H Q==;
X-CSE-ConnectionGUID: e3NZRD/zSTKhjt1+0RJ4Pg==
X-CSE-MsgGUID: oYkAQrDJQ26nD0EwfyvVRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74193297"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="74193297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:48:03 -0700
X-CSE-ConnectionGUID: Prnla2QySFSL8KNMVH3dCw==
X-CSE-MsgGUID: HnRLNtm6Q5aBWLXqR12eOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184420047"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:48:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:48:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 12:48:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:48:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcXfclPBCM8UtCTPpGGzC4LaxKcHqGELHSPXHO3zGfh23rshsvERKp9ZzqUtSfXJMEPuC+vAZiClrQAfgNn28mgq1L0Bu0CX7ls6U5ztrLnjkGskrzsJRr0jjaD/mjkeFKRheRfGQYDKpsswtuyzmkw8ja1BYZkReNa85n4lsDyy0Qnm2cOY2fqQYntk3jI0s88NGCXuv41970WhlZec31uUprJJKL5lvBY3Q189Y5X/L9GTkAx22chWsRq5s6i0ZUSTERjVm9nwCizavscYnDZWi+GH4qlI1dA6RZukA+fqe1SqHD33jKVgAZAAorx/Z2xNecdZXklsWeFE4Ry9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDadiDhsRHTHx+Jwzf5ibtUeg+5EZ75xbeXfz7jIcew=;
 b=T6eBQFxHhSHg4kKFmvzdhODWy7QWT6n3SoVvusk4evms3Q/9XNTU2LSzC+TbEpEAKHWWSyujfAHpgvWLIpglCc/2LRv8DqhbWTamOMSG29RCaIWtXKfsNk7v8yQOJTGwJVQoo0t3Gr0QA/s4je5tW4LKQj65a9NKQLmTUI+mdGADQdBfHOpDX53qn/mPy1hpuXV4dUd9GHbCIbVG6IjCQeZrLaEXYJlH6EyTrrYdgHbXmHw3oovyuUpKWqsmssBhnclvkxQzPYxmoDSW3y7HAcWB88AUQKfMy4u4+prgYxqKQxersM5+S3OU+vRFcoRxEmMTTnBCyKtzMfk3qhStUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 19:48:00 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 19:47:59 +0000
Date: Fri, 24 Oct 2025 15:47:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 12/14] drm/xe/pf: Add sysfs device symlinks to enabled VFs
Message-ID: <aPvX7K8DhE6wXnR8@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-13-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-13-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: f81b376c-ada8-4ede-ad58-08de13363c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0ZBTXJzWjdsdnpmS1ZKWFFSckpWaVRuNmZSUnVZVEU0ZFo0OEZhcGNpbXJx?=
 =?utf-8?B?NTR4eU1DSzlKWGt2b0pnZzdGbkh3N0ZlcGVCQUYrOStnbStBQVhBcEkxeDVl?=
 =?utf-8?B?aGp3dWNjcTMreW1GSGE3cDJCOUNiaFlOZHlFUFZMVlRnSmM0N1d0RmZpK1JG?=
 =?utf-8?B?dEpOSVk4ZUxuUXhJdWtJOUhRK0tnMEZRdTN5VEx6c0RmcWtaNnlpRjdkRGdC?=
 =?utf-8?B?OGFVTnBBZjBMdjM2a05kYmoxN0pKRGZaaHQ0NEtUS0xsWXJlQklYVTdSdkdu?=
 =?utf-8?B?V294MjM5YkgyOWpiMVBqSGdPdmJQejJhVnhxNEtvNklJTmN3RE9qSTYvb2RX?=
 =?utf-8?B?Uk1xVkFKcW1QOFlrQWdhc3Yveng5TXA0eTNLb1J5ZmtaaldpNUk5U042eU4w?=
 =?utf-8?B?Z25oUkhOaGYyeW9oRDZKdUNxemlSSENnRWJvc1hkbDdHK2gyOFVtM2krR0hV?=
 =?utf-8?B?THNJRW1KRXUxWlR0Rjh3a2htU0YrSTVBN1UwYThmaFd5cDVnSGRwdHNIWW94?=
 =?utf-8?B?Q2RaTlFmWk9WZkVwdXptQWNHeGNUZzdkMUVramkxUTVGVUYxNEJlN3VtTmcr?=
 =?utf-8?B?ZUFaeThuMUxzTndYWXI3WUczeFh1REU5em43N3MvZGwzMkpQT25QMDlxZ0FH?=
 =?utf-8?B?aWFOTnhTbmRib250NkxIMWRiZmp5L050bktHWDBNVEpmSEhoN2JrenU0ZmNJ?=
 =?utf-8?B?OXFVYWdqODg5SFp3YkpRTGtsOGNwREVNNFZHamtHYWxuSHpYdkFZcGhkd20v?=
 =?utf-8?B?WEQzVUovVFNyR2lzS2pPZVJZSkJqL29lZlEzMU5OdC9JZ1g5b1VySGo0Rk8v?=
 =?utf-8?B?cXh3RDVIdnRPSVVZNHM5K1VZVkljT2kyQ1BUeTltTno1dy9vajFXcDdnOFBH?=
 =?utf-8?B?eStZanBnV3B2NkhGWCtGRzhZNDBkbEl6ak5OUXF1MnNZa3dVZjluSGpONjh5?=
 =?utf-8?B?YkZ5Z28zSUFzcDBzbnR3UTlyRWdiVlZlMUcwWEdNV2xhS0NiOWZrNjI1YzNJ?=
 =?utf-8?B?YzRxcUcyZEs1aURtOWNDbzFsUXBKNlNGNzR6SzZ0NWxMeUJRVWVyUEQ1Zmwx?=
 =?utf-8?B?dSt6aG5WOEhRaFRBUmRPWkVEQnIxSTRHVURodnJ6SFJhanQ2V1l5WkkvZVlk?=
 =?utf-8?B?eVFmQUk5dmdkTy9hV3hibWpkRkF4MlZmL0VBSFI0K3ZtNEsrRUJwRjZXM2M4?=
 =?utf-8?B?UGJtRGxaR3VOYUtPUGhLY1VkSUt6NkQvSDZqMWNNR3VmUzdoaHVGNm5RMHdo?=
 =?utf-8?B?eEIyemluU1lGMG9OUVcrSHJDKzlZcFZISTJpdGZXMjY0eVNoQjY5UHRpalJv?=
 =?utf-8?B?MytUcFVVUFJXcHFkSTZHd3NoOU9icnliUnRSaUZPQUpaMlkrQXhJbnVyNnJJ?=
 =?utf-8?B?TlArVmFUVjlOakhWQzdoWFhET09ucWwxRGVXZFVHUENtc2VkMXVQZ3NaZEx0?=
 =?utf-8?B?MkZ2Y3JJU0UvL2VHU3Z4dGJPOWY0b3lRYUNXajFTWGl0Q3FCMzJzanpxczd0?=
 =?utf-8?B?UFJWZ3NuVU5XQ2w4eHlLSVR0ZmNLVXRTU2NaYmQrTnZOQTZtOGI2dGdZYytq?=
 =?utf-8?B?K0FqQWlHcjJUaXZKb2I0bEticGR6YXJEWEx3UXczL1JaNUFvd0tjcmp1R0Jn?=
 =?utf-8?B?QXpiZ1U0YnpwRXhnNE0yMVpzclBoOHZQSndPUGhidkxYRVhKc2NaeGthSUs2?=
 =?utf-8?B?SDVnaEZ4MGJrQ210MEx2K1NYSVBFRlVWMDZLODBFbzBoa2wvYmRQaHhiS0pp?=
 =?utf-8?B?MzU5OVlpYjVvZkNZQzY5bmFBTEN6cmlNSWtxcVpUU1lLMzNyRDRBRHlqUlZj?=
 =?utf-8?B?Z3R1dEV4YkdWRUt5VE84RnBlUWh6Nm4xWFVZSzhZUUFEdFlFQXlIU2VlNUEy?=
 =?utf-8?B?ZmZxZmUvRTd0UUxQTHN4SjZmSE56N2hQdWhmeWV6QmdrYjFibzVpUVlpSUFM?=
 =?utf-8?Q?e1VTuGPSEZnwjo+wSrfYfBU7PxBEy2Dv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUhwMi9icVdDaDRsUVNmTjRqWkx0Z1JtT1hITzg0YjhvN05Wd2svMGE1bGdW?=
 =?utf-8?B?SnJsOEZvWkt2YmFsOUpJTG5iUmdQekhvcXlkWVhOSytLbmgyK0pBNm9lMTZJ?=
 =?utf-8?B?VGhheTBDV3Yvc3UzWEhPTDVNdWNEU3lDa0YrR21sa25JeXl3bUdiMVpzalU0?=
 =?utf-8?B?RzVGcG05Q0dLMTV3MFd3TnFFS3NuY2N4aEZveVdDNkdid0dSbFlzTlpqMnRl?=
 =?utf-8?B?VThwRDFuQXo0S21LK0FpWjhXZjB5QndFallaWVkvd2FqTmdNM0lic000bUVZ?=
 =?utf-8?B?UXBoaHdEMXRGQjJJZysvRmFhTEZ4UzZGY1ZZS2pINUxlSFRzZmViMXMxeHgr?=
 =?utf-8?B?UWludS9zZTZPTkxodFU1SjBXd2F6STRmaFdrWWVSNVAwYzQxbnBhV3FxQmhP?=
 =?utf-8?B?ZWpyeHdOMUtDR2xoR2RKYkxDc3dWd2RuK2V6OENJajFxZUxDeFJ0ZUMrZ3VN?=
 =?utf-8?B?VVBvTnB2cXIzdWZPM2J3a09IODBtbjg1WGYzWjlrbjJVdDRsanNLaXp3V01U?=
 =?utf-8?B?ZnVqSzIvT08yczBsejVxVHZwZkNtaGg5T1ljejUxSmlwVDg0allVUy9KTDJx?=
 =?utf-8?B?R2xaUzkyQktuMWNNdzRMQy9KZ0gwcmEzV0dGd2ZDdGpDVEV0ZlVFU204ZHdi?=
 =?utf-8?B?bzJqdmVONWwraHZ1a0pSYWdiQUNPTGpIM0MvcTlyMit6WmEzNzFweE5tRTZa?=
 =?utf-8?B?MC9MUGRkQUc2T0lSZE9IQnZxRG85TlFqcVdHN1U5SGk0ZVBtUkc4VTh2NVNr?=
 =?utf-8?B?ZlJzNjNlYkN1aWRIa3V5ODhGSWI2b0N4OXhuajg3NCtnY0dhMnB1SVUxdlpI?=
 =?utf-8?B?V29hekpLVTZLS2FwZ2pkK1g3N2ZpbEJqZmNSQkovbitwNkViODFweVRMSmVU?=
 =?utf-8?B?SlprNXBLYXV6LzJ6K3lGanZRWHBjd1FQZ2tkazdMR3BpNGc1ZnV1dEo0YUxl?=
 =?utf-8?B?Y0JSeGZrdXo0WlFzS1E4M1hMQ1J5WitRNTZZSDl1bnBhdTRXYVpEZnk5bEZx?=
 =?utf-8?B?b0thMUdQUlJuMlpHQXZtMTl0dFUxR0tnZU00RjZEcHJRY0lZQUpWSWxSV2Zl?=
 =?utf-8?B?NlB5K2YwZzVVVFBDK29jRUFwRTZWWWI2enN0UFpwS0g0TFg3aElEa3dZeXhX?=
 =?utf-8?B?a0ViNzVqRnY5UWZtRHNWQ3FTQVdMa2dnL1Q5cTVZUzZSYlFQQnRBNDhxdUFz?=
 =?utf-8?B?dGtvNlZNQ3B5bTJTbDhjb2N4NGR3MWNCOUxibHk5cCtWRHJNR0xwcTJMc1U1?=
 =?utf-8?B?MmtjNndwZUpsRENYcEpXV2NkdjQ0L2NzVGpFVi9ZRFBVMytCSlVzWFQwODdW?=
 =?utf-8?B?eDNmVTlFNm5wdFRIcGdSZjNpMGgrWnZ5VTZMaURXMnM0dzdmeW9oSnFPcEVy?=
 =?utf-8?B?cWMzcjBMUURWcTlHRWNYZlU1TWxPQm1TVzh5VDVGT0lYT0lPRUxhTnNzZnpT?=
 =?utf-8?B?WENVY0c1alJxVHViWExRMjRXekJIV0syMlhxMEE4d2VZY29halZCTUFtS044?=
 =?utf-8?B?aVI3ZFFLeHJiYWVIblNLMXBLcWpLV3RQSkIyRzVzQjcvUDRjM0g4MFlWajV4?=
 =?utf-8?B?cVRsY1hLbGpsdUhXSXFVbXIyRE9aL2dQNTRxaW9xeGpQbmZlcmtPRjRyVmlX?=
 =?utf-8?B?K3c0Mkc3U1hCT1pEMVNSaEVPRnd4ZHd5dmJlRmhZd0pSZ0xkcEwyZXRjKzhi?=
 =?utf-8?B?czNWVDZNMGFjNjlYQjNobWZId2dmbU9BdDZMN3E3NGhTVGNzL1VzQ0xZSC9B?=
 =?utf-8?B?eHkwdW1DaFJDUU5HS2haNkI0cllObkIvYnNyNmpyYUI0VkU2RFA4blpCT29D?=
 =?utf-8?B?OVRWVHhmd2l2L2pqOWphUVEranNoWlo5azk1WnN4Q2tKSWNibEdQNFdjQmVM?=
 =?utf-8?B?eWRNWVBPZnJia0tMUXNXeFhQUGIvMzhIYm9nZS9RaDl4bVdkUUtnREdLbllX?=
 =?utf-8?B?eHNwSkZvcGNKa0VMcktrWE5OS284Q3I4WldxcGdWZm9MS0FWTWRLWkRLNUo5?=
 =?utf-8?B?WC9kSHEvSWFySHIycExrQnpkbDcyL1RXeG12WGg5M25JVG9FT1lkclNrNS9K?=
 =?utf-8?B?QWtwK21oVDRWOUN4Njh1NlJDWUN2L0g4UklMM3E0WUVqT3kzalg4VDBHY28z?=
 =?utf-8?B?N3VNYlc3QWRqckFsdUU1V0pqRlh3RnA2dmxCZ3ZTSk5XbkE2YmJEVHd2K1cr?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f81b376c-ada8-4ede-ad58-08de13363c71
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:47:59.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+IPlwPVinWBvCyzD8XRi2koJg64R7x13WDX89N6L4lh+33dN9ZZnP9qPJf+kCXW7QLzEpHrPmYw40WUMDYCvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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

On Mon, Oct 20, 2025 at 08:24:12PM +0200, Michal Wajdeczko wrote:
> For convenience, for every enabled VF add 'device' symlink from
> our SR-IOV admin VF folder to enabled sysfs PCI VF device entry.
> Remove all those links when disabling PCI VFs.
> 
> For completeness, add static 'device' symlink for the PF itself.
> 
>   /sys/bus/pci/drivers/xe/BDF/sriov_admin/
>   ├── pf
>   │   └── device -> ../../../BDF	# PF BDF
>   ├── vf1
>   │   └── device -> ../../../BDF'	# VF1 BDF
>   ├── vf2
>   │   └── device -> ../../../BDF"	# VF2 BDF
> 

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c      |  5 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 93 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h |  3 +
>  3 files changed, 101 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 678e76703cd8..fb2fd1d9066d 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -20,6 +20,7 @@
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_provision.h"
> +#include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
>  
>  static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
> @@ -138,6 +139,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>  	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
>  		      num_vfs, total_vfs, str_plural(total_vfs));
>  
> +	xe_sriov_pf_sysfs_link_vfs(xe, num_vfs);
> +
>  	pf_engine_activity_stats(xe, num_vfs, true);
>  
>  	return num_vfs;
> @@ -165,6 +168,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>  
>  	pf_engine_activity_stats(xe, num_vfs, false);
>  
> +	xe_sriov_pf_sysfs_unlink_vfs(xe, num_vfs);
> +
>  	pci_disable_sriov(pdev);
>  
>  	pf_reset_vfs(xe, num_vfs);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index a6be3c88fa4f..c68acf6cd34f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "xe_assert.h"
> +#include "xe_pci_sriov.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> @@ -43,12 +44,14 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     │   └── sched_priority
>   *     ├── pf/
>   *     │   ├── ...
> + *     │   ├── device -> ../../../BDF
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
>   *     │       ├── preempt_timeout_us
>   *     │       └── sched_priority
>   *     ├── vf1/
>   *     │   ├── ...
> + *     │   ├── device -> ../../../BDF.1
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
>   *     │       ├── preempt_timeout_us
> @@ -422,6 +425,11 @@ static int pf_sysfs_error(struct xe_device *xe, int err, const char *what)
>  	return err;
>  }
>  
> +static void pf_sysfs_note(struct xe_device *xe, int err, const char *what)
> +{
> +	xe_sriov_dbg(xe, "Failed to setup sysfs %s (%pe)\n", what, ERR_PTR(err));
> +}
> +
>  static void action_put_kobject(void *arg)
>  {
>  	struct kobject *kobj = arg;
> @@ -488,6 +496,29 @@ static int pf_setup_tree(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static void action_rm_device_link(void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_link(kobj, "device");
> +}
> +
> +static int pf_link_pf_device(struct xe_device *xe)
> +{
> +	struct kobject *kobj = xe->sriov.pf.vfs[PFID].kobj;
> +	int err;
> +
> +	err = sysfs_create_link(kobj, &xe->drm.dev->kobj, "device");
> +	if (err)
> +		return pf_sysfs_error(xe, err, "PF device link");
> +
> +	err = devm_add_action_or_reset(xe->drm.dev, action_rm_device_link, kobj);
> +	if (err)
> +		return pf_sysfs_error(xe, err, "PF unlink action");
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_sriov_pf_sysfs_init() - Setup PF's SR-IOV sysfs tree.
>   * @xe: the PF &xe_device to setup sysfs
> @@ -509,5 +540,67 @@ int xe_sriov_pf_sysfs_init(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = pf_link_pf_device(xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
> +
> +/**
> + * xe_sriov_pf_sysfs_link_vfs() - Add VF's links in SR-IOV sysfs tree.
> + * @xe: the &xe_device where to update sysfs
> + * @num_vfs: number of enabled VFs to link
> + *
> + * This function is specific for the PF driver.
> + *
> + * This function will add symbolic links between VFs represented in the SR-IOV
> + * sysfs tree maintained by the PF and enabled VF PCI devices.
> + *
> + * The @xe_sriov_pf_sysfs_unlink_vfs() shall be used to remove those links.
> + */
> +void xe_sriov_pf_sysfs_link_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	unsigned int totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	struct pci_dev *pf_pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *vf_pdev = NULL;
> +	unsigned int n;
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, num_vfs <= totalvfs);
> +
> +	for (n = 1; n <= num_vfs; n++) {
> +		vf_pdev = xe_pci_sriov_get_vf_pdev(pf_pdev, VFID(n));
> +		if (!vf_pdev)
> +			return pf_sysfs_note(xe, -ENOENT, "VF link");
> +
> +		err = sysfs_create_link(xe->sriov.pf.vfs[VFID(n)].kobj,
> +					&vf_pdev->dev.kobj, "device");
> +
> +		/* must balance xe_pci_sriov_get_vf_pdev() */
> +		pci_dev_put(vf_pdev);
> +
> +		if (err)
> +			return pf_sysfs_note(xe, err, "VF link");
> +	}
> +}
> +
> +/**
> + * xe_sriov_pf_sysfs_unlink_vfs() - Remove VF's links from SR-IOV sysfs tree.
> + * @xe: the &xe_device where to update sysfs
> + * @num_vfs: number of VFs to unlink
> + *
> + * This function shall be called only on the PF.
> + * This function will remove "device" links added by @xe_sriov_sysfs_link_vfs().
> + */
> +void xe_sriov_pf_sysfs_unlink_vfs(struct xe_device *xe, unsigned int num_vfs)
> +{
> +	unsigned int n;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, num_vfs <= xe_sriov_pf_get_totalvfs(xe));
> +
> +	for (n = 1; n <= num_vfs; n++)
> +		sysfs_remove_link(xe->sriov.pf.vfs[VFID(n)].kobj, "device");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
> index 1e6698cc29d3..ae92ed1766e7 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.h
> @@ -10,4 +10,7 @@ struct xe_device;
>  
>  int xe_sriov_pf_sysfs_init(struct xe_device *xe);
>  
> +void xe_sriov_pf_sysfs_link_vfs(struct xe_device *xe, unsigned int num_vfs);
> +void xe_sriov_pf_sysfs_unlink_vfs(struct xe_device *xe, unsigned int num_vfs);
> +
>  #endif
> -- 
> 2.47.1
> 
