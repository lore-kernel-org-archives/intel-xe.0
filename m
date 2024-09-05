Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDDBCD5BB8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 20:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED3C10E946;
	Thu,  5 Sep 2024 20:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9dVX2HB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1783A10E949
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 20:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725566573; x=1757102573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Cf1PxSSjz4Pt0B4Eg7hjD4E7bh/i/IpYdMYDwHVtS8=;
 b=b9dVX2HBy4E1NiowtIbxIRoXQle/Pl6kdwyBQMjnHzAQRi0fEIQ6WWQJ
 Ni5Ajze+d7eFpSq6R/iTSUef3sDlq4zSLtuYWSoc7i51IQqXTLQHZmMZG
 kDtugApatcvTdGQiPpGQ9DYBZrzI68/Dj1Ugw4o7jkHbZQdtjTuNdQUb0
 6QadATiS3PxIDzftkmO6BLvLkfF54Gncf1k5skexRxZMKpHetjGWIYV2x
 aV93X91ainqa0hNFS5Yt0iz1R5AubHCr/v8YqYe7+7sZ54B+jG8LmFpSg
 fOMUZlTvrUDKKGbZLzzQWa11WzQjVk+YeQPLZpL86evmMx9dNwPs+8H0X Q==;
X-CSE-ConnectionGUID: Fg7BiJCeS5qke4Bt519T5w==
X-CSE-MsgGUID: lTcU9uBvRxyJbULMgkBYGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35664085"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="35664085"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 13:02:52 -0700
X-CSE-ConnectionGUID: gE7zRPFPR4mRn2qVfI/1VQ==
X-CSE-MsgGUID: FBc9ofuJR/yrDuTIF0dccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70526626"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 13:02:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 13:02:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 13:02:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 13:02:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 13:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqnsUprkAibK9SfH34lE1Veyxz7hWJklyYtj0n3iOlLNYcY5LGqd/LPMoeu9R0liocEFRm9ba94PzrLz8/Ux9beuhK8PEI7mcYPsmwwbgBl27jC/ZzqBCYtjy21Q4TGeZQYJT+qLsGbFA4qmbES7JLR54sy/Ru6fm2E1Kki+mR6ex1My1FBWmNgqNrUQ/kQ6Hi3yXs/uWjoLJRV+nlxpPmY5Kj202NYoxeOABn0odI39V8IwRKXk/Tc000lJJassq36/UiYOZnUl1JAC7n8i/doG3VglEEEmaAo2DrWcX+3KnkH45eoBumA3P6YOXFWydNQ9OxlMUfYjjUieO5GYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vf283xsPH+Tt909c9SRk6XZ5zHD8AVdheAH2Nomy0I=;
 b=jl5K35jmsNhjsCz4+nkecBw1/JWzPeZPDcAr6RLhi4MV7VTHZFfSTjtKl991HLwI/HeRUfeAEMaMDzjMmXio0dTfUn56uhe0nGIGdiahNkf8vnyIxlqGJ1IbgvSe+kr2yigfYQ55t6eOAPfDLhEqY1orP4LXwClDsZoIcWJUsZbN8KmJSWGEFpnnsi6AcHDv80amrotuY5vly1frE2LN9GFx6bM95o8yZ7U++DN/BgzISqjl3Jp89O0P/bdMjL4ruSoisviV+meF7ajI8XmMHH3pYvaUX05b85rtezAS0RCbc/Y1zjhfR/FH+E12D8jVSCJP8z5O57CGXTxQ/foP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 20:02:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 20:02:46 +0000
Message-ID: <82a78b3a-14e6-472a-8e45-2cb4af2ff3a2@intel.com>
Date: Fri, 6 Sep 2024 01:32:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
 <ZtoGpjVmZbwLsD1s@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZtoGpjVmZbwLsD1s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BN9PR11MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e487a19-f0d3-4a9d-c809-08dccde5b5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWlKSEp6SS9oZDh3SmFua0VNdVpCcVFNNHcvSDRRSUtHZVJOeVlsTmFMcjZq?=
 =?utf-8?B?N3Ivelh2RmpBOUJ3dGx3REJkL0xVazlJeXhNU0xiaVQ0bGttRmVUOVk2RlhN?=
 =?utf-8?B?NDNhMU41VHVBcE1IZndnQUxUeWpyeVUvbzNFUTEraXRwVTFsV0IyWm16TllP?=
 =?utf-8?B?QzlLeWpyUGZUeVhNeEd0bWFzQ0tVaFRRNFJ6NW13enFzb05xZC92Ym5Ib2lC?=
 =?utf-8?B?SkZ2cno4aENNaXVpSklKN2N1Y242NWlUV0xkUHhSdUYyalBjNHRzU1FscFZI?=
 =?utf-8?B?TzdzUUpxTkFNYm1aOUNnbU8rNGVPZVVraU9wMUlmZHFkTDJzZWFBQlFmUTJm?=
 =?utf-8?B?R0ZxMmt1b1BIWTZzWVpTRWhLSFB3ZW9JUjZKNkFYRytFVklQTWZDdXNoMG5u?=
 =?utf-8?B?N1NhazJUZFMrc1dKajFaOGZtN1Qwc3N5Vi9JWlJoVkhXdndRVE9IZ1krMHBE?=
 =?utf-8?B?NG9iL2tXa1VmT1RNbTBiUGlVSnFjNTlZU0UvaG93VGxJcTJPRlVVRjFvVlo5?=
 =?utf-8?B?a0ZvS2lZTy9KcWdVakpjVGF6MExmdDBraEM5WnRjaUFqa213ZzZERVhkdnlT?=
 =?utf-8?B?U2haQkppRk5IOE5NODkyT3ZJNzQ1bXRvVlJUOGJoR1g1djBocUtPM2FlK0xq?=
 =?utf-8?B?MFMvbjE5RGhFSHBxSVY4WU9YYkpweEF5QVhXMXJOOHFRWmI4V2JINnAvdk5E?=
 =?utf-8?B?WmgzYWxCRzVzRUVzLzUweUFIYVE5S21EZ25RSFVrd0kxUktRMTN0VVVqMFVN?=
 =?utf-8?B?TVBwN3lBYzBiUFUzSXQ1VS9ERWNMdjdlekg5MUVMOXZVZjlUeEhoOS9jNXFK?=
 =?utf-8?B?VVlMdHJEWTluYXBDZExzQ2dHRWJlYVhwck1sZkZQd05VTDRlOXFBaHpoa3NK?=
 =?utf-8?B?SEhINEhONUVZV3NKSWFuRGdmamJITzVqY1VXMDlIZkpJcWRqT0dvdVh6N0h0?=
 =?utf-8?B?MlpSVWtiOTZvZmpUMkVYUWc4OW0vblZqTm1OWE02TFdnU0x2TXJMYkNXajNO?=
 =?utf-8?B?VVQxZXgreTd5NTNleUpvYWlua2pQK0pUbksrQ0FVaGNnelU3Y3I0SUFJV3FB?=
 =?utf-8?B?WVlDclRsSVd4Z2lCUjh6VE01UGtETUE2ZDhxaGNoV3VoQ0pvaW9NaCtjSEdM?=
 =?utf-8?B?OUtiTXcvaXk4dlo0L3lwUG1WSzZyNXBFb2xqS0c5ZTBSNVlVM2RrYXl4bExO?=
 =?utf-8?B?LzZUZmtGM1ViWnhZU1h0cm5QN2dPZ09jVFEyeE5qZ1FHSnVVSG1IZmo3N3hB?=
 =?utf-8?B?cEZzRXZPcmF2ZzRFMFFVbGlQVXBVTGoxMk5uRXZUazRBalNYQW9IdUNPSlEy?=
 =?utf-8?B?K241OVdaOTVjOENMR0pKdlQrRTVXZ1UyNXlyOElWU21leFErVFpKM05ZUkhP?=
 =?utf-8?B?TlJ6Mjc1eVdSOXQ1cnJ4cldvQ1luaHg3cDNLS0pMZ0U4RmwvNmpkaDJnTEJP?=
 =?utf-8?B?MUVGem5uTWZ6MGIwZzJYZ1A3RGFpVjJDalEreldUYjFnNStpT0l2MVcxVCs5?=
 =?utf-8?B?T0dNWE5sZkd5V29RaHBiWUs5Ri8wbUk3azVpQmd6Y3A0OVRIalM2akVVWnFU?=
 =?utf-8?B?WXAxL3M0cktqSDBDSFlXQU5jTFhlWDIrMVEwTzE0djNseFBFNk1DU1VURXBF?=
 =?utf-8?B?N2ZoZTJ5cFBlR3E2TnM1TVErR2I4UHZkMHNJdTVTYlRoVHBsWk1HbVoyVU41?=
 =?utf-8?B?TTNSUFk4NktsQkN2UW5YbjVWL1NXQUVDVkpiNEluY1FKeHdacE1hSkJ6d1lm?=
 =?utf-8?B?TVE5YWM1Q0JyenIrZUYvYU5zbGhya0FCT1ZxM2hnY1RJcDRGOXFBQi9jVDVv?=
 =?utf-8?B?UytXZ3BZaTMvazkrZ05XUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1VxQWNDQU96dmpnZFJSa0NiaVhXWGtPblRQUHQvMWFuN2c2VFhoVmhpT0Y3?=
 =?utf-8?B?OTNTZ0VNRnc2cnZIaGViaUUzMndteDkrSjNZY25iVFM0bkd6YnZBaVBJYU4y?=
 =?utf-8?B?eHcxOXYwdlliZjlYTDB1aUl2alpCeUI1OUp0NXRwL3doaGVpaXE0ZnlYclFz?=
 =?utf-8?B?OHRvZmNML3Iyb3VlSHpLM3JwSDVQZlkxZDNTZXBmbUYrclpsUjNmNXFseVpz?=
 =?utf-8?B?Mjl2ZTZiczhRWUZQNW85UVpOaDVIaFNUOGNlRnpjMWRmUS85R1RhaHIzT1l1?=
 =?utf-8?B?ZXloZ3RSazU3VVN2Qi9RT2VubFJkc24wQWxidnNNTDROb2JVWnRqSnJFY3hk?=
 =?utf-8?B?d2tEQnRzOXhiN2tYdkhpaEtoWGRxbndPcWFwaWZ1U2FjTnhZV0lFZVNWWEdl?=
 =?utf-8?B?b3JCYTVhUzBQSUNYT0MrOXpBQkhuVEVIUkxpYXpIVXFhYS9kOEt0aGpVd3ow?=
 =?utf-8?B?MlFDZWxRbHZvU0tyRmZsenVLZTJNQllBRnAwVXZlOVhrQVVuVkpZeWxOQndC?=
 =?utf-8?B?YTBQeDJ4MW5nazFzUzBHRUlodDFpUXdYQ2dYemhXdjhMdUxnV0NRRjBSZjhr?=
 =?utf-8?B?S3MvNFRvRXJLNFZDb2pJa21ROVIrcUliVG5yYVdLZjNwbzFRN1pKN1VWcUNL?=
 =?utf-8?B?VzM2d1hFNWtmZmF5MERFRy9rd1JaSnJ5cXc4RkJYZ29laGVrM2NNVkUyMmJZ?=
 =?utf-8?B?UmtkMjBndVpmVWtpVlBmMlcyYlhLZXBwdTZKb3JYZm50bkNzbzR2akYvMlZn?=
 =?utf-8?B?cGEzQ1AydmxEN2tYeGhIaXZKN3BibHZkUzB1USt5ZFg2MUtDbnRkSHVqK1hh?=
 =?utf-8?B?S050QzVlUVJnRzlyb3A1Z3I3VWFDb2s4YmhkMDRBSzJZdTQxTkJrU0llWlZo?=
 =?utf-8?B?NWhXdTM0eVJFSXFsZEdWT2ppeVNhdkRqcllSaHhRVWRPQkVqSERLbjg4TkRY?=
 =?utf-8?B?aWRSdjducG9CNkxjTGdML0RoVk05N0UzdTZic0pqUE9QNmNKaUJlZlBPRUV5?=
 =?utf-8?B?N2NtaXFEMDhlMHNDS1RCTnFNZ2hpWUhKbXY0aGJKK0JxbmxQaldKeTJ1eXFl?=
 =?utf-8?B?ZVAvbU5UeVVEVEN3MWFENUpSMnVuUHRhOEhVbjJUMmRRekVhQzFtbEdHbG0y?=
 =?utf-8?B?VHRJdGVJMFR4MjZJMW5aR1pMZGhWRkt5ZlNEei9JRWhuTjg4d3M3aytaRllJ?=
 =?utf-8?B?aFIwQ3p4WGdXR3VJeHUraFE3M05UNDBJOXRJd0xralRsa2lYSENwWVFOKzNx?=
 =?utf-8?B?UGRqMmhUZTFZQ1ZFYitpTmxKUXFPM1dldVdvTlQwQXdxVDBkTGwwSjAyQUd6?=
 =?utf-8?B?bXdqSWZKWU96VFE4Rmd6RWQwVXlISkNiMUk4Y0F0L2NWdkoyait6Um8yV095?=
 =?utf-8?B?MG5xcnd0MDJYOXNVa1RLNmR6OEdYU3lqRzB0YVR5SlNnK2k0UFdrK3lpNUZ6?=
 =?utf-8?B?MzEvWXd2RGZTWDlLb0J1ZTUxNjd2NGw2QUprbEJrU2hHemNhV1RVZkQvSE0z?=
 =?utf-8?B?M3ZlLzR1YVFydWsreHdXQTQ5MzgzNGdjdFpTejY2dmVxZlcrQ3FsdHJpeFYw?=
 =?utf-8?B?cnhLSVNtRVBaMmJjQXVuS3FieUhKT1dLaGNZT1ZlZjl0VWFJYWNzdXVyQ204?=
 =?utf-8?B?M3FjWkNiajI0TlFaQmRLUmxUZk5WRFRnZ0tMWmVqdE9hZ0RvZnFVZHo4LzRj?=
 =?utf-8?B?R0ZwV0JSYnA2ZDNidXQzQ1FCWjBWSnpYM0NLSFJzNEpCVlVTWkxVejFDcjhL?=
 =?utf-8?B?WmFFdUdERlVjbmp0WTJvbE9nUnZqYmlCUmVzVTdMWjVSZ1NuN1FueVQrNjZB?=
 =?utf-8?B?RG1WRXhBdUlIK2R3VzRHSEFMamdoZ21ZZFJWemtzcW4yV0FwUWJocDlmMUhm?=
 =?utf-8?B?WC9GZFc5NGdtS3RUdlhONkdpRnIzOCtkUFcyQkFyUTI5VitjRG8zT1NNeGZL?=
 =?utf-8?B?N3VJY3R5NkVCVDFIckRNS0pwQUYvVXB5alZmV0RUVTQ0WFpNSUU0WWRKUWFx?=
 =?utf-8?B?U3FFcWc0aDlsNWszOHN4UHgzbStJdXpvcTZMNmVNZzJQQzc1UXVqV1RCK2dQ?=
 =?utf-8?B?dU5KYTFSbnE4UUhoUi84Qm1sdWdZMHc1amFvVk5rQTJNOGVPRlRaZDlOeWU4?=
 =?utf-8?B?emx1VkdTUjhvakovVFlQeDlOL2lUejJ6c01UbW82Q1VlaEdnZm53bjlCVFVX?=
 =?utf-8?Q?mc24uCgeXMlhG7BbSS5I1lg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e487a19-f0d3-4a9d-c809-08dccde5b5b5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 20:02:46.2704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /c3wz5bnB6I2QtZRYWzLk4Z6yT+sxJvy9GIqHv11l/xAP8YNU7wxvaTDQ2OYD7/WPKiEL5+eGX9zjhjEnNCaRkNx0I/HaAg1UCs7RS7nuIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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



On 06-09-2024 00:59, Rodrigo Vivi wrote:
> On Fri, Aug 30, 2024 at 10:53:18AM +0530, Himal Prasad Ghimiray wrote:
>> If an acknowledgment timeout occurs for a domain awake request, put to
>> sleep all domains awakened by the caller and decrease the reference
>> count for all requested domains. This prevents xe_force_wake_get() from
>> leaving an unhandled reference count in case of failure.
>> While at it, add simple kernel-doc for xe_force_wake_get() and
>> xe_force_wake_put() functions.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 52 +++++++++++++++++++++++++++---
>>   1 file changed, 47 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index b263fff15273..8aa8d9b41052 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -150,31 +150,73 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>   					 (ffs(tmp__) - 1))) && \
>>   					 domain__->reg_ctl.addr)
>>   
>> +/**
>> + * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain
>> + * @fw: struct xe_force_wake
>> + * @domains: forcewake domains to get refcount on
>> + *
>> + * Increment refcount for the force-wake domain. If the domain is
>> + * asleep, awaken it and wait for acknowledgment within the specified
>> + * timeout. If a timeout occurs, decrement the refcount and put the
>> + * caller awaken domains to sleep.
>> + *
>> + * Return: 0 on success or 1 on ack timeout from domains.
> 
> * Returns 0 for success, negative error code otherwise.

Hi Rodrigo,

Sure. Will fix in next version.

> 
>> + */
>>   int xe_force_wake_get(struct xe_force_wake *fw,
>>   		      enum xe_force_wake_domains domains)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> -	enum xe_force_wake_domains tmp, woken = 0;
>> +	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>   		if (!domain->ref++) {
>> -			woken |= BIT(domain->id);
>> +			awake_rqst |= BIT(domain->id);
>>   			domain_wake(gt, domain);
>>   		}
>>   	}
>> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
>> -		ret |= domain_wake_wait(gt, domain);
> 
> now you suppress the mmio error code...
> should be better to find a way to propagate that.


AFAIU the only possible error code from domain_wake_wait is -ETIMEDOUT, 
was planning to assign same to ret below, which I missed in the RFC.


> 
>> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>> +		if (domain_wake_wait(gt, domain) == 0)
>> +			awake_ack |= BIT(domain->id);
>> +	}
>> +
>> +	ret = (awake_ack == awake_rqst) ? 0 : 1;
> 
> s/1/-EIO/ ?

How about -ETIMEDOUT ? Since this is same error which will be propogated 
in case of domain_wake_wait failure ?

> 
>> +
>> +	/*
>> +	 * If @domains is XE_FORCEWAKE_ALL and an acknowledgment times out
>> +	 * for any domain, decrease the reference count and put the awake
>> +	 * domains to sleep. For individual domains, just decrement the
>> +	 * reference count.
>> +	 */
>> +	if (ret) {
>> +		for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>> +			if (!--domain->ref && (awake_ack & BIT(domain->id)))
>> +				domain_sleep(gt, domain);
> 
> wonder if it would help to extract this in a separate function to be
> used here and in the -put function.

Let me think around that.

> 
> But more then that, I have a question here...
> Do we really need to sleep other domains if we are not getting ack from certain domain?
> Doesn't it generally means that we are busted anyway?

I have no strong opinion on this, main thing is refcount shouldn't be 
incremented.

> 
> But also, if we really need to sleep, then perhaps shouldn't we also
> call the sleep function even from the guys who didn't ack? perhaps the ack
> timedout, but it really woke-up? how sure we are that this is not possible?

I didn't want to change the hw state by calling sleep for the "ack 
failed" domain, so if necessary, Debug tools (PythonSV) can help us 
pinpoint the exact failure state of the HW registers.


> 
>> +		}
>> +		awake_ack = 0;
>>   	}
>> -	fw->awake_domains |= woken;
>> +
>> +	fw->awake_domains |= awake_ack;
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>>   	return ret;
>>   }
>>   
>> +/**
>> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
>> + * @fw: Pointer to the force wake structure
>> + * @domains: forcewake domains to put reference
>> + *
>> + * This function reduces the reference counts for specified domains. If
>> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
>> + * and waits for acknowledgment for domain to sleep within specified timeout.
>> + * Ensure this function is called only in case of successful xe_force_wake_get().
>> + *
>> + * Returns 0 in case of success or non-zero in case of timeout of ack
>> + */
>>   int xe_force_wake_put(struct xe_force_wake *fw,
>>   		      enum xe_force_wake_domains domains)
>>   {
>> -- 
>> 2.34.1
>>
