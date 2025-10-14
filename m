Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFFCCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FCE10E66C;
	Tue, 14 Oct 2025 17:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bz/fu54Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E9A10E66C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760463186; x=1791999186;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MHQ04WU1oqUefUQ4k/oNZn1WDPvAPKoplfbaUJf46iU=;
 b=Bz/fu54ZLYHiR8wIj2kV9bqi4HGy+5i+F8OxUI+/XUh4yzdbQ0wQ2Njp
 qFOFe6npyIy760LBNW8RUWmW5/IRH+NmKo6XOCXX6l5u9ug6cxOowQGVN
 OaWQq8Jv/KPaP+X1XWWN7vRU8OcvBxbvfOgjACv0PUqY6cPt7Whf29T5q
 S/qz1MVhCDaPYazwOqMmtGW2eKM1SApbfnQ1Evz9x5XLwQSrSwh/P0n5e
 VYoF2dEUp7GKslzuVx2Qw7ucXklZylWfix31+L9nBpd3VgbZLC223PwLR
 LSJbNk3uGNJggHx6xEtQyc4g/edFr6XbOQQCDLbQLFNTm5JTZTgeJAmsA Q==;
X-CSE-ConnectionGUID: 5UArakXQRIW4H9PKJJ8vHA==
X-CSE-MsgGUID: jt6gwMgMRiKFruJvw0NtWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62539982"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62539982"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:33:06 -0700
X-CSE-ConnectionGUID: n46lI9VPSZGlhLvHW7afRw==
X-CSE-MsgGUID: edg5xVIfRQyy1crMZK43CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181626753"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:33:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:33:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:33:05 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMvUHMrhS9v+rakcA6VmSo7IzIvvFPj9is0LwC7eiGEEs762Jxdj/E1nmvlMlrXjJLSTM0ovoe74QDXZBppbOU10SQbERl+LHCkFAySnU+gnfoUlbHhvlBVrz8xsE6sno/EzPWBEMKOpVAjV6i/7T1sUSvOqwRMTvOSTp7jtkt9fLc0WckD3wETxwzOH3zv24BXIDQ1wpYSm2tWumLv3bP8tEbz/bgMN8Ljkb+tA1Z7uv1H77TULHmEsSHhM2Ht7SJuCEYzN5sTVPSdLdF7cRRF+S4jP0Q5BygLXlvukRBjE55mTpPeeeVSzUaEk42EhdasOICkP1BFEuipnSyFkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAGgq3vQMqwlpJ414BSh1f0lmzCa1GIIoVb+ROCGFV8=;
 b=WIrZbSOCVdpCxlWIVDDbfeGZ7VjYCupVNNCY92fYkG6JR49aEtRKDkkmYWLMoAffnQSy/vvhQAPfq6U/MWdXJbHSSKafbaRDUVo3Vq4Y/yd8Gv9sg4GvmvPF+94M3Hx9YuJ+bvIeHBbeAeIUmRkQIkyioLRnWDXxURIK5LeN4+4YCPLF7Tc2j/pL1Eh6i16+SnX3bZfoIgvO+y3u5HcjpO80smhp09zDfcLafCqZXgXs4V34V4diz1RD90Au4fgGDDrEGdtUJ9rYkUNseBXB9x/f0yJmRH44Ber7hZhaMIwRRybr99HhaLs5+N64s3Vmu5sKjCLidqL1YGN+qaPMYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4733.namprd11.prod.outlook.com (2603:10b6:806:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 17:33:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:33:02 +0000
Message-ID: <fb5a44f0-8e3e-4463-8bad-9d50293e2f92@intel.com>
Date: Tue, 14 Oct 2025 19:32:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/xe: Guard against NULL GT in xe_sriov_vf.c
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <matthew.d.roper@intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
 <20251014164758.125598-13-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251014164758.125598-13-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0283.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4733:EE_
X-MS-Office365-Filtering-Correlation-Id: 5214fe4e-071e-42d2-fc7b-08de0b47b9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDRnVFBlZDk4V2tOODdaVVdJRVpDWGRvbnFGZXhwZTNyRXdFTDhqOGw5cHBp?=
 =?utf-8?B?ZXpuSXFkdzRaOEJYc3ViZDl6S3RqOE5MMVRvc0lrUm5jak13WXJGZGYwMml3?=
 =?utf-8?B?aElVK3R2K0o5MVNSR1creDVLa0JvVGU5clNkc2VOU2NPVkJyTjhrMzJOanhD?=
 =?utf-8?B?RDlDM2kxT1NtbVRMUnhKbGJHUmxTVHBwNFNLeWFiR0JyK0RoemUyZHBiTnQv?=
 =?utf-8?B?SGFWWUlvNGV1WUxUME5EVkRLL0lDcFI2T2dJQ1pWa1VGODdLdEJMUzBXNy9a?=
 =?utf-8?B?Q1l0eHUxeSs1TklzNU11cVJNd3dkVmFxQjZYWktmanBDY1ZmWGxuSXhDci9Q?=
 =?utf-8?B?OFJWWVRkRldhSzJ6MGU4b3RHczA4VGRjbmpsRy9JRVg3VXJ5aktRL2FrV0hS?=
 =?utf-8?B?L1o4UFVLaUtqb0JaK0R4bWEzOHB5YWQ2YjNGbXg5SHVvYXBhVWo1SlNxVGtQ?=
 =?utf-8?B?NzFkeE5jMTFHR1pCWTkvUUJTRDhHTDFXc0ZhU2dCemRsVEs1QnUvck5pZ0ZZ?=
 =?utf-8?B?QUtHa1VZQUdlNUF6L2w2UlBvU0V3UVFzM0VqRllXOVZpQnVDcllreEozTDJ4?=
 =?utf-8?B?N3JKczFDb3VyY3ZhZU5VK0hrSjJIZnd0OG1GTHZDYmhJVExmYUFHQlRjcW1X?=
 =?utf-8?B?T0NudFV2Vm96a29ya3didjVKOWh6YUErR1AvSGFxVElQeTBaWXJXMW83dFVP?=
 =?utf-8?B?eXRLbVZ2VUwwY2dOMVVZL2QvSkhMcjB4dU9xcTRuZlBKTHY3cGViK3NIeTFI?=
 =?utf-8?B?dVl5MWpuTXd0MHloTjV3aDJ6cEdGdnc3eTlON3lBdEZhampyRVpyOWMrT3lq?=
 =?utf-8?B?UElyUDF5bWM1eS9velc4YVY3QlRSYkpuWFNYb3F1V0RQZENpRTBxUndRbUtm?=
 =?utf-8?B?Vy9IS0ZVdUNCeXhmUE9KUjRydWlERFlQUU0raDhvZGJSS2xndlk5TEg2RGF4?=
 =?utf-8?B?dDA2QU9jbzFsLy9nL0NLMWhFT1A0WDZiUlZrNGdxRXErM1dQbHBrWDNyU2Nm?=
 =?utf-8?B?UWNyOU9XNHY2TXAyVXZMVFVjQmozbHlWODJvRTZwaUcydG9JNXhqQmZDY1o4?=
 =?utf-8?B?UjgyS2N0UzJPd2dtS3pJOGFSMXlQVlZoVkJlRTUxSDRTdU03TU5oMTcyR2Vn?=
 =?utf-8?B?RXVLU3VPUStmbi9Ea2QwMEp4bnErUStmclM3SW1XSHRXRWJJQjN5MXRoZ0Vi?=
 =?utf-8?B?eWtaUWpFOUpmZEZmMFY4ZU1TdWFCMHFmd3AyeXdCRTRtMFFmbG5iSmd3UUFE?=
 =?utf-8?B?cXExMFpJK3dycVFTejFuUUVwTDR3VGdIQnlUVXkzcU5OZkN0SkR4MndiSGlR?=
 =?utf-8?B?SEtDSVpDZGI1b1loZXlieUJBSXYvN1MzblZ0MHNEdmYvZGYraDF6L3NnNk1B?=
 =?utf-8?B?SU81Ymp2WGloWkk0WjFNWlRWeDI1eVBTL3NMV284UnRDZnlxRGFJN1lkcEJS?=
 =?utf-8?B?NjhMTG9nQjZSMjZiaVpGcHQyRThQNEI3L2huR3hTMVRJTUpZQ2xGaDNXcVpk?=
 =?utf-8?B?MWhCU1psY2h3b3NpbWVxWmtYZjBUZ0JzM29scjBkaXZjVmxBeXc0QTYzLzlS?=
 =?utf-8?B?Z0pwUmc3OW1qRTNVWGNqbVN1akNDUmluMnFVTkRlSXFtMlBMSU9RUWcvRHNO?=
 =?utf-8?B?WHRMOGdIQUhOZnpvbWVlRHh6VFFBaEVBWXBmZlRpa3ZJR2pyVDRvWnliUklV?=
 =?utf-8?B?NG5Rc2NDb1VhMWh3VlI3elBkcmNQNXpwZjZHajVlQ1lEVGZuNWltYVB5K2Nm?=
 =?utf-8?B?ZXFrRTh3cXdMQ2VOc0JlOVYxc0c1M3ZpU0VZUENGSFNxcmNua2t6V2w3bXpq?=
 =?utf-8?B?ZUF2YnFrTFlaZzIwVFdoSDZXVXMwQWJPaVlkaU1OaFpySkdIdmduQ0I3bkJS?=
 =?utf-8?B?cVpLVnNXTHRXWGo2L0hGaGNxTHlNNHk1bHlXbk4zbG5TMnN3eEVzdUZ0N1Rp?=
 =?utf-8?Q?it1CTeO/Gg8AMVK3SKybHvnHzw1WWIC/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDk3OHdPbHh3YjFxeU1aM1FrVVBIUmE0ZHRVQXl6NjZJRlpEQzBCUU5lZVA2?=
 =?utf-8?B?a29qU2NISkJBQkJIVlg5QitJUDZydnhtdDhoYk9sSGRnVVBFM21OMENlL2VV?=
 =?utf-8?B?ZEFBQ1diVVI5bjdHb0JtUE16VUVNZjJCRnlzNThxR1d1bjl4bWd5YklGRHlY?=
 =?utf-8?B?akVDNk9odlZYWVVDOWF5YWgyZ3VLdmtXbFJNM3FTTHNWS2JhQTV2WnBUendP?=
 =?utf-8?B?bE5TVGthVjVtUkVPZ3BLNkVjc1FZQmZWRGp1ZGJrcmFUSjZXNllyTWpmZ1NQ?=
 =?utf-8?B?cU9oWE94VlBBM2tTZmlzT01pQW9UNklabWUwL2p3bUQ5c0xKYjNWNnhkdVpB?=
 =?utf-8?B?Z2MzTS83NFN0U0RFaHBGNXd3UHhYeDBtd1pveEJKZW43YTNtR3l3bnRyV0w2?=
 =?utf-8?B?N2FHRkFnNnVHMkpjdjU0NW53MWlYbmNWZ0srT1lYbFRmNEdyUStBSG9PZ09C?=
 =?utf-8?B?bnFJbC9HVnlPcWlwRStib2tGTTNMNkFqc3NTMFM3R0FGYktrRmZ6Mzd2dkpq?=
 =?utf-8?B?SnE1WHAzMTMrMXkzVWRkQXVGdWRwWE80bVZVNkIzZERVK3Aya2JNOWxPd1cz?=
 =?utf-8?B?TDY0cEJvT1IrdWJhOS8zdmRYWEdaQklJWEV6YVZjTUNxN0NlRnozVGluMnhp?=
 =?utf-8?B?U2dHVGtWYTQ0RXcxeFFHZ1V2anhiaDB1NW9CU1R0azJMTG9KM0VZbjZwYzBx?=
 =?utf-8?B?cEpscW9tc3BuQUY5TVB4K2xPb2FWOEtZTS95MnhPWlhneU0yNnNyRitWSlZt?=
 =?utf-8?B?Yk44OWF3bzR3SlZ6bElpVkhTcmdkUnMyRTZodG1vM2VKVXNEbzRkSXJMSmk5?=
 =?utf-8?B?K2l1Tm9uL1RKQ1hPZUE5RTZXL0FtSC9DUTBNNWcvdnRlTzJhazRFNGdFUnh3?=
 =?utf-8?B?OWZSRVNZVVNlY2F4ZjFrZS9Lc0pTSmRGbDBKWmFtMlJIWWcyb2hCa0ZlcmZQ?=
 =?utf-8?B?OGdqMjV2RnNGTFFCR215SFNNUXBwTm1nMVB0dEt5dHo1R0RITkxpMlk2eVJ5?=
 =?utf-8?B?UFhhM05ydU9RUnJSWmx3cGFtS2w5V1hIWWgzeWlrM3l5YlBKWXl3T1RaTndm?=
 =?utf-8?B?blNteHhNVlJ1cVIwQnptRzZXSzA3R3pGZ2pKZmZnaTFZdUUwN3dxVTdsOG1w?=
 =?utf-8?B?djduTmpoSmVxRGJDUFpmRXdLeGo5MkhROHlKT3dkcE55cE9NV3cvOGJURDdR?=
 =?utf-8?B?Yk5DTU5jbFZ0dVhVLzhnSFlNK1kyTHR3d08zby8wa2lEYWZydXhHN00xd2VZ?=
 =?utf-8?B?ZXVOVER3V0J3S1JvK1FpdW1lVUpmbEsycStuRUZrbkJNMDdXeFd6U0lxdzdH?=
 =?utf-8?B?ZlpubnZpWkhaUWEwQU5QSlJqQkVReHJDYjRGZWVzbVhLaWllR25PNFYyT3dy?=
 =?utf-8?B?N0FUc0NCbVk0RmJyK1lpZlN3bFJvQWptWndxQ1NvSkRNUXZEcGIvWG9jSURC?=
 =?utf-8?B?S3ZLQnMvNm1hTnJLRkFaV1BQMWxUdGtkMUNRSllaMEF0RngrVmpIcS9IUXNy?=
 =?utf-8?B?N2trL0pWMG9WMVUrMElKcHN6RFlJdk5GR0tpQ0Q1cE5lVmNGTnI3d3luWlU1?=
 =?utf-8?B?MTlmR1ZYYXpSaUVRRWlEMUJ0Z2dVQUplVGUwaFNmbExOcUZiaHRIZkRBV3Fp?=
 =?utf-8?B?eHpTMkxMS2JacnMweUlCVnhsbHZqY0tHcFgwdm5zR2J4d1dqNnN2TDVhQkR4?=
 =?utf-8?B?WWN1SXVCaWJKdnVJOXVHa2cyWTRqNlRzOXV3N1U5RzJSRzlsVlNEZWl0Rncz?=
 =?utf-8?B?QThhRHZKRlVTa3VhYUw1czJxUFdsUWcrR0dxbk5PUmZiQThRcXRMUUlmcUc2?=
 =?utf-8?B?NEpMOHNpSG9YaVRCRUhEV3BtWjB0eTdxa2VQTEN4R1hzVmhxb0JvV0MxZ0c0?=
 =?utf-8?B?UjJaYVk1YnB4R3c1VVlCMGYyRzZlVkVwYUE1YlJRMDBlTWpmbHFWWTU1TUtx?=
 =?utf-8?B?QUFsRGxXVDE4Z3JMckw4blhqQ1hYZjR4UE1FZjIzOThFdSt2ak5HVVo5a1JS?=
 =?utf-8?B?eEliUzFyWE9ya2xPelBRd3AzRHZCbWNFdTZZTG9MdmdsbjV4WWxleWoycHEx?=
 =?utf-8?B?dG80Q3VGdXdML05hZ2RpMTBNQVRmbkxta2V6L3ptbGFxT1d6SW81VC8wNjM0?=
 =?utf-8?B?S1FNRGFKcURIcnEycWx4OWZFbCtRRk4rRldvbnFoUkVUcTNVTnNzTmRwZ3dt?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5214fe4e-071e-42d2-fc7b-08de0b47b9b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:33:02.1296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sd0r6P7EDJpNvvwq1Ee8eHWOSIHqXHGolymPdkUM4d44iwgF9zkN7FSzOvEIDdKu2IvMg168k19uADpYdtIxUAIIiMktZ8YX4jMwAmiaerk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4733
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



On 10/14/2025 6:48 PM, Jonathan Cavitt wrote:
> Static analysis reveals the following issue:
> xe_device_lookup_gt is theoretically able to return NULL in some cases,
> but several use cases don't check the return value before performing a
> dereference, resulting in a NULL pointer dereference.

SRIOV PF/VF can't operate without primary GT, so whatever helper we will
use to get GT we know that such GT must be there (not NULL)

in other words, fix the tool (mark the bug as false-positive in this case)

> 
> Use xe_device_get_gt in places where this is a relevant issue.
> 
> v2:
>  - Use xe_assert in vf_post_migration_recovery (Michal)
> v3:
>  - Rebase
>  - Use xe_device_get_gt
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 189b307901a3..911d5720917b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -166,7 +166,7 @@ static void vf_migration_init_early(struct xe_device *xe)
>  	if (!IS_DGFX(xe)) {
>  		struct xe_uc_fw_version guc_version;
>  
> -		xe_gt_sriov_vf_guc_versions(xe_device_lookup_gt(xe, 0), NULL, &guc_version);
> +		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);

btw, changing the same line twice in one series looks weird

>  		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>  			return vf_disable_migration(xe,
>  						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",

