Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993ACC28B2E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 06:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0010E129;
	Tue, 11 Mar 2025 06:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaJ2ytnE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C91B10E0C5
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 06:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741674426; x=1773210426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OixTTlBKX07nT2pWFuEr5iDZPKTxuytrm2/IrOQVK+4=;
 b=VaJ2ytnETET8DK0DmKlQ6BZw0zF6tnZZZgRThsVlrJDBKvwL/b4Ae9mJ
 gPRk5C6Qlai/xIMf0ltmWupTc3jBtZO0FiFPViQD6BAFl4yxdR0XZ7kXR
 WEmDVAStx9hZN1w+owlbfMsbeQD/HGZDZE3ULxXyKrLvjQzb4DKagHDSz
 JG8wjp8tGk7uTTL+C9X0CPyC5T1qW5nuxurK8/wFNKSvAm1Rn5e5eNW2G
 QovyvAMDZSMa5uPAvzw9wqcJpcaBg56hExZYmIvwpC4OkadLE+s7YsFmu
 4HAhCPcpaeFStkQ21uxnvwtvSz7EN5KCmNEH7erMvyERVITKawHLFdXQk Q==;
X-CSE-ConnectionGUID: ILb04C1AR+a8Y8qNyjZkDQ==
X-CSE-MsgGUID: faxTZ43hSD+ft3cUJ39NuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42808925"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42808925"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:27:06 -0700
X-CSE-ConnectionGUID: onisPmguRv6wvDaq1nwIbg==
X-CSE-MsgGUID: 5k5JiFwCQWOIGmKpsAgsTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120243467"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 23:27:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 23:27:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 23:27:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 23:27:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plRwQKGBWUQrpwajTsSQJtbGpjLw2cf2ATnypAmnRBukbhWDCQQt8bl7BCEuBRDv2OeDRWjUAOcuYY/BaRSWWjzdryYZzkfeVBAhwJL0CvYSZnWWVAw1hSk/uDPg9Hzr8Ur81KYXe4Avo3Il9soNMgqicnD88LHAvo9NdA/WjjAgwHfuU07C3+CxyXFikSpjPF/+cVtOkhfiN/2iKCsFKGPYg30gfuY/xjE911CQFpCEty2+kuiys3gj9QEZreJg6bdauNTUJDx9aIsGs8iMSvUGX2+N33TJ1qIzlgevERfNMha+WiTQmjVATHPHExgJSHEgOi/EL9xuCjzQWaXLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9RV1hYLTJpCe0dV5PvbJKcAlJEBQGXmpzzJ5WgBLq8=;
 b=HJng7CBknOsXxa/eTtSO6NPMtaxxCKq4bEc3YKu/Fjh3xSR970YXdzWatYz393ILuYk3hZmrNt/ZzO8FTb9SRd8AqW7Svd+8Fo+HeLxI/QFZHK7lamnerAacs2Nfvw0ZNybvBi6Ckos0oUmDLKgXxRw0yDd5OLqTY8pqRvIcyZLLgnWkMoR3E1Js5TAR5cCkTF4ew/oAQPtp9VGDWp25c/6r6YSR3SnKzYpdHbbVZ0VgnfORjAyvPTbrvhE0/pSwF4R2BwCUIA2x0Fja6em/dK+9MWvr2up+eLroX+A0y7KIohtws2NvfHkmZ0kOVpSvb5x5WALDpgBVhF94Kdw2Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 06:26:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8511.025; Tue, 11 Mar 2025
 06:26:47 +0000
Message-ID: <69e055eb-3cb3-4cbe-b24b-caf1674072f5@intel.com>
Date: Tue, 11 Mar 2025 11:56:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/12] drm/xe/svm: Helper to add tile masks to svm ranges
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
 <20250310124341.1819568-4-himal.prasad.ghimiray@intel.com>
 <Z887VQswA/FNaBYX@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z887VQswA/FNaBYX@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e80d189-9975-4329-854a-08dd6065b357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2tadFhzY3BuVVRRY09KRUtSdytQVVhXYTUvVFhwZXRCbjFsc1dSbVV3VWla?=
 =?utf-8?B?SmxyL05uUHd6WmUyaERYM0c2L3QrQnFZMkZBVXRCMG9zVGFRblRPZExoSXUz?=
 =?utf-8?B?NXdYbW9PY3h5YzRKU2ZTL29yT05YVTQ3SXlKOG13elEvcjRoL2ZxQmNNQjZK?=
 =?utf-8?B?L2xiZE9ySDRnTjdNTzltRm9Odk9XREpYWnppZGdYbXk1cGV6RHRYQkp5TUdM?=
 =?utf-8?B?U3JYTUlMekc0dXBFUUc1aXk1S2xmbjE3N0dyUWhTaXdjc2xBenVCQUpDRHB3?=
 =?utf-8?B?akN4Z01qYWF0amgzVUt4ZkwyZkp3VzFmdlZtT1p4b3FhazRvcDNWZVpYM0dE?=
 =?utf-8?B?cVNaVUgvVjhhUkNQSUlXMjFHVU96SnAvSzFTSUYvdWNKbWJ3N0hUY2huTUdF?=
 =?utf-8?B?UEdEcHBIeW9mYnVsNW9HNlJYc1lFb3I4Zm1qRjkxcGRObWFDZFoyRVJDQ2lB?=
 =?utf-8?B?NC8zU3pMWTBOWnJESzNEWDNnV1dwS0g5b2Q5ZVd4bUZRZ0MvV2JvVVlQTThE?=
 =?utf-8?B?dmlwOTdwREJWU0lwVHBvc0w4RjFBVTFRRWI1UEY5aUJLWm5EMXgwWWFNemNn?=
 =?utf-8?B?dEtKRHJLN3Rxa29aWkgvZW5aRVl1a3lOQ0ZlZTc5NkJJUzQ4RnFpU05EcWhu?=
 =?utf-8?B?R2x0c21Ld1lmcU1DVHBiNVVSTnBvMTZPdmRNTmNLS1lBSnFKSzkvVkhOUzVj?=
 =?utf-8?B?S2ZqWUkvd01lL0RPT1ZxZy9rVGkzN2ZoZ2pCN1hxcDJid2NlUXFSYjllaDZw?=
 =?utf-8?B?ODhDaHgrMURTOUpWcDBibnFQMlkwV1lxcGh6bWp3WVN2KzVHUXJWQWF6bDA0?=
 =?utf-8?B?ZDljNzVyYjg2Wk1HcFBXUWNOVDAydHhrZGRUQTVLUDgvVURzY2dFMUdZMldC?=
 =?utf-8?B?dXh5MmhuZjZSMVFiSWZaMjRMaUVzbHNGbFlhV0JJRytJbmUvazhnNHBCU0wy?=
 =?utf-8?B?U3NEVlBWQUlTandGZFc3T2wwVW5pbWpoZGlicHFlalFuYkNzQzM0dzFIaSsw?=
 =?utf-8?B?SlFoWS9YSHc3UW1mdW1RaDYwS2FSVDhUcVcxVVBSZWNjYllQa1dyRE9Xcjh4?=
 =?utf-8?B?OC9LSk1uVFBiZCtsVVJDb3hlVzdvdm1ya0pYait1VHJpK2l0TzVDbzJJa3hr?=
 =?utf-8?B?VHJGYUhUK0l5YzM5b01Xc1lZbjlKTnh1TGpweS93Y21nUHo0V21RVlc1ZGxw?=
 =?utf-8?B?dUJoVENzZlRZbFJlMUowYnVPYTQrZE4yZkZ0dHRjaVdKdVJSb3VlYWNzTWUv?=
 =?utf-8?B?eFlWMEF2QXIwcjF3TlhYS1hOWklwMFZFTnZZSGVQNFlYbUFlanNnZERLSEZv?=
 =?utf-8?B?bEFvSGJuN0lFUjNINXlVaU9jYVdQVWF2RWtZUnp4VUEwMk9mL2FBUXFuNmd1?=
 =?utf-8?B?M0hGN0JLdXhId0FPdHhGU1d6RXlGZEhwVlN1dThsMEtidHVlWU0zZjdnNTVY?=
 =?utf-8?B?NG1lMlN0Q0RXMmZGMmlGVE8yQ3Y3MFFNbndVc2k3U1NLb01QdU0rYTZaaENS?=
 =?utf-8?B?V1NsWXd4cDhPRVg1Mkw0V2FIaDVpVU5YRVRrbWlxdjhobjVneVdGSDhPU29D?=
 =?utf-8?B?eUZIb2FrS2NSUHlHQjR1Ym5GL0E5WlFtR2tTWnN1UGdUbE9meDBQR2VSQnV1?=
 =?utf-8?B?MkNMbGRTVVZOT1JCQzd2K0ZLaDN5N3M4QVYzZkJHQThBNndleFV6VDg0YlRY?=
 =?utf-8?B?ZEk0ME1Nc0lGSWJLbGdrNXE0cG91OGNKU2RFaXc1UkN1Z0JDeERNMUczdDVY?=
 =?utf-8?B?Q2VESmdEYXhLVWQvcDlmcEQvdFRsL1dsRVdwbThjT24waERLaW01dVFKUWR6?=
 =?utf-8?B?TS9TNXp0Mlg5U1ZHK0NhdkFUTlZqM0tHZ01pazdSU3JIZ1Zob2VjYVpoVGlo?=
 =?utf-8?Q?lVeWfsF4uo15s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlBYclhRZS9USDlkV0hKSnE1OU85dnE3eVJsTUE1UlBRWlQ0aGs2eVNZYTNm?=
 =?utf-8?B?S0Jmd1RQWHRQM3pBTStyY3lEK2N0NzVPYkhrbkpWSWlObGpRbUZPNEU4WlpI?=
 =?utf-8?B?QXUydnRUQ1FiQnp1NXNwYzZFYUdZZUFac1BEaVVHTExhSFdtUFptam81RHkz?=
 =?utf-8?B?SDVIYk1KL1RIWVI3RTVYU3drNUVjYVR0ZnZ6VUNibTQvQmRmbzJsOGNTL0VP?=
 =?utf-8?B?alRnTFFCaVdubmZybHAvRzJTZXB3RStoYkVQM0srVjFYNkZhMEUxWGE1cC9D?=
 =?utf-8?B?VUZCanQ0azVPRkx4K1QvRmJOdzQvYTZxSUpEdHhGZ1ZMSnZJNTdIbVJ2RnpM?=
 =?utf-8?B?dEhlUTY1UG02MjR4N3pSbFJWY0ZmMkR0SnM4SUtKYTEwbU5kaVpRNGI3dWkz?=
 =?utf-8?B?SGtTZEtDTmF5QTFIL0RoRzFpY1RCV1NhUGNEM284YWgxMGZTc1FUN2FTTFBm?=
 =?utf-8?B?eG1KaENxVFhYRG5HM2I4bFVuNnZlS3NHaHpZTUZtTkJQcDBHS3N4U0kxTGxo?=
 =?utf-8?B?NDVXYlFvTXlXVnYrbTJ3bjNLWHhxcEZ0RlFXOXlqRnRLeFRKTHR3QS9JMll1?=
 =?utf-8?B?cWhMQ3FlZkd0cjZ1ZkM0bU56VDd5ckMzdWZWckdkUWYzQW1wMS8wRGloc3FL?=
 =?utf-8?B?SGFzbFhHRnNyek81aU5SOTRId3ZlcEpmSG9UdHREdEhJQmNkUGZrN1ducUhw?=
 =?utf-8?B?SGo3dTRmallUYStMSlQ2bHhCaWhXQ0QzL0RWM1ZnL2ZuSWVXKzRienRVTHRC?=
 =?utf-8?B?RWsyU1daY0lTTmZtOC9CNEphTlF4dytQT2ZacE1wVExqeTV3R2pady9NVkls?=
 =?utf-8?B?VHBtcnVPWHU0Ukl3UWN6NHlncm5VT1YvYy9vWWNiRmluRHBnMEF2akR1UjV1?=
 =?utf-8?B?RUdJU2xURlgrbXdPd042VG5LQlZUNVZpVThFWmpLQ3kvMnR6V1lsWC9ZaVpv?=
 =?utf-8?B?akhGcVpvTVdQRE9BZTNCQSsyVkVjYjR3WFYzSXFqMUdodlpzRm5VbGJsQkVV?=
 =?utf-8?B?cUVYdW5CVWVrRUhPQ09oaGFNTmk3azI2MWYzYnIvQzYxWEljeE9mVUw0QUVj?=
 =?utf-8?B?Sk9qSFRIWm5reGVhY3FIVXZIL205TGZGWng5RzJxS09YdDhDYTMrbzB0N0tW?=
 =?utf-8?B?R0lsdWpXWFRMNnAxTDQ3VTV1RzB2UjkzSHEyNTZjVE9CUnBWVmxGQmhSdFVX?=
 =?utf-8?B?aXlPL0NFVm5BS21YUFVjUDZ1TlIvOXZicU5iOTFQSWJIS1NpMTZGdEplVTd1?=
 =?utf-8?B?T2s2VUtGWkNCeDRlOEQ3NWxzdGd1NTZ3VjhZbXg5M1VEaGtqRWNyS0ZrYVJC?=
 =?utf-8?B?c3VHeVVSQWhXaXhINGlrRmo0dFhWbFRmdFBqOGNSSVRQOVdYbzBpMDhLazcy?=
 =?utf-8?B?ZjczR1dlcUU3dUNqSXh4alYzTDdFZldRbjZPamZkOUYvSUl5MGJCOWdoTjNM?=
 =?utf-8?B?NjNBOWtpZHIxby9CNGhvMjVyekRZUjBjbklVcVh1aTRJV1NKUklwQWt3WURt?=
 =?utf-8?B?SVhTMElmZkJXcGdVVDg1bG00eFF6dVZIOUFKMjV1d3BPcGNscS9EbVl1RHBY?=
 =?utf-8?B?bStaR2xGcFlpV3lkZ3A3amQ0dGxlMUhyZWVNZHpsdXB1bnpmVHFxU29qWDlE?=
 =?utf-8?B?dFkxaE9FNzJPOEFmVnhCazkrdlZuVWEvUDVYeE9zdEtER3ArRkVRd1BnTG5r?=
 =?utf-8?B?b1MwUTVwc0pDQk9zcW5JazRyZUpTWlpvQjNQaTZJRWpSWXhHSTcybjdRUDc1?=
 =?utf-8?B?c0dZWU5iVStaeE1Vd1lMM1Z5TEh6MzJoOXo1UElZaWVKK0pzNTRxYTIvc1ZF?=
 =?utf-8?B?Z3dtdE1EMWlWKzhyYUR1bkNOTlIxai9scC8zY3ZaVzRwTW1GN0VldHIyQ09s?=
 =?utf-8?B?YmI4YXNPVm9wcUorOFRobjlkQ01SWXVCYzE2aHhYYzdycUR0NjRQazRXNlVt?=
 =?utf-8?B?d3pyWWhDaGJjeHAwVFpObzlzdE9VWk9hcWZMNkQraUR5OFJUT3FLcTVlQU9V?=
 =?utf-8?B?VGc5aVhNZk80b2J2cDVJSE5ta2xLaTY4ZmM0WUpWakpHY1hzbjRxVXluZ3Ay?=
 =?utf-8?B?YzE2Znh6ak52ZjlaRmUreFhRMms3Um5YTHNKT2xEZHlsTmJpMlRYdFkvSUll?=
 =?utf-8?B?dWZ2bnlZKzV5RGtsS3EyQWwvMEo0dTZCcVBtZTJwaXI4MlcxWG9MUVJCSExu?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e80d189-9975-4329-854a-08dd6065b357
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 06:26:47.6444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxcUojontctDxKhK8KVPtialPMRnXCrEs24+P1UBKFksdVz9twAhi6m/0O3AL3GpytYsDsSbXg3D7f6hD366iBQwH6IDi3QA6rKqNXvsemU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
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



On 11-03-2025 00:49, Matthew Brost wrote:
> On Mon, Mar 10, 2025 at 06:13:32PM +0530, Himal Prasad Ghimiray wrote:
>> Introduce a helper to add tile mask of binding present and invalidated
>> for the range. Add a lockdep_assert to ensure it is protected by GPU SVM
>> notifier lock.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks

> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index ffaf0d02dc7d..cf7a6ba2aec8 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -2178,6 +2178,16 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>>   	}
>>   }
>>   
>> +static void range_present_and_invalidated_tile(struct xe_vm *vm,
>> +					       struct xe_svm_range *range,
>> +					       u8 tile_id)
>> +{
>> +	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
>> +
>> +	range->tile_present |= BIT(tile_id);
>> +	range->tile_invalidated &= ~BIT(tile_id);
>> +}
>> +
>>   static void op_commit(struct xe_vm *vm,
>>   		      struct xe_tile *tile,
>>   		      struct xe_vm_pgtable_update_ops *pt_update_ops,
>> @@ -2232,12 +2242,11 @@ static void op_commit(struct xe_vm *vm,
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>>   	{
>> -		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
>> -			op->map_range.range->tile_present |= BIT(tile->id);
>> -			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
>> -		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
>> +		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
>> +			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
>> +		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>>   			op->unmap_range.range->tile_present &= ~BIT(tile->id);
>> -		}
>> +
>>   		break;
>>   	}
>>   	default:
>> -- 
>> 2.34.1
>>

