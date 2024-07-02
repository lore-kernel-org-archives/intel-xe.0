Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126C1C30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 22:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED2D10E4A1;
	Tue,  2 Jul 2024 22:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANxlHLLa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C47810E4A1
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 22:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719960334; x=1751496334;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aOTwD4tH0ZUSytwdfw70ECko37v+tpnprAK5wAJ8ji0=;
 b=ANxlHLLalwGcJXNHhCNJMOtvgawVIv+h1IYU+cq7bV+B8TNcvKhvO6+k
 IKdKv0P/fIe5o9PvW2dCj146OXBYr/7uA9vXdp+NQv7obOGQEBuJu4iCO
 iHpKix63asq7sPQjCVGfYBkNIBsrKOQSxBR2bLdwnoCPqZ6ggEQZL+0+i
 5UfMkM/YJEhEsojoMgk398oGK3qe3Gzb9XUp6KxRxaXb5PtNAWb3UUB3C
 suY5GmAOjzglgvKw2PuBYPJDxjq3IafLNKjdDInslQ9FODajRN7NXom2I
 IA8UOdLqiGRIk2Ivsrbdodvh0OevrUW+VV1eRQhtbqYirTKs9NoGxU78k Q==;
X-CSE-ConnectionGUID: OnKMZADzTwmH66W1EImPAQ==
X-CSE-MsgGUID: sAeO7+w9Rbqe43hVJbE+xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17040326"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="17040326"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 15:45:32 -0700
X-CSE-ConnectionGUID: lc/ZasKPTVuZCGDyph0FLg==
X-CSE-MsgGUID: lnh58pX9R0mRbis6U76oBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="76782551"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 15:45:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 15:45:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 15:45:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 15:45:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktyQ+VqbQrzzW+Y7GZA5QaO2YlfFSZDjsnwPh720BfrS1YM4igGtEiaVDKt9gZOUqBm9clCUVZZ3u3MW7WlpxvFg6oN/r2+M64tYHiTR6nMcWUuh6dNxQNyVxQYCje86Pmak9JikM9deRvc0mvRBlxl9KmCzoQZxBz2FTz9Sr05gni/psct85U6I9bBCYK1J3xp2//VnhOkDEseDBe9DCaHpbweaRZCnXSrKsydoJXD8x6ov0m8ws2/IFEvrbn64kmnMWBrzBpxP5ypGniMt7qla2BHbd+4gtJQuCXb4E1noKYx0vocT3miIDYCgA4P6vw86AiU+yHDRr89R56P9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8Drr0aEHkkeFSFgB6ZTJcLwVcRHmWAU8Dy/Y3OMAT8=;
 b=mHt0HFmt3jUhHbB3sTb5caG00WMLLu5dIEE1Zlm2V2j2G62yKScUyHhnh1CGIRcGI7oVM2SWYAryg95TeL3qH4wJSBKGHCgTDDh467B0qBJ6GQSGKS6XPAF8rz6oBg1FYFy05WnVhcXI3PhhOmhfCbo9C42nMZxQF4s0MpvXYqQv0XW/jSg8kLDafsM9lGSbyhO7ItT4TkEuIrD0EyDV+qEu9lh7Xp7Uqq+qF5GhKAzaMbtMgNbPnm0KnfpoRF1+3VD7hBInGH6C5uNh6T6dXCeIDsfHZM1QKCXsOJJtcuMr+GF3YtzL8KdH3HLaR0Xjq1XHhhDsaP1nDgCWQ6Z3lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 22:45:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 22:45:28 +0000
Date: Tue, 2 Jul 2024 15:45:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Jose Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Rename xe perf layer as xe observation layer
Message-ID: <ZoSDBuvL/b07eXRs@orsosgc001>
References: <20240702214034.2507446-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702214034.2507446-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:303:86::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a76370-24fa-42a3-c49b-08dc9ae8abab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vzk0cjMzL0RNVTlhcGRLeklkUk1odlowbXZHdlBkbGRTMm0yeWtKeEw5L2hC?=
 =?utf-8?B?eCtUV2hvQmVrQTdQckZtWktRUVZKY2hhb1hCbEs1d0VaazVxSFZKTHpBZjdT?=
 =?utf-8?B?bUhqaGgrOXU0bjRxUXFyQzBiekswQXYvcmhvWkxBWE5ya0lOenVIUVhiUnJS?=
 =?utf-8?B?di9tc0ZOOFVYdGRNb0hyYmhYSU9FM1BlNW90d3dPWXNFeEVCbWNHdWNCMGNZ?=
 =?utf-8?B?Q1BNclZ0VXhQRGdpUEIya0R3eVl2RDg2YnFZTFcwQUoxY3BWc2hGSnluRnhC?=
 =?utf-8?B?K1ZGMmIrelFKZkt1cllsL1dRTklpbXdrNnVBdHZRbnI2d1lwektsN21FYnhP?=
 =?utf-8?B?aG5obEJrb0NhQ01OZFV4UDdmSUthS2t3VlFROHpacVJwdHNHZ0p4SncvWjRw?=
 =?utf-8?B?QS9mQ280TGNlYWNycXU4Z1pPd0IwbzRJV0F0c0gxQjNCeFlzUkI5TXVGUGpy?=
 =?utf-8?B?Z1hSZlYrbkJmV29JemFNbmpDaVlwbURQVGpNOHM4TTFQM3pFZC9kSFg3WDMw?=
 =?utf-8?B?Nm9YeTROYThYbWwzdGJ3U2pxWTlXdzZzQ2poVk12UHJzUVlBZ0NZUTdDcEZR?=
 =?utf-8?B?aDREV2h6ekxSN3pNTVpsRVZ4Mkd2TlBHRG1EbExQb0FINmpPTVJUYVFTdmNh?=
 =?utf-8?B?dXZDVmJ3b1hhMHNGT0xpd25JSzRKMHFKRXVYblpNRHpkbzJOMkNqQzBiMGkz?=
 =?utf-8?B?U0s3OThKN1l6bGxSc3hndkIxTUx4MWJWTDdQMkFoeXNCZmdXeTN5QnVRZWdS?=
 =?utf-8?B?YjZla3lHSURCZy9ZOWl1SFZGMTZxVHREVktYdk95cG1wYlJ3bUFXcFhydEhY?=
 =?utf-8?B?WFUzb3pma0EwTGgyY2hteVB0ZkVneXNYclhLNkZYMGdLVEVjUncxRGpnOURM?=
 =?utf-8?B?OWw2SWpsamlJZUJRRDdWMTlvbHpWa2h0OERjdld5MFZVcWRhTkRpUWptWjlC?=
 =?utf-8?B?NnR6NW5WNnc2QzRKQ0Q5MmIxSE9KU0ZDS09xalNXYTZRbVVlb2RMSFFlNG1i?=
 =?utf-8?B?bGh0WXNOY0pEQ011NVRXT3BzbEpHTWg2VmptOVJDaFREVHdLN1pPTDZHZS9v?=
 =?utf-8?B?OWp1MCtUQno4SDRBc2w4SlJ3em9GUHlqUlhLdWV1V01rSzAzMHV6ZFF4Wllz?=
 =?utf-8?B?Z2NpUGtodmg4cWlIcGxuOFl3QkxuUXdwZ2xKTlFVM0I5MVVBdTRJc2VJdjdB?=
 =?utf-8?B?VmxSUk9EcHJVSkcyaVE2UElTL3pkaTk3TjNPUys3eVJVR2tUOCtMSFFUSlV3?=
 =?utf-8?B?UDlNTi9mcFNJcnJCRG80SjBYbTh2ejNxZ253T2I5NVhtUThINVZOY0d1UkIy?=
 =?utf-8?B?cGVFdVE4Q2hIeDlUQkF2dmFwbC9ONHdLRm5qWHNJNzNPdWZLUVEzRkNoTlNK?=
 =?utf-8?B?YlhMR0pmK0lqdWpsT2xjNmZFSW02T2VFZTV3Z1pBR3NvenQ4VzZmV1ZGa0FD?=
 =?utf-8?B?K0NJeko3aEFPQmpxY0VTVVhkT2lObDJvbFZ6eVJpYW82MjZPQjVudnFpNzR6?=
 =?utf-8?B?Nm5yYk5PK3lrRXNjVnNDSkZIdjd4eUs5SE9pakp2N2hDc3U0QUlBRE56WkFV?=
 =?utf-8?B?eWFnem5xa0NaTXY0QWJ4UlJkbFB6RmVWcllYb2tHL3lsa1Y1VnozL2d3SWRy?=
 =?utf-8?B?THJsbzN4SFJ0MXh0dTZpK2ZHdWdUNVcvQk56b2M0a3VFYlBwRHlLVjhFUjUz?=
 =?utf-8?B?czR6NzJPSzIxK2UyNHNiU1FFMmZ0MlFtTm1CRVNocU5WT29jd0RDRHlJSm1s?=
 =?utf-8?B?TDJ6UVBkWnhKckhJYzJLYytTV05SZFNFWGR2MUc0Z3dOZ2c4M1ZtYlZzK0hC?=
 =?utf-8?B?aEdxVE1XdlZ3UE1vSldVQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJ0ODI5eVpMaTVTZ0tManc2T2pOd1hIR1c0TEZqbzFhWmNRUFRndU9XNTAz?=
 =?utf-8?B?L3pQZzBHaXE4UDQrMXgvaWtnUmNMN1NDU0RDeXBzUEtaMjByMWtndHVKWGF5?=
 =?utf-8?B?MHJ2MGR3NStvWm82WVlVamZsc2dUYStFckc0emIxVHRpZGd3ZGg4KzhiNXZz?=
 =?utf-8?B?dkc1V3dreHRTdytmcXNWeTlONnlGcE9rVmJ0MFBNNUM1dk9DZkR4NG9XT2dF?=
 =?utf-8?B?Vk41dHBka0tLN3FRdlJycjRFVkhWVjU3RmFhNHN1eUwvK2syMHZ3Y3QzNzVJ?=
 =?utf-8?B?My9qMjliU1o4d0UrVVhQZEExM1NTRTM1NE5vSWtLUUJsNEdoZWNFdkxGc0Qr?=
 =?utf-8?B?S0pITHJlVGFDV2VyVDZuSUc0aFpkbVVvMWc3SElXelo2Q25uZjFCNVFoM01r?=
 =?utf-8?B?a3pZQVBnVFN1aFJqSk5odWhROWwySWlTZ1ZtUE93Q1h4ZGNMT0N0Y2lwb0RB?=
 =?utf-8?B?emFYMzgzcFBCeDF0amVCd1A0T1dVTW1UaGo2ZTZMQ1FYNjNkUHJMV1JwL0xw?=
 =?utf-8?B?eWNmS2NDY0Qwc0lNd29hbzVXVmJQeUhEYU9KZlFxSTU0OGN2czRwdEIwa3E0?=
 =?utf-8?B?SzR6UHh4WUlQWDRsMTA1eEx4Uzk4OHV0N2ZMRFdBZGlJRGFBM0RqZm9CeVNp?=
 =?utf-8?B?dDJqR1VoNVR4bXpiN2tXWlhVUzc2T240S0hRbDljUlQvcWpCbUNjTFNOUUNM?=
 =?utf-8?B?K1oxMGg3NU5ncmNZcVc0bXRrVFgvcnl4QWp6dVNKZkthbkp4YjVVMlp5b1o5?=
 =?utf-8?B?bEVzWE5JK0hkZi85WE81K2pPcTJ0V0pPemJibEp0YUFhSUswT013c2JiTWdG?=
 =?utf-8?B?ZE95YWtnZkhDVkpEeVZ2K2ptQ1JaTmZMQnYwZWtXaHhFY3pSZHZQcWhrbFk3?=
 =?utf-8?B?eGk0UGdMSHhwaWErUEZnc0ZobzhqRlRIenV6R1NkRXZEcjZ5VXZ1c0Viblpq?=
 =?utf-8?B?VE5uZVJqVlFEekpmemRoTTgzYzZXVlFvWnB0elIwdkxYUFlEbEIxRjRWVnVw?=
 =?utf-8?B?TjZtMHErMXJpMFhaeXFOTlNJSXEyUW5yR0Q4Q1U1OThMVDBVSWVEZk5VeUxX?=
 =?utf-8?B?WlhqYTBuZnIxNHZsREs4cFljbmlJQU1TbGdOb29ZaFFXNWNkUGZtS3V4bVpo?=
 =?utf-8?B?TDVhbkxUT1RsMk9uckdZWEppeTVmRkdHTGMyV1N0M3M0WWg0NzBDK3o1WGZB?=
 =?utf-8?B?YW5JbldnUnZReVE5WFhjWmVpZEpTT1JFNUFNL0x0UGZ6b1NnbFppMnRpaVNs?=
 =?utf-8?B?MGFMKzdtUmY1NFRoZkw2a1EvSHB4STNzYzNsSXpDejRrMENGYnVnT09JSk1N?=
 =?utf-8?B?Z0xvdmhVWFl6bkF2TkVmQnNETG5oUVdrdndlbVd6cmx4cHFnR2NYdmpMOVFU?=
 =?utf-8?B?dFhlcGRWVy9URWtSY29BbjdCcWJOQVRUbjZDSmFkYWF1ejZHdlVmWFZmVjg2?=
 =?utf-8?B?Y2xZMlFxNGdsYlR1eU1MVmZBRlM0N3BLZ3NJU04yOVEvNVVrZkNGZjBzeDVX?=
 =?utf-8?B?MmdubmlBQ2NaYXlzOEJheEdLR3czOVo2bVRiY2JUampmZVNINW1zblB4MHF5?=
 =?utf-8?B?OHJ6YmFPMUdwdEdlaDF1anJIUUJ1TDk0WGkxeVNwZEFsaitSeGtYN1NLekp1?=
 =?utf-8?B?YnZsbHcxT21pUHlzWDViUWh6dXVCc2ZFWHU2UStaa29JcHB4SDkvNVFwZmN0?=
 =?utf-8?B?d1RKeHFZNEhuQW9XZWNXQUxDa2ExeEUrcW5zZ2tWaWxaajRKYUxsQWFRckd4?=
 =?utf-8?B?bkpVeHZHSEpFNUx4eTl3TERieUJlZCtRZjE0YVl4cHRBd1hyc3VYeHY0S3U2?=
 =?utf-8?B?YTR1M0MwZ3FzY1lZZldZR1FCcTJUb1ZubmRPdDRqNm5PZEF2b2NOOUVLZHdz?=
 =?utf-8?B?RmkvYjF3UmhxR3FQeWJ1ZmZGNjY4L0RBMGx6dHVuZTBJUElYMy9iVHN5RVZQ?=
 =?utf-8?B?SGdBN0w4cVc5bEw4d2ZKMTZNZndaME4ra204WDFZTlV4enVseWdJcWhRT2RH?=
 =?utf-8?B?TUREUWtxNEdSY3FyQ2pNTE8vV1lXNWpUd1hMdEVnN3JUY3hSQ0c2UUR0azZn?=
 =?utf-8?B?NHF5V0lTK0szK3lldWxlWlJKRnNnemV0cGl6U3E0T3VyQTNCWlp5WUlJZ2U0?=
 =?utf-8?B?M2tFR3R4V0FkZzBJcFpWSXFUY2xsS3JDa0ZkRGpjNmdZdEkvVUZtTnRoVVhG?=
 =?utf-8?Q?Xx6uSHDBHA9kIrSCwx5nMvo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a76370-24fa-42a3-c49b-08dc9ae8abab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 22:45:28.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClYryvMI0VuXQ+XEu7q36ePrMixEZHDNSplWUqvKRwL+WZjWeLsrXWTTrX0c8KNyICyxrF5CGJRwqQNki+J4/dlXfbebeJJm9ebyU2BmPq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

On Tue, Jul 02, 2024 at 02:40:34PM -0700, Ashutosh Dixit wrote:
>In Xe, the perf layer allows capture of HW counter streams. These HW
>counters are generally performance related but don't have to be necessarily
>so. Also, the name "perf" is a carryover from i915 and is not preferred.
>
>Here we propose the name "observation" for this common layer which allows
>capture of different types of these counter streams.
>
>v2: Rename observability layer to observation layer and in code
>    s/obsrv/observation/ (Lucas/Rodrigo)
>
>Fixes: 52c2e956dceb ("drm/xe/perf/uapi: "Perf" layer to support multiple
>       perf counter stream types")
>Fixes: fe8929bdf835 ("drm/xe/perf/uapi: Add perf_stream_paranoid sysctl")
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Applied the patch and grepped for perf/obsrv/observation, LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/Makefile          |   2 +-
> drivers/gpu/drm/xe/xe_device.c       |   4 +-
> drivers/gpu/drm/xe/xe_device_types.h |   2 +-
> drivers/gpu/drm/xe/xe_gt_types.h     |   2 +-
> drivers/gpu/drm/xe/xe_module.c       |   6 +-
> drivers/gpu/drm/xe/xe_oa.c           |  34 ++++-----
> drivers/gpu/drm/xe/xe_observation.c  |  93 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_observation.h  |  20 ++++++
> drivers/gpu/drm/xe/xe_perf.c         |  92 ------------------------
> drivers/gpu/drm/xe/xe_perf.h         |  20 ------
> include/uapi/drm/xe_drm.h            | 102 ++++++++++++++-------------
> 11 files changed, 190 insertions(+), 187 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_observation.c
> create mode 100644 drivers/gpu/drm/xe/xe_observation.h
> delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
> delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index b1e03bfe4a68..628c245c4822 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -96,10 +96,10 @@ xe-y += xe_bb.o \
> 	xe_mocs.o \
> 	xe_module.o \
> 	xe_oa.o \
>+	xe_observation.o \
> 	xe_pat.o \
> 	xe_pci.o \
> 	xe_pcode.o \
>-	xe_perf.o \
> 	xe_pm.o \
> 	xe_preempt_fence.o \
> 	xe_pt.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index cfda7cb5df2c..03492fbcb8fb 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -42,9 +42,9 @@
> #include "xe_memirq.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
>+#include "xe_observation.h"
> #include "xe_pat.h"
> #include "xe_pcode.h"
>-#include "xe_perf.h"
> #include "xe_pm.h"
> #include "xe_query.h"
> #include "xe_sriov.h"
>@@ -142,7 +142,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> 			  DRM_RENDER_ALLOW),
>-	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> };
>
> static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index c37be471d11c..3bca6d344744 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -463,7 +463,7 @@ struct xe_device {
> 	/** @heci_gsc: graphics security controller */
> 	struct xe_heci_gsc heci_gsc;
>
>-	/** @oa: oa perf counter subsystem */
>+	/** @oa: oa observation subsystem */
> 	struct xe_oa oa;
>
> 	/** @needs_flr_on_fini: requests function-reset on fini */
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 24bb95de920f..6b5e0b45efb0 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -389,7 +389,7 @@ struct xe_gt {
> 		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
> 	} user_engines;
>
>-	/** @oa: oa perf counter subsystem per gt info */
>+	/** @oa: oa observation subsystem per gt info */
> 	struct xe_oa_gt oa;
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 893858a2eea0..499540add465 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -11,7 +11,7 @@
> #include "xe_drv.h"
> #include "xe_hw_fence.h"
> #include "xe_pci.h"
>-#include "xe_perf.h"
>+#include "xe_observation.h"
> #include "xe_sched_job.h"
>
> struct xe_modparam xe_modparam = {
>@@ -80,8 +80,8 @@ static const struct init_funcs init_funcs[] = {
> 		.exit = xe_unregister_pci_driver,
> 	},
> 	{
>-		.init = xe_perf_sysctl_register,
>-		.exit = xe_perf_sysctl_unregister,
>+		.init = xe_observation_sysctl_register,
>+		.exit = xe_observation_sysctl_unregister,
> 	},
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 4188516a7816..6d69f751bf78 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -32,7 +32,7 @@
> #include "xe_macros.h"
> #include "xe_mmio.h"
> #include "xe_oa.h"
>-#include "xe_perf.h"
>+#include "xe_observation.h"
> #include "xe_pm.h"
> #include "xe_sched_job.h"
> #include "xe_sriov.h"
>@@ -481,7 +481,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
> 					  OASTATUS_RELEVANT_BITS, 0);
> 	/*
> 	 * Signal to userspace that there is non-zero OA status to read via
>-	 * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
>+	 * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl
> 	 */
> 	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
> 		return -EIO;
>@@ -1158,15 +1158,15 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
> 			       unsigned long arg)
> {
> 	switch (cmd) {
>-	case DRM_XE_PERF_IOCTL_ENABLE:
>+	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
> 		return xe_oa_enable_locked(stream);
>-	case DRM_XE_PERF_IOCTL_DISABLE:
>+	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
> 		return xe_oa_disable_locked(stream);
>-	case DRM_XE_PERF_IOCTL_CONFIG:
>+	case DRM_XE_OBSERVATION_IOCTL_CONFIG:
> 		return xe_oa_config_locked(stream, arg);
>-	case DRM_XE_PERF_IOCTL_STATUS:
>+	case DRM_XE_OBSERVATION_IOCTL_STATUS:
> 		return xe_oa_status_locked(stream, arg);
>-	case DRM_XE_PERF_IOCTL_INFO:
>+	case DRM_XE_OBSERVATION_IOCTL_INFO:
> 		return xe_oa_info_locked(stream, arg);
> 	}
>
>@@ -1209,7 +1209,7 @@ static int xe_oa_release(struct inode *inode, struct file *file)
> 	xe_oa_destroy_locked(stream);
> 	mutex_unlock(&gt->oa.gt_lock);
>
>-	/* Release the reference the perf stream kept on the driver */
>+	/* Release the reference the OA stream kept on the driver */
> 	drm_dev_put(&gt_to_xe(gt)->drm);
>
> 	return 0;
>@@ -1222,7 +1222,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
> 	unsigned long start = vma->vm_start;
> 	int i, ret;
>
>-	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+	if (xe_observation_paranoid && !perfmon_capable()) {
> 		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
> 		return -EACCES;
> 	}
>@@ -1789,8 +1789,8 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
>  * @file: @drm_file
>  *
>  * The functions opens an OA stream. An OA stream, opened with specified
>- * properties, enables perf counter samples to be collected, either
>- * periodically (time based sampling), or on request (using perf queries)
>+ * properties, enables OA counter samples to be collected, either
>+ * periodically (time based sampling), or on request (using OA queries)
>  */
> int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
> {
>@@ -1836,8 +1836,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
> 		privileged_op = true;
> 	}
>
>-	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
>-		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
>+	if (privileged_op && xe_observation_paranoid && !perfmon_capable()) {
>+		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe OA stream\n");
> 		ret = -EACCES;
> 		goto err_exec_q;
> 	}
>@@ -2097,7 +2097,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
> 		return -ENODEV;
> 	}
>
>-	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+	if (xe_observation_paranoid && !perfmon_capable()) {
> 		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
> 		return -EACCES;
> 	}
>@@ -2181,7 +2181,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
> /**
>  * xe_oa_remove_config_ioctl - Removes one OA config
>  * @dev: @drm_device
>- * @data: pointer to struct @drm_xe_perf_param
>+ * @data: pointer to struct @drm_xe_observation_param
>  * @file: @drm_file
>  */
> int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>@@ -2197,7 +2197,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
> 		return -ENODEV;
> 	}
>
>-	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>+	if (xe_observation_paranoid && !perfmon_capable()) {
> 		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
> 		return -EACCES;
> 	}
>@@ -2381,7 +2381,7 @@ static int xe_oa_init_gt(struct xe_gt *gt)
>
> 	/*
> 	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
>-	 * will appear in OA unit query, but no perf streams can be opened on them.
>+	 * will appear in OA unit query, but no OA streams can be opened on them.
> 	 */
> 	gt->oa.num_oa_units = num_oa_units;
> 	gt->oa.oa_unit = u;
>diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
>new file mode 100644
>index 000000000000..54b7c8c8e10e
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_observation.c
>@@ -0,0 +1,93 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023-2024 Intel Corporation
>+ */
>+
>+#include <linux/errno.h>
>+#include <linux/sysctl.h>
>+
>+#include <drm/xe_drm.h>
>+
>+#include "xe_oa.h"
>+#include "xe_observation.h"
>+
>+u32 xe_observation_paranoid = true;
>+static struct ctl_table_header *sysctl_header;
>+
>+static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
>+		       struct drm_file *file)
>+{
>+	switch (arg->observation_op) {
>+	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
>+		return xe_oa_stream_open_ioctl(dev, arg->param, file);
>+	case DRM_XE_OBSERVATION_OP_ADD_CONFIG:
>+		return xe_oa_add_config_ioctl(dev, arg->param, file);
>+	case DRM_XE_OBSERVATION_OP_REMOVE_CONFIG:
>+		return xe_oa_remove_config_ioctl(dev, arg->param, file);
>+	default:
>+		return -EINVAL;
>+	}
>+}
>+
>+/**
>+ * xe_observation_ioctl - The top level observation layer ioctl
>+ * @dev: @drm_device
>+ * @data: pointer to struct @drm_xe_observation_param
>+ * @file: @drm_file
>+ *
>+ * The function is called for different observation streams types and
>+ * allows execution of different operations supported by those stream
>+ * types.
>+ *
>+ * Return: 0 on success or a negative error code on failure.
>+ */
>+int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>+{
>+	struct drm_xe_observation_param *arg = data;
>+
>+	if (arg->extensions)
>+		return -EINVAL;
>+
>+	switch (arg->observation_type) {
>+	case DRM_XE_OBSERVATION_TYPE_OA:
>+		return xe_oa_ioctl(dev, arg, file);
>+	default:
>+		return -EINVAL;
>+	}
>+}
>+
>+static struct ctl_table observation_ctl_table[] = {
>+	{
>+	 .procname = "xe_observation_paranoid",
>+	 .data = &xe_observation_paranoid,
>+	 .maxlen = sizeof(xe_observation_paranoid),
>+	 .mode = 0644,
>+	 .proc_handler = proc_dointvec_minmax,
>+	 .extra1 = SYSCTL_ZERO,
>+	 .extra2 = SYSCTL_ONE,
>+	 },
>+	{}
>+};
>+
>+/**
>+ * xe_observation_sysctl_register - Register xe_observation_paranoid sysctl
>+ *
>+ * Normally only superuser/root can access observation stream
>+ * data. However, superuser can set xe_observation_paranoid sysctl to 0 to
>+ * allow non-privileged users to also access observation data.
>+ *
>+ * Return: always returns 0
>+ */
>+int xe_observation_sysctl_register(void)
>+{
>+	sysctl_header = register_sysctl("dev/xe", observation_ctl_table);
>+	return 0;
>+}
>+
>+/**
>+ * xe_observation_sysctl_unregister - Unregister xe_observation_paranoid sysctl
>+ */
>+void xe_observation_sysctl_unregister(void)
>+{
>+	unregister_sysctl_table(sysctl_header);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_observation.h b/drivers/gpu/drm/xe/xe_observation.h
>new file mode 100644
>index 000000000000..17816998e966
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_observation.h
>@@ -0,0 +1,20 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023-2024 Intel Corporation
>+ */
>+
>+#ifndef _XE_OBSERVATION_H_
>+#define _XE_OBSERVATION_H_
>+
>+#include <linux/types.h>
>+
>+struct drm_device;
>+struct drm_file;
>+
>+extern u32 xe_observation_paranoid;
>+
>+int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>+int xe_observation_sysctl_register(void);
>+void xe_observation_sysctl_unregister(void);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>deleted file mode 100644
>index d6cd74cadf34..000000000000
>--- a/drivers/gpu/drm/xe/xe_perf.c
>+++ /dev/null
>@@ -1,92 +0,0 @@
>-// SPDX-License-Identifier: MIT
>-/*
>- * Copyright © 2023-2024 Intel Corporation
>- */
>-
>-#include <linux/errno.h>
>-#include <linux/sysctl.h>
>-
>-#include <drm/xe_drm.h>
>-
>-#include "xe_oa.h"
>-#include "xe_perf.h"
>-
>-u32 xe_perf_stream_paranoid = true;
>-static struct ctl_table_header *sysctl_header;
>-
>-static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
>-		       struct drm_file *file)
>-{
>-	switch (arg->perf_op) {
>-	case DRM_XE_PERF_OP_STREAM_OPEN:
>-		return xe_oa_stream_open_ioctl(dev, arg->param, file);
>-	case DRM_XE_PERF_OP_ADD_CONFIG:
>-		return xe_oa_add_config_ioctl(dev, arg->param, file);
>-	case DRM_XE_PERF_OP_REMOVE_CONFIG:
>-		return xe_oa_remove_config_ioctl(dev, arg->param, file);
>-	default:
>-		return -EINVAL;
>-	}
>-}
>-
>-/**
>- * xe_perf_ioctl - The top level perf layer ioctl
>- * @dev: @drm_device
>- * @data: pointer to struct @drm_xe_perf_param
>- * @file: @drm_file
>- *
>- * The function is called for different perf streams types and allows execution
>- * of different operations supported by those perf stream types.
>- *
>- * Return: 0 on success or a negative error code on failure.
>- */
>-int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>-{
>-	struct drm_xe_perf_param *arg = data;
>-
>-	if (arg->extensions)
>-		return -EINVAL;
>-
>-	switch (arg->perf_type) {
>-	case DRM_XE_PERF_TYPE_OA:
>-		return xe_oa_ioctl(dev, arg, file);
>-	default:
>-		return -EINVAL;
>-	}
>-}
>-
>-static struct ctl_table perf_ctl_table[] = {
>-	{
>-	 .procname = "perf_stream_paranoid",
>-	 .data = &xe_perf_stream_paranoid,
>-	 .maxlen = sizeof(xe_perf_stream_paranoid),
>-	 .mode = 0644,
>-	 .proc_handler = proc_dointvec_minmax,
>-	 .extra1 = SYSCTL_ZERO,
>-	 .extra2 = SYSCTL_ONE,
>-	 },
>-	{}
>-};
>-
>-/**
>- * xe_perf_sysctl_register - Register "perf_stream_paranoid" sysctl
>- *
>- * Normally only superuser/root can access perf counter data. However,
>- * superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
>- * users to also access perf data.
>- *
>- * Return: always returns 0
>- */
>-int xe_perf_sysctl_register(void)
>-{
>-	sysctl_header = register_sysctl("dev/xe", perf_ctl_table);
>-	return 0;
>-}
>-
>-/**
>- * xe_perf_sysctl_unregister - Unregister "perf_stream_paranoid" sysctl
>- */
>-void xe_perf_sysctl_unregister(void)
>-{
>-	unregister_sysctl_table(sysctl_header);
>-}
>diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
>deleted file mode 100644
>index 53a8377a1bb1..000000000000
>--- a/drivers/gpu/drm/xe/xe_perf.h
>+++ /dev/null
>@@ -1,20 +0,0 @@
>-/* SPDX-License-Identifier: MIT */
>-/*
>- * Copyright © 2023-2024 Intel Corporation
>- */
>-
>-#ifndef _XE_PERF_H_
>-#define _XE_PERF_H_
>-
>-#include <linux/types.h>
>-
>-struct drm_device;
>-struct drm_file;
>-
>-extern u32 xe_perf_stream_paranoid;
>-
>-int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>-int xe_perf_sysctl_register(void);
>-void xe_perf_sysctl_unregister(void);
>-
>-#endif
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 12eaa8532b5c..33544ef78d3e 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -80,7 +80,7 @@ extern "C" {
>  *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>  *  - &DRM_IOCTL_XE_EXEC
>  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>- *  - &DRM_IOCTL_XE_PERF
>+ *  - &DRM_IOCTL_XE_OBSERVATION
>  */
>
> /*
>@@ -101,7 +101,7 @@ extern "C" {
> #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
> #define DRM_XE_EXEC			0x09
> #define DRM_XE_WAIT_USER_FENCE		0x0a
>-#define DRM_XE_PERF			0x0b
>+#define DRM_XE_OBSERVATION		0x0b
>
> /* Must be kept compact -- no holes */
>
>@@ -116,7 +116,7 @@ extern "C" {
> #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>-#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
>+#define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>
> /**
>  * DOC: Xe IOCTL Extensions
>@@ -1376,66 +1376,67 @@ struct drm_xe_wait_user_fence {
> };
>
> /**
>- * enum drm_xe_perf_type - Perf stream types
>+ * enum drm_xe_observation_type - Observation stream types
>  */
>-enum drm_xe_perf_type {
>-	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
>-	DRM_XE_PERF_TYPE_OA,
>+enum drm_xe_observation_type {
>+	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
>+	DRM_XE_OBSERVATION_TYPE_OA,
> };
>
> /**
>- * enum drm_xe_perf_op - Perf stream ops
>+ * enum drm_xe_observation_op - Observation stream ops
>  */
>-enum drm_xe_perf_op {
>-	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
>-	DRM_XE_PERF_OP_STREAM_OPEN,
>+enum drm_xe_observation_op {
>+	/** @DRM_XE_OBSERVATION_OP_STREAM_OPEN: Open an observation stream */
>+	DRM_XE_OBSERVATION_OP_STREAM_OPEN,
>
>-	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
>-	DRM_XE_PERF_OP_ADD_CONFIG,
>+	/** @DRM_XE_OBSERVATION_OP_ADD_CONFIG: Add observation stream config */
>+	DRM_XE_OBSERVATION_OP_ADD_CONFIG,
>
>-	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
>-	DRM_XE_PERF_OP_REMOVE_CONFIG,
>+	/** @DRM_XE_OBSERVATION_OP_REMOVE_CONFIG: Remove observation stream config */
>+	DRM_XE_OBSERVATION_OP_REMOVE_CONFIG,
> };
>
> /**
>- * struct drm_xe_perf_param - Input of &DRM_XE_PERF
>+ * struct drm_xe_observation_param - Input of &DRM_XE_OBSERVATION
>  *
>- * The perf layer enables multiplexing perf counter streams of multiple
>- * types. The actual params for a particular stream operation are supplied
>- * via the @param pointer (use __copy_from_user to get these params).
>+ * The observation layer enables multiplexing observation streams of
>+ * multiple types. The actual params for a particular stream operation are
>+ * supplied via the @param pointer (use __copy_from_user to get these
>+ * params).
>  */
>-struct drm_xe_perf_param {
>+struct drm_xe_observation_param {
> 	/** @extensions: Pointer to the first extension struct, if any */
> 	__u64 extensions;
>-	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
>-	__u64 perf_type;
>-	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
>-	__u64 perf_op;
>+	/** @observation_type: observation stream type, of enum @drm_xe_observation_type */
>+	__u64 observation_type;
>+	/** @observation_op: observation stream op, of enum @drm_xe_observation_op */
>+	__u64 observation_op;
> 	/** @param: Pointer to actual stream params */
> 	__u64 param;
> };
>
> /**
>- * enum drm_xe_perf_ioctls - Perf fd ioctl's
>+ * enum drm_xe_observation_ioctls - Observation stream fd ioctl's
>  *
>- * Information exchanged between userspace and kernel for perf fd ioctl's
>- * is stream type specific
>+ * Information exchanged between userspace and kernel for observation fd
>+ * ioctl's is stream type specific
>  */
>-enum drm_xe_perf_ioctls {
>-	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
>-	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>+enum drm_xe_observation_ioctls {
>+	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
>+	DRM_XE_OBSERVATION_IOCTL_ENABLE = _IO('i', 0x0),
>
>-	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>-	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>+	/** @DRM_XE_OBSERVATION_IOCTL_DISABLE: Disable data capture for a observation stream */
>+	DRM_XE_OBSERVATION_IOCTL_DISABLE = _IO('i', 0x1),
>
>-	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>-	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>+	/** @DRM_XE_OBSERVATION_IOCTL_CONFIG: Change observation stream configuration */
>+	DRM_XE_OBSERVATION_IOCTL_CONFIG = _IO('i', 0x2),
>
>-	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
>-	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
>+	/** @DRM_XE_OBSERVATION_IOCTL_STATUS: Return observation stream status */
>+	DRM_XE_OBSERVATION_IOCTL_STATUS = _IO('i', 0x3),
>
>-	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
>-	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
>+	/** @DRM_XE_OBSERVATION_IOCTL_INFO: Return observation stream info */
>+	DRM_XE_OBSERVATION_IOCTL_INFO = _IO('i', 0x4),
> };
>
> /**
>@@ -1546,12 +1547,12 @@ enum drm_xe_oa_format_type {
>  * Stream params are specified as a chain of @drm_xe_ext_set_property
>  * struct's, with @property values from enum @drm_xe_oa_property_id and
>  * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
>- * @param field in struct @drm_xe_perf_param points to the first
>+ * @param field in struct @drm_xe_observation_param points to the first
>  * @drm_xe_ext_set_property struct.
>  *
>- * Exactly the same mechanism is also used for stream reconfiguration using
>- * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
>- * properties below can be specified for stream reconfiguration.
>+ * Exactly the same mechanism is also used for stream reconfiguration using the
>+ * @DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though only a
>+ * subset of properties below can be specified for stream reconfiguration.
>  */
> enum drm_xe_oa_property_id {
> #define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
>@@ -1571,11 +1572,11 @@ enum drm_xe_oa_property_id {
>
> 	/**
> 	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
>-	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
>+	 * reports, previously added via @DRM_XE_OBSERVATION_OP_ADD_CONFIG.
> 	 */
> 	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
>
>-	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
>+	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: OA counter report format */
> 	DRM_XE_OA_PROPERTY_OA_FORMAT,
> 	/*
> 	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
>@@ -1596,13 +1597,13 @@ enum drm_xe_oa_property_id {
>
> 	/**
> 	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
>-	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>+	 * stream in a DISABLED state (see @DRM_XE_OBSERVATION_IOCTL_ENABLE).
> 	 */
> 	DRM_XE_OA_PROPERTY_OA_DISABLED,
>
> 	/**
> 	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
>-	 * @exec_queue_id. Perf queries can be executed on this exec queue.
>+	 * @exec_queue_id. OA queries can be executed on this exec queue.
> 	 */
> 	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
>
>@@ -1622,7 +1623,7 @@ enum drm_xe_oa_property_id {
> /**
>  * struct drm_xe_oa_config - OA metric configuration
>  *
>- * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
>+ * Multiple OA configs can be added using @DRM_XE_OBSERVATION_OP_ADD_CONFIG. A
>  * particular config can be specified when opening an OA stream using
>  * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>  */
>@@ -1645,8 +1646,9 @@ struct drm_xe_oa_config {
>
> /**
>  * struct drm_xe_oa_stream_status - OA stream status returned from
>- * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
>- * query stream status in response to EIO errno from perf fd read().
>+ * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl. Userspace can
>+ * call the ioctl to query stream status in response to EIO errno from
>+ * observation fd read().
>  */
> struct drm_xe_oa_stream_status {
> 	/** @extensions: Pointer to the first extension struct, if any */
>@@ -1665,7 +1667,7 @@ struct drm_xe_oa_stream_status {
>
> /**
>  * struct drm_xe_oa_stream_info - OA stream info returned from
>- * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
>+ * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
>  */
> struct drm_xe_oa_stream_info {
> 	/** @extensions: Pointer to the first extension struct, if any */
>-- 
>2.41.0
>
