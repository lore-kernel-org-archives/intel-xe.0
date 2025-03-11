Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD93C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 14:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E8910E5B3;
	Tue, 11 Mar 2025 14:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnP2wvDi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4946310E5B8
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741703052; x=1773239052;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rRwFC7PpmKWDztI+zb3feamI7fD20bITZjX/x7YVqeE=;
 b=DnP2wvDi5Eli9DBTNVnHu0Eetk6kR2R6ZLVniTJAeAS15QiwGGeBKYO7
 IQjvi1ClJ9kXw+9JRhV7TTniSMhLnatRYkb4Q2tp5czNCw+fDOch70xyn
 GRJp73c6X+PEJ86T1ttl8wdhcOAt402NtVoi5RPDE/TSEK4G9F1Iquf74
 Lbx9VPoHFQNt5ewd4EikSwkys5DU5+g9DzeH0Uk6PxeC8AMdRXXQ6M4q8
 jEpoIkC3UN5ncQitmqnT155m+K7zc/3SssVEpe3nh63ywMS6cYfGuzDKP
 tFjJyYbUaOPEmQoxBjzPzYYR/UHk+C7g3ZCCKhdtIETbAqFlYG5+I1ias w==;
X-CSE-ConnectionGUID: WrUg42SRSSKRm3GK8fH+UQ==
X-CSE-MsgGUID: XCdiT1DRRoqUPK92oaUeow==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="68106413"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="68106413"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 07:24:09 -0700
X-CSE-ConnectionGUID: phwOwpj9S+mpNxVZ3PNVXg==
X-CSE-MsgGUID: bY+UjMN8RemnjOBb/BBQxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="143530086"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 07:24:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 07:24:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 07:24:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 07:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOX4PjRI24KqPXBDRXmxIRsb/dE+91hgoGRc8RtzY1Eg178w/E+XwKB1kXUzJe+6XxxtGg2AzDhXMmoZe8LHOPB/agEb1TaohowOWRvUSFl0g2+wGqWIl3v8IyUEqG63PRs6z94RHqlZyZvA4v9tAUoy+eDtkBXRMBF0XznVRy4sk4mJtY/Ot5Xuxx7oQ2tvaeZAdDkKYyZwmSHihFDsGhb1YULz05C/JthwU02q1JL1+kv73x+6R8Wp5NdIzTye66zZTFN35Ijs2KTvtcpXiqsDJ3HB2mx4tKmBVNY8Xi3fMXG9v3P4vdZyQAmqQHyiC8YgNCfCWkW6SJ7h0qk9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11DZbasef1LkLuj7e70WRY5qlmXOibn8BWg84C5Q2qs=;
 b=jpf2xsBedWbu9WfmFLw9tQfWQqC81S3DeAExNoCqXPUUOO1pl7/ieCWR4DfAgYt78VBxm6DSpCB45ZAOEjefl6yCQBk+E7OZpy0Vm32GAmZYqGBYESetRxeV4+tEYv/krGoO1cuDv0rZq5Xp3uzZhl6umkNZmiRrm4GjMPFZhMYDdBH38KbeNhmgGalpqY6wrokfF3B1b8As8spBiIjSBEQSfMl14O7ZxedPLL+3eIh34vPiNtlUkOXRyiECJc0PRGARrq2ONCqCqBDCUFOvPjcOceLAHEeQaDet+csgp0/MSYOmNuWxHwU1tXxw/QvTBhiMmwLQK3jN0wR5HcgEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:148::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 14:23:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 14:23:48 +0000
Message-ID: <437269cc-69d9-40be-89a2-450d0ede1983@intel.com>
Date: Tue, 11 Mar 2025 19:53:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Catch all unexpected register reads
To: <intel-xe@lists.freedesktop.org>
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
 <20250311135726.1998-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250311135726.1998-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c51793-384b-4f04-f6b8-08dd60a856f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWM0WGFjZlUvcE9IL2Vxem1NbU9vMkJzTGpuQjB1Z1NFQzFoeExwMzg4K282?=
 =?utf-8?B?djJOcTNMRzZzdndsSjBsN3BuY28xZkZMVm5YUjZKeG9SWUZzMlpyUU1qYWQv?=
 =?utf-8?B?THJyelg0a3RyQXdUMWxia2pvbXhvNTlTSzZkcWd6cWFSdTBMZTRrQlBIUkV4?=
 =?utf-8?B?cCsrKzhXYjU0VW4xVXJYUS8zVFVpK2svSDhaZjEva0ZENUpJNG1razNOZXNt?=
 =?utf-8?B?U2I5ZFlPUUNaTko0REZwMWc4cXlxMDd6TldvalgxcCt4bXBBNjRpQnFMalln?=
 =?utf-8?B?ZUs1am8zS1hkN005K3psKzNiQ2wrWDZKenoxeUppZGd2UDRzK05jajUrcUx0?=
 =?utf-8?B?d1gyNVRDRUZjYUdwTXk0VS9Sb0hZVVJLNlhSRVdDRmdBQlpZdHFoMzlUa3Vw?=
 =?utf-8?B?eHp1ZkZnc1BybW83V2hnRUdTMDlvYzJWSEh5ZDRMeWtJNXp4bFlZd1ZENzh6?=
 =?utf-8?B?VktaaGlLV0sxR1A0eXRWNWpFWTEyREQ3Qk50em1SeC96U3V2ODY4bTBaZmtm?=
 =?utf-8?B?SHZ0VlpZUm9zQ0ppU3h5cktxc0toYjRpb3MveEVIZWNPWThZc28vUlN4WVdv?=
 =?utf-8?B?eGNEWkhaSlk3TFJvTEZqSzRvWmVBbC8rNzRuNTRlbzhrQXdvZXJtakF6N2NB?=
 =?utf-8?B?cTIzZXB4d3kvWWlROWVQWWR0WWl1TzJxMnJIQjRMYUtrU0hxMnlRWC9pNTE2?=
 =?utf-8?B?OXVyWHFGUXd3VGRMWFp0T3drQngwNGlvdUxrZHdmQ1RUazJHQk9jZ2JtM2RI?=
 =?utf-8?B?MTRCeXJEWUcrOTlqZEpETmxZR25WMVJSVDlsQytOZ043SkR1ODBXVDQzNE9v?=
 =?utf-8?B?MHZZTnIwZ0NaN1BONmdNSUhUZWhwMHU3RHhiOFh3QmlWOHdmeVNHNWtSOXpB?=
 =?utf-8?B?MktIQmhDOWRwdFpnaHhhSFNZZ2hVRW92MDMxRERLQWN0L1prVXdIODNFM0pi?=
 =?utf-8?B?aEgxTm1LK015VlRFam4vaS9aR2tnMkRFZ0hhRDNmcEd1MW9IdFpUMjlHOEM1?=
 =?utf-8?B?and2cU5zaHM4cjBTTkw5MjRMdWtYRUlyN1NHMndWQnN5ZWt0WnFROGRldmt3?=
 =?utf-8?B?UDN3RmRkQ0FWVU5tQWhBSmdKcWFCQ2hHeGlkSlh4MFZSUE02M2NBOTZHSEdP?=
 =?utf-8?B?VFZRZDA4QWtEN3dmU05SWm13L2srdElRZWJxeVFjWDlGZUhUcXJzVm1Neita?=
 =?utf-8?B?QXN1MlZGNVhjMGdzUFNrdG52RVNnNEtEY2k4Z0pWSEx6a2ZKZUdNdEp0NmdD?=
 =?utf-8?B?emZ3a0NjdTZ0TjJUSzhqbE1KMkRxVnN2bXJIY2k1OGpld1ltUllGSlo5OHBt?=
 =?utf-8?B?QW5XVm5uajZCS1N4MlhwdEFPU3paL01DWWhJcEhlM25SczhvWVMvUjIrNnAw?=
 =?utf-8?B?dGJ1ZnV1ejVHb2xXOXpXSTVFNGRURTVxVVlKK2VkVE12TmREU1gwaklmbmM5?=
 =?utf-8?B?S0ZzdzRqYVBBckhDOTN2eExxRGdLenFPM256WjBlRmNoWHZndXdOMjRxUkgx?=
 =?utf-8?B?dUJkNU1lTEwxWkJwbVhxU3p6STBBNWpFeUR1Y2pLcVRvaGhDZzU2cVZ0RG9m?=
 =?utf-8?B?NTJNZ01NbW83Q3QwNFJYSVNZSWZtaGFPdFd6WTVpSVVVdUU0Zm5WQVNxelZ5?=
 =?utf-8?B?bmhXejVzWmYzM3d4dVRxazhKUFM5WDJSaVNXRDZwMEhIQ1Zhd2MxbE9KeFov?=
 =?utf-8?B?NlU3R1E1V3A2OUJyWURsRlN5VFZVMWo1aXp5bGJ2Ykt5MjhZWmwxcVZWU0li?=
 =?utf-8?B?VVRKNDZUWXdacG40c01xVitJOCtlcCt2NXBVaE91ajl0YU82OHdCUUJpWk5t?=
 =?utf-8?B?NlQ0RjdFQmFlRW9DZzk5U2dRMlF0ZWJYZEpqNFdSWGRFNFFlODE2cDBjZXdr?=
 =?utf-8?Q?hjycux8Lv8b+W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVoaU5RVzJETEtGOS9mLytsVGZaZnBXWEMyMExMV3NBQ01wbnorUkc5SE5l?=
 =?utf-8?B?Um8yRkhwYzB0eHFTV3EwNWpVaWxvdWo1QnRCbmlhWmRzVHhZaE1TNFl0MU9x?=
 =?utf-8?B?THF1SGhqNzN3ZlBHdS9Uem9FSkFqMW1IZzNWRVUwcEZzUUF5V3JtWjZqL1Qy?=
 =?utf-8?B?OS9FUEFIV2gya0R5VlBsWnBpSVRLUk55dUM3NXZ1cUJidEFQMHkrTkRBSlNa?=
 =?utf-8?B?Z0xFRnE1aHpmcGVNZ3Fhb1kwaXhGZkR5WDF5dEsxV1N2OTZ3cmtWdFBUTFgz?=
 =?utf-8?B?YkNFQk03ajRxRi9EUmp3dlVnbGI2bk00UkRNRWlXVjZPeGlhU0pJay9mU3ky?=
 =?utf-8?B?dy9HYlVUZ05POFdNSmk3N0lmVW5OVlZtNHgwb1A2M2ozT21pWTMxTHdTeWNF?=
 =?utf-8?B?V0dENWdzUVh0dktqVkNsamFmMHdhUmZZRlF2R1RreUxNcm81cmRyQVk1azhC?=
 =?utf-8?B?dlJjUjlCdWxkdEloS2lBZVZFaWNmS2ZDRGJhamxMVEpUek8zM0NBbkRjSFRQ?=
 =?utf-8?B?d1pFL3NVUVVxL1BkaFNBUDB2cjBzZzVIUE5LMGIrdHFlMDJUTkphR2FzVTE4?=
 =?utf-8?B?RFNmdXg0S0dLcDMyVTNOdnBPVURwbVJqMnBxa3E2U2w4clk0ZlFvaVljbSta?=
 =?utf-8?B?eWM4YmJFQTJ4V1NFdktXSUtpMXV3dnhMRmFGeVpDanpIMml6Ujg0WGRBNVE1?=
 =?utf-8?B?RmF0MStFN2JidGs0OC91KzlOZkpwNTFlRkJMZW5UMnU5bmFSRjBIRUlMQVBu?=
 =?utf-8?B?aG04UGJMa05BUU5SZHV4RVRxMlFtMXdKRDdHbFBYWVEyOUZRKzYrSEN5ZHBz?=
 =?utf-8?B?MFlac2Y5ZXVCbkFsM0V6RlNvdVhXcXZqcHJiM1VqZE1nUnRaYmUyc0ZYS1lH?=
 =?utf-8?B?dWlLSE1mN1c2ektGT2huN2ppSzkrbHVGREQvME5ObFRxeVlUbHRxQVBWQWI2?=
 =?utf-8?B?ajd6S0pab3U2SGF2RGtvdkJ2VHlLblZJQXg5eGt0bTRBWjdSM0M4NTVVcG96?=
 =?utf-8?B?OVFGMlVGSU10YzVzQ255SW1qd2pxVVVkaGx2SnBBdjNYaDdETjdwbEVBS0c4?=
 =?utf-8?B?WlBYUnlIeUVybE1WUXFNWVE4R0M5N0ZEYVVzc0lRMTM4MTZxWENSMHY0K0Qr?=
 =?utf-8?B?VmZHWUNNa3ZENjU1WkdGdUdPRXg2QkVjRUZMcUFuWjU2aEFFdStITTlmY2xV?=
 =?utf-8?B?VTlNUUYyVytzM08yNER4ZVk3UnJiVGxIUlVOLzArSnhMREtuZUphemxybDNG?=
 =?utf-8?B?WFU1dDBjVUtaMHNCVG1SRUMwZTN2SnFIMTAySXhjTmsxdFBwSWM0ak1YVE94?=
 =?utf-8?B?alRzTjZUMVFlYUNrMEEvRmRoeVlUQU9HSnBCZjJJeTM2czg2dkJwa1hIQnRY?=
 =?utf-8?B?YWpSMWZkSWdVS1JwRW9pSWpPeXpjNnc3OEVuNXNTb1E1MXQ0SWluSnJYMy9o?=
 =?utf-8?B?Skdha1FUZ0hJQkNWbjd6Uk5RMG9xMDYwNEIwampBN3FDSkFFbEZKMnNlSzM3?=
 =?utf-8?B?ams5dE9hMUNHRmVsQ29zNm50NG5wYzVHNXVVZ0g2TmsrcGgwYjBvaWVPSk9C?=
 =?utf-8?B?L01VYTVwRHhUZTJKakRPVUJzbUF1b1NYbUttU0E0eE5NS0Yzc28yOGo2Rm1k?=
 =?utf-8?B?MmszcWVBaVFZWU1WNXd3ZERBcUw4TVRBOGdJbFZmcmtzLyt5UEozRXFLT3g3?=
 =?utf-8?B?MTNPcVZGSWVLUzhjWUJITk9nWTRRSVpnWXY0QXF1U015c3cxWi9ZWHJnWWs4?=
 =?utf-8?B?ZFBkYmxFeGFOV0VudnZUVVJuYUo5Y1VKWUNnYmpnWWtnNXdWM3JrOVlQNFhH?=
 =?utf-8?B?NUNEdWJlaXUwR2YrYU5zRzRyMTBkbXBUaC9tYXBwY2hQMjV3dThhUFY0WUJQ?=
 =?utf-8?B?WVNOMmVNK1hoZHZvZlF3dEY0bFRLNURGVm1MNUJBaGJ3cmRBLzNvMlllU2NL?=
 =?utf-8?B?T0U1YWUwTVFHWFZiWmphSGhNb3ZDb08wc0xNR1prZGFlMmgvblhxMkE1bk9Z?=
 =?utf-8?B?WTdNWXRXWHhxcGQrZ2NMRm5vUXhTZTRYbi9CY1Q1YUR0Y21wSFRmbTAvVTlo?=
 =?utf-8?B?OHpPZnk2VHQzeEtGVGpydythWXRzSHV5MVRLbWFyTXF2clhaeXNyQnJNckdK?=
 =?utf-8?B?RDhxL2xoR3JLTU9FaU5QaVpuaTR3NEtza0tzTVAzclczY0QxenFlSGw4aWpT?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c51793-384b-4f04-f6b8-08dd60a856f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 14:23:48.9296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cs7VeB6vn3VlaQEyScwwACdSpY/qBMWigD12sOMGUYOJidXLcZPkESpQUt8F7xIbiDcfDdSajkpkYfg/XlglWYzkcEBVYURwAN7qDzl+ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
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



On 11-03-2025 19:27, Michal Wajdeczko wrote:
> While we can only mimic read32 for a few GT registers for which
> the PF shared the values, we shouldn't avoid calling helper code
> if we try to access non-GT register, as then we miss to trigger
> a debug warning. For cases where sriov_vf_gt was not set, just
> use primary_gt instead.

Under what scenario sriov_vf_gt can be not set for VF ?
Isn't this initialized for each gt during probe for VF ?

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 70a36e777546..13e06a956ceb 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -204,8 +204,9 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>   
>   	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>   
> -	if (!reg.vf && mmio->sriov_vf_gt)
> -		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt, reg, val);
> +	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> +		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt ?:
> +				       mmio->tile->primary_gt, reg, val);
>   	else
>   		writel(val, mmio->regs + addr);
>   }
> @@ -218,8 +219,9 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>   	/* Wa_15015404425 */
>   	mmio_flush_pending_writes(mmio);
>   
> -	if (!reg.vf && mmio->sriov_vf_gt)
> -		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt, reg);
> +	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> +		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt ?:
> +					    mmio->tile->primary_gt, reg);
>   	else
>   		val = readl(mmio->regs + addr);
>   

