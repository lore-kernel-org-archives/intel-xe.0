Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88FFCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B4810E5BB;
	Wed, 10 Sep 2025 21:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZ/8Ye9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662FD10E5BB
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Sep 2025 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757538391; x=1789074391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IhnsYlIURM/O+GYtABjKL/k/vXeFaLHCWnW+Iu52anM=;
 b=XZ/8Ye9+xTxZbi3CrTylvE3AfpVipEflwSeA1fM5DZ5aHtrVsyPLBZX7
 a92BYpgLn2Arvn6d6ARsorK7ccRfNURS8YTAtou4jy9e/Pbs9I/ThpNep
 kxny1Hm6poUmwFtFqqFmuGR4aUPulqIF9PmHkwbySs8lt7gHy1Z+Y8dUP
 NEw/wN1io8TKZvoyS8MrYxWVnuHs2fBlZGmZHN9+wSpKnQE5bzYhK6NO0
 M1iEKGn8NK+28mipI6fTj2qVFhKYXL1qMSVHDUCPfdQv9EZTygpOhcGWv
 Baz9CluJLTVQURfhsQusTgc94ONDzhXZoZOqFqOuirMLQj8gakVY33Jxb A==;
X-CSE-ConnectionGUID: F9wpUTsETu61nyGX5r/cAg==
X-CSE-MsgGUID: 6OFNA5+hReCHqOBSW5b9Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59937066"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="59937066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:06:31 -0700
X-CSE-ConnectionGUID: IhOyFwF5QU+sE8KWyCLKsg==
X-CSE-MsgGUID: AAe4ayhSRfyxchrndpcCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="173085635"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:06:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 14:06:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 14:06:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 14:06:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHbYRT2l+vKTvNZOjKQ2njxtMlNvkZOPnj0Gx+iL6/1ooDkI2fxvB/Cmx5FTK0e3kxqnRxDBEQVFiM6eB/euGLI4ToAexx0TTzwqkjOdN4ng/tLZaDmVVzHUM4UsgWVpg1q9Ee0j3gCjKNx/ernL91QlfCq6RTjldwI4xnqjd4D74LXQZjOv1RCKRHQlgK0WYIr8DoyXmiOKGjGDSVueIGQhMcOYxSJdMgOhS1mTkhNSkxED89YYq7nOzAigu/1/Mdg+SUCJxrv9DHmBLhklj4+zN0bTCzo2ZRCFf187reb07Ea1vMuidwaargQ4HHro/XHFlvo2zUO2XEum2G5Jxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvhHQKjvuzFlZQSqqtqTrA/Ze/Qtp+m53suTOP3DoFQ=;
 b=FTKmBrCpGC9e6zlYgCS3JgeVOvO01YoMan/JzFRp0488AUUXp4/UZ8PJnX146GmNd9G+EtAHxjVVZdlZSk+jc7cLJls0Op3lRydeB4Gvrje21Nfa/8CXRW/6Alkv0U1vjUq/nWyHcGceUdg6WCAeSjfeAsTRUn+lyLBRf/kGJiNOfPpGOyWSbnkrrgK3jbWiL0dIL2DOfPo98fdR0L2BLpSIrbeEnsxaJYPwDpPQu/RbUYZ4pPYJg63HrsXKO6+0ypdbPDnzIQpcuqKhwO8JMCnIRvkKsfvuM6hXOKmqDB9cogZMYLcgVVa55eND0UPxsJAmnehsktRt2hpXbK8g4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 21:06:28 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 21:06:28 +0000
Message-ID: <aaa34a68-49bf-4a47-be07-c4c13b4678cc@intel.com>
Date: Wed, 10 Sep 2025 14:06:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Return an error code if the GuC load fails
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20250909224132.536320-1-John.C.Harrison@Intel.com>
 <9e8460e70cefba27f70a4cfba9f33c58159f4203.camel@intel.com>
 <fcbe0071-82de-4fef-b77a-a1c0f90e80ca@intel.com>
 <8893c2bc6f5711beab86b97132b9db9d86cb705f.camel@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <8893c2bc6f5711beab86b97132b9db9d86cb705f.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:303:b5::30) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CH3PR11MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: a86cf069-1b38-4f6d-4090-08ddf0ade88e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUZnd0dHVWtlRGhNQ0I1N2JqWEV0ODRqNU9BcTUyMHpueVlHSEJwbHF4c0J3?=
 =?utf-8?B?ZEE0TUp5Z01RaENrOFdjVStvYkcydER6ZkRHdnZMNEc2TlMxZHVKcWwyT0lL?=
 =?utf-8?B?OGRIQmRVZE1lUW45Z1MzWTV3MTFrUmFJOHVSSHNjakhKdURTR2xERXB1S1dZ?=
 =?utf-8?B?Y0ZJRGo1RlNyMFc2VndqdytSWWVoWkpoUWF3bmQrdG9Tc2dteHlJMmNuSVR1?=
 =?utf-8?B?R3VHWTNzODVUT1p4N2JGT1lWOHlJL1hBT1dIdzFnM0JISUQ2UERNL0poUTR0?=
 =?utf-8?B?UUplSXVEaEFlTVlzNmxFS1Z5OVo4ci9jck11RkFFOVdYWFNRUU1xKzRJdTFD?=
 =?utf-8?B?R0NnOVhSeHNZL1lXditiRklPS2FXcHNKcGJYWUJvakhySmo5MnFPZ1BqaDBQ?=
 =?utf-8?B?NjNXd0xQVDNoSEM1djJpM1hyejlYeXJTVFV3QUVJTDIzcjRtUlZIbHNyNXlu?=
 =?utf-8?B?U0dOYjdQZFdMMnBMdlV4Q081d2ZkRmM4VnVpQjJMTXlKU2FuQnBsalB0T01q?=
 =?utf-8?B?cHBKZzVjZEJpVVhubUtIS0lRRFBsVHY2Q2IyUFZzTi9hRWtzTzBLWVovN3dY?=
 =?utf-8?B?NlI4NkRXbWpnZ2dYa2tPVXJZN21JVkZqcUNBNFdqVm9ldlhkR0hCY3MyWTUv?=
 =?utf-8?B?TXpsVjlmeXpLenM5b1lqZ1MvVnZ6U2RiREFueFBNb0xZUFdYTXpTZVI4VjhI?=
 =?utf-8?B?YSsxYkVNK1d6eFhKd0NVOU1TN21tUmtNTlhmNitQOE1LSTROU3FDQk1wMndr?=
 =?utf-8?B?NVZPTDN0cFoxck1kOGxlMGlRN1RnWXJROVoyMkgzWmw1U1M4ZWo5eXFicWFU?=
 =?utf-8?B?TG9BZGtIYjhobDF3S1ZHV01zdFYraWJUYktRZWNvWXZUdW0wTGZFY3NaMTl6?=
 =?utf-8?B?c2lRVStyeW1pbGRobHZKamF2TFg4YTBWVmlzZkhLbVk4TS9LcEY3RGZxOElt?=
 =?utf-8?B?enVJcmEra1pLRGFmRFZpdm9NK2tjcmgrTUI5dHdZNGNNU1I3S0FLeE41a0tu?=
 =?utf-8?B?cVBJT0FlUW1YSnh3eElwdnFFMlZpeExZR3pFelpBYUJVNVhaandtNU1YNUhY?=
 =?utf-8?B?Mkx3cmNRNzlJbk1ncXZ3UWV1NENNZ0dnVkFLMUxja1pHUlpKakk4MFQwbFVV?=
 =?utf-8?B?U29IM08zOVViMFA0b2dWTEFIMlMxK2d5cEJxWWdTWTR6T0hvd28rejgrSmVO?=
 =?utf-8?B?R25mUDhLMjI5bFlFdFFVaExUVWZJL3pYbC9tMUZWcmRQazNmM2MyUDdrR2pL?=
 =?utf-8?B?dmJxeE1xdVpJSmoyMlJ0MXFMNnMxQnd2ci8zT0VkNG4vSlc1M05RZUF5YnNn?=
 =?utf-8?B?R3VLbkxjNk9mSG9SYW5vdUppVzZESjFIWTB1aFRUQTJydU9TZDVrTjE1eGRO?=
 =?utf-8?B?d2hGR3NodnpnUVhMSTRzcFJjai81bko1UXVjNktxMW1WZXk5SEwxeWtRQjUz?=
 =?utf-8?B?SmVQUUc2OTl1SFYxTWcxK1VNM2tGZmlOc3kxMDYzSjJzV2ZaQVNvSm9pRENC?=
 =?utf-8?B?cEVmNlhrWGJ4bTg0OFQ4VjUvN21NK1R2cHM1VDBGbElwVkpUY2F5WDBIcGFF?=
 =?utf-8?B?aUVtUC9ZTHU2TmFLakF1S1FsQ0tvOFFUeDF0Ym9LNjh4SFpiN1JTMjRFMEN2?=
 =?utf-8?B?eXFtdmNjei94UTM1TTQ2OVBlbGE3U2JkcEl6ZUxGN1lyTHBQVnNKbFVoYjBp?=
 =?utf-8?B?bys4UGFQSjFLdG5JSWRXQUJKZ21mSHZvMEZMeHFjNnBqaVhBa3U0MTY2MFdS?=
 =?utf-8?B?b3BMbWFPeHdPeXg1cFNVazM5NFY4dFFHbXdZS2IzelBPcmFJZnU5cTAvbTl4?=
 =?utf-8?B?cXphMktBYjBzQVRudWZoVVVWRTRnOEJJNW42TDdieityK2JsZnRHTTJHUmMz?=
 =?utf-8?B?d1VKcUNiVEp4eUxXWGlUTFRFM3pndytMdGdhR1hISGdSS3N0OVNRYWJWKzZG?=
 =?utf-8?Q?hommVjUN5+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJZa1JMb2EraHBWOXNNbFh2WWN2aXRYcXYvQXc5dU5pODlYcEZjMDhnQi9a?=
 =?utf-8?B?enpYOVV0UU0zUFNPN0RmOXhSbUJZZy90TEFjVGtwTTZreHB5STZsbEliRGQ5?=
 =?utf-8?B?NTBWWVhha3kzQzUrKzJ1NHN3Q2pHRWpCZzFRSkJZbGxNWUJmdncwamNxOCtH?=
 =?utf-8?B?aHVoUkV5KzJzWlNXSGFXRktBa09RM0FJUVJVRDRZQU9LdVUzVm0raC9mc3pW?=
 =?utf-8?B?dlp6YWEvd01mVDVqR1JJdHltTmt0UC9rWThvb0hPNkVlMmZwemJlOE1EdXhx?=
 =?utf-8?B?czBNWXhVOWRtbmEza0hWTHBGR09WOW52NjZnRk03cnlLZmN4Rk5OTFQ3Z2FZ?=
 =?utf-8?B?eFd5MTE3bkdjcXJBOUJDZVpOd1QzVUdLbXg1MkJBU0pwc3hEekZrN0dRcjZ1?=
 =?utf-8?B?b3lLYldFMHZEQnNEcS81RU1oZVg5U1RDREk4TnlMd0QrdWQvUmk2MmVuajZv?=
 =?utf-8?B?QWE5N01wTjJzNWh6eTBJUVRVNU9pdzQ3YW4yaGdSRGREeTB2THA2RDZNaDk0?=
 =?utf-8?B?V3JTUGFZb1Q4bmdQMnVTdFJuOFVlNU9xNWlYbEhsczBUYm44ME9DL2RKRE5a?=
 =?utf-8?B?ZkVOYyt6cmEvMUJNd2N3cE93YjNhTkU2VUZVWVdUa2lrR3JlbkhJUU9SSVMr?=
 =?utf-8?B?RTF5L2QxYmRRblNadHo3amJGNEljODR1ajYzTjZUcVIyYWJ0ckNBdWZBaFdH?=
 =?utf-8?B?S0hkTlloQVpIVzg0L1p0MmtMaXBocXk0M1QrYklvemtpcStYaCtPaDRkMytt?=
 =?utf-8?B?STdHL0srNjd1OU1COWxjWmJTU1RhVWRrcTVVSGFicG53QkdBdnlQRkY0SWsr?=
 =?utf-8?B?Ly9pSXJXM251S1pCZjdQK3NSWmptY1RTemJ6a3lucnBuRDhaVEZGL0FZQWYw?=
 =?utf-8?B?OTFsQU54K1dMY01US0RHSUhWVFgrVGRWSWs4UU9lR3BEQkZ1cjFWYnRCalNN?=
 =?utf-8?B?ZW1KVXdzZXdTTDhnOGVyY2lmUE9tUlBVdXcxY3JGWERLUjdLN1RGVnFyMlFH?=
 =?utf-8?B?SGlWQ3VKZUNjLzBMeXFhSzZ3L0lxYTlFWUNzQXhua0NnSVZoWVBUc2luM1Nv?=
 =?utf-8?B?Nm5lQzNMZ3JXVDJBRWROUEQzdkM5bUhSNFYvSHJlYXREUjNLQlJuOS9xeUJ5?=
 =?utf-8?B?SmFsRmZhZ2hTVmRBNWk1S0xjcFlJbHJxcDRCc3RkdlJqam5Oc2ZwV2RTRE1a?=
 =?utf-8?B?Y3dvSElOK1pzWEt4MVlKTVlIUU5DaFBqRFdpczNreHpXOG1Ca1ZRd2wxVUhE?=
 =?utf-8?B?TjhXN1VXWGd4MWUwY3Q4VHhWbE9raTV6b2x5SHJEZWpjZVdwZ204MEVuZHhh?=
 =?utf-8?B?TlNmRkg1R1pIcmxCY0l3VjNncGwxY3JKU1FWaThUZnlNZUVuckpEL2UyQmZz?=
 =?utf-8?B?VkxabzdHTGlSQWdKcnF2OVhOLytpc1VEK1JETmcrdVdwVVBOdHF3dytYOHcx?=
 =?utf-8?B?YVVnNE9kdld0YjgvY3E4Z2h5cVhPWDVZRUJZUkZ6OEpJclhGeWlhZ2l4WlN1?=
 =?utf-8?B?R2tBb0RZNEY5R1BPbnFSamdXa0d2ZG9lSC80THNCaWtNTldKUWhQektPd3Nx?=
 =?utf-8?B?bGxMNEZvRlc4T2RJQi9DbVlRUUgzTWZxK3ljUEIxcm85MkNYOWdBam1iREln?=
 =?utf-8?B?clBrdnNPOEhVTi9QeFZVczVtSGdSSGkyTXNLcnlQa2dtVGpNdW5kWmE5UkVZ?=
 =?utf-8?B?NG5kK0F6dVhYcFRUaUg1SE9Jdnp2cjdVMjlIT3I1aXFpZTEyVW5FbVgrcWZH?=
 =?utf-8?B?YWVaUEJncFpIdHlPc1QxcWJmaHRnZTdvZFpyOGQvQ0d5djBMYUxSYitRYVkr?=
 =?utf-8?B?bVRLbUZoWjh6U3FFbmo1SUREaWsvSmNEcUtDMXlyRHh6V0E3R0Y2dldaUDFn?=
 =?utf-8?B?dCswbUEwMTA3MGhpUEdkNlBja1VtcTN4Q093aUx6aWN3N2x5dFJVRmNtb0Q3?=
 =?utf-8?B?UGlYb2tvblJZdlBqZzdXZTFmMXB2OWQrZnJhWG9FOTZJU2JDd0RpZEFaMzF2?=
 =?utf-8?B?YzhESENkQWFpbUtDZVUxdGJvd0lJMGI5eDVpbnU1S1RTd3VKOVB3Qld3NWxh?=
 =?utf-8?B?N0tacW1RZmZCMldpcWlwSHZhWVlsdlN6RHpiTWtBMzV3akY4WlFYSHVPZjA0?=
 =?utf-8?B?d2lBMUxHR1NQZEVFQWMzV1o4aS82YS9JSitLV2Voa1RZOUg0WVJHZC9XR1c0?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a86cf069-1b38-4f6d-4090-08ddf0ade88e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 21:06:28.2835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxXMHIfFhY12Ooh9zjtGPa0Xo7uqYR923bU4T10o1xw1B4F/0wQkvBIohzBwRVUL+RFMdBrfQlu5SSpi5t33uSMlfg4rii0Uhrk6Hl3VYEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8468
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

On 9/10/2025 12:24 PM, Summers, Stuart wrote:
> On Wed, 2025-09-10 at 11:52 -0700, John Harrison wrote:
>> On 9/10/2025 11:02 AM, Summers, Stuart wrote:
>>> On Tue, 2025-09-09 at 15:41 -0700, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Due to multiple explosion issues in the early days of the Xe
>>>> driver,
>>>> the GuC load was hacked to never return a failure. That prevented
>>>> kernel panics and such initially, but now all it achieves is
>>>> creating
>>>> more confusing errors when the driver tries to submit commands to
>>>> a
>>>> GuC it already knows is not there. So fix that up.
>>>>
>>>> As a stop-gap and to help with debug of load failures due to
>>>> invalid
>>>> GuC init params, a wedge call had been added to the inner GuC
>>>> load
>>>> function. The reason being that it leaves the GuC log accessible
>>>> via
>>>> debugfs. However, for an end user, simply aborting the module
>>>> load is
>>>> much cleaner than wedging and trying to continue. The wedge
>>>> blocks
>>>> user submissions but it seems that various bits of the driver
>>>> itself
>>>> still try to submit to a dead GuC and lots of subsequent errors
>>>> occur.
>>>> And with regards to developers debugging why their particular
>>>> code
>>>> change is being rejected by the GuC, it is trivial to either add
>>>> the
>>>> wedge back in and hack the return code to zero again or to just
>>>> do a
>>>> GuC log dump to dmesg.
>>>>
>>>> v2: Add support for error injection testing and drop the now
>>>> redundant
>>>> wedge call.
>>>>
>>>> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc.c | 13 +++++++++----
>>>>    1 file changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c
>>>> b/drivers/gpu/drm/xe/xe_guc.c
>>>> index e56c9c5c8845..5aa7289cc83e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -1057,7 +1057,7 @@ static s32 guc_pc_get_cur_freq(struct
>>>> xe_guc_pc
>>>> *guc_pc)
>>>>    #endif
>>>>    #define GUC_LOAD_TIME_WARN_MS      200
>>>>    
>>>> -static void guc_wait_ucode(struct xe_guc *guc)
>>>> +static int guc_wait_ucode(struct xe_guc *guc)
>>>>    {
>>>>           struct xe_gt *gt = guc_to_gt(guc);
>>>>           struct xe_mmio *mmio = &gt->mmio;
>>>> @@ -1164,7 +1164,7 @@ static void guc_wait_ucode(struct xe_guc
>>>> *guc)
>>>>                           break;
>>>>                   }
>>>>    
>>>> -               xe_device_declare_wedged(gt_to_xe(gt));
>>>> +               return -EPROTO;
>>> If we error out here instead of wedge would it be better to add
>>> some
>>> default cases to the bootrom and ukernel switch statements above so
>>> we
>>> make sure to catch/notify of unexpected errors rather than just
>>> return
>>> the protocol error?
>> Not following.
>>
>> The switch statement is just about decoding common state values into
>> human readable messages. Each case is literally: 'case X:
>> xe_gt_err("X
>> happened"); break;'. And immediately before the switches is a
>> xe_gt_err("0x%X happened") to give the raw register values. If
>> 'load_done != 1', i.e. we have got into this block of code, then the
>> GuC
>> load failed and the driver load needs to abort. Hence, the return is
>> guaranteed to be EPROTO and the only question is what useful messages
>> can we print first.
> Yeah this was exactly my point. Does it make sense to add a new
> interesting message here now that the "wedged" state is gone? Or is
> having the PROTO error enough as a starting point?
I still don't get what you are wanting. What new interesting message? 
The appropriate error has already been reported. The only change is 
whether we set wedged and attempt to continue loading the driver 
(resulting in lots more errors occurring because the system is toast) or 
whether we just abort the load right now. The actual error reporting is 
unchanged and already present.

>
> I guess not a huge deal since we're already printing all of the
> relevant bits in the xe_gt_err() above..
Exactly. So what more are you wanting to print?

John.

>
> Anyway not a blocker here...
>
> Thanks,
> Stuart
>
>> John.
>>
>>> Thanks,
>>> Stuart
>>>
>>>>           } else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
>>>>                   xe_gt_warn(gt, "excessive init time: %lldms!
>>>> [status
>>>> = 0x%08X, timeouts = %d]\n",
>>>>                              delta_ms, status, count);
>>>> @@ -1176,7 +1176,10 @@ static void guc_wait_ucode(struct xe_guc
>>>> *guc)
>>>>                             delta_ms,
>>>> xe_guc_pc_get_act_freq(guc_pc),
>>>> guc_pc_get_cur_freq(guc_pc),
>>>>                             before_freq, status, count);
>>>>           }
>>>> +
>>>> +       return 0;
>>>>    }
>>>> +ALLOW_ERROR_INJECTION(guc_wait_ucode, ERRNO);
>>>>    
>>>>    static int __xe_guc_upload(struct xe_guc *guc)
>>>>    {
>>>> @@ -1208,14 +1211,16 @@ static int __xe_guc_upload(struct xe_guc
>>>> *guc)
>>>>                   goto out;
>>>>    
>>>>           /* Wait for authentication */
>>>> -       guc_wait_ucode(guc);
>>>> +       ret = guc_wait_ucode(guc);
>>>> +       if (ret)
>>>> +               goto out;
>>>>    
>>>>           xe_uc_fw_change_status(&guc->fw,
>>>> XE_UC_FIRMWARE_RUNNING);
>>>>           return 0;
>>>>    
>>>>    out:
>>>>           xe_uc_fw_change_status(&guc->fw,
>>>> XE_UC_FIRMWARE_LOAD_FAIL);
>>>> -       return 0        /* FIXME: ret, don't want to stop load
>>>> currently */;
>>>> +       return ret;
>>>>    }
>>>>    
>>>>    static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)

