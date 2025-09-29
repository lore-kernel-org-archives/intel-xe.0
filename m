Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C1DCAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 08:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C469E10E3D5;
	Mon, 29 Sep 2025 08:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTBlpdVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA9B10E3D6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759136160; x=1790672160;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aEZFgbB2zZVrOX0S79IvpCJ4NwSXu4eSYi0lNt+147k=;
 b=TTBlpdVu/Khu5WmYwZKKzQHxSN8MxCeH1jS5awRFanrcpoH0tkyVp75B
 S1fwQR1gPIBR0jHqohTgZgI2pRVdo5UlO/Uf/azNgL4QKuZvZj7/PXUyH
 5vLGhlhW2Jk2RTvIj0EY8OLi6SWUkxbhvrGFafX1F7UZ+wRnFMiJgonsu
 Q7T0c7tOoG5EaCxi9ByPJjxE09gBIiiYdm85xrb1w3jnV91+h5oVS+7Bk
 sqfH7Y2b3wWG5i+cEcGQ+BJ9+AKG7oY7YiI4ioM8OwfVP61FpcSpbqvcg
 e7BCSL2PV2a8hlHXOmSXFb+wFqBM/CPLv72N7+iE8TPlnHQ9ZlvTE8kLP Q==;
X-CSE-ConnectionGUID: Pcr4qF+KTFmFMdQvfdVQNw==
X-CSE-MsgGUID: D0nIdUmtSSS7+bdGrA29Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61331223"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61331223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:56:00 -0700
X-CSE-ConnectionGUID: E9ZvmW0QRIa2or07kzTdPw==
X-CSE-MsgGUID: WgVK/cB1RSGmoUVk+BIz1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177748847"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:56:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:55:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 01:55:59 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:55:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v15DGPM+aPCTbLx0192Jsht9m8aT+HBaoSTMDjOUvn0Hzq9gP+djE6Ao5jeuso1NZL8H207xPvJ6Z979BHcg7s060im6HLe6jKoVxJRaoWjBSoAgRGC5jdj07njGz+ghki+aE2OcSRCyhzQz9FbYc1adKFpPRbWt0e8Isa66A/t3c/MDMFU9Jt2IKZx54rHZ34lCV1i1pZYBKtjwvgm+Stpftw1CcmCy5Mi4RZAC6verSNLdKg3zDwyf5QGCR3fjpighC2aeBqv8rIaZTEI9CLqM4qB5CZ4gV+L1ph53v+IjVV31VnGM1QaxNcbC3JkSu/TO21fYGhnck4WMxYX21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBcZeIlAci1lxXxG4OET8+X7UCvet5AwjtYvlG17txA=;
 b=JZsRpKFEbZta7zDgQeglh7JkRG00Ek3YOsxXVqtUVo253oZGyBoEo7dEFUwun2oKgo3md3OcEyJhHc8TGKjmYAgi1NUHo/1R8GA2YdBC/hXo0kVP+f7L/9UBqm+4kFfq4mrhsRCwAuKB5aJ69xES0wdUsBIyJnw9XKm/rTHgeweHX9W7Dw+jfHZ6o7dJRITN5x77tMg0jzU/kB8npxLRi9FMOIS4h692teGJVJ1laa7o6bg24FoTcJlU+Scpz4NWbgVIFlMkRa7q5nGdttHvWroZB4VXgGr9dVbKng8RGGWGxUdjgxCDVXL2qat6+z0Sjqo2zOeUwxhuVISgfFiGzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 08:55:56 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:55:56 +0000
Message-ID: <725ae00e-8483-4dc0-af11-00346b3f707d@intel.com>
Date: Mon, 29 Sep 2025 14:25:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't claim support for firmware late-bind
 if VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250928174811.198933-1-michal.wajdeczko@intel.com>
 <20250928174811.198933-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250928174811.198933-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 14eb54b3-959f-4c39-0d06-08ddff3600db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1B2QkZ0ejFrVlErQ01nOGx0NGNWZVRQTUViQ3h5eTlDWm5oV2Q1YU5jZG1z?=
 =?utf-8?B?QWtnZU0wYjFEVW1oT0V2VDBSdnlXUjBvTzJIbm1KRUZkMFZnUGl4L3cvcHRT?=
 =?utf-8?B?cUMwSGZLMGk3VUx6ZlczWi94VFZqVHB2Y2xrb3Rqa0llQnlwUTJ4aWtUclY2?=
 =?utf-8?B?SDhqUE1uY3IvYWtxZDA3OU1tZ2kvcEM1ZDlXSVJPQ0RxS1JyTDNDV3c0Mjha?=
 =?utf-8?B?QjQ1emNZZmwxaGRmZXdLdFJFUjBJblAyNVJBcFk3VHROdmNkK3o4eE5taEVy?=
 =?utf-8?B?cDJaMHEvUGFDSDdmTE10bjZpK0Q0VDk0UE1ZYWt0Rk5hWEFFZ3pZbGxNaCtX?=
 =?utf-8?B?SGlmWlBwa1g2eWMxb01wanJvdkZEMURUSjdvZVZjNmtTWlh5dTZQc2p4b05I?=
 =?utf-8?B?YUR5cEFVZUFhUk1mK1pZOUZ5cXh0Q0Q0TjBnbkJqTzJGYVJLUUltYWlyRVY3?=
 =?utf-8?B?K1RWczlHZnlFQXRHcHA3bkZxSWdMMDBlSWJNSzBzQUhFc3dxSVhUaXJWK0Nt?=
 =?utf-8?B?cUhLVElDdVJUWWxWKzlXRDBvcEpjSDlHQjlWMUlkSHNDei9MNTA0eGJ0MGZU?=
 =?utf-8?B?VE0rMUFJd1dSeDdpYUVsZWJnSWtkRVlZeGtNdFNlK0hkcW56Y3QzRXBhNE1C?=
 =?utf-8?B?bUJtUW1hWEpsbXU5NGpOczQ1elZxekEwcUdEOExZbmZyR3IvT0JEQVpHZHlH?=
 =?utf-8?B?QU1OOWFEZzRJdDdlNE4vZFVjY2RhMGo4eFM2Nm5OV2hlWGh3YzYrVWJ1emsr?=
 =?utf-8?B?eGRxY0hMVkRJVlRzQnE4dWtpN3UxNTZzNkYzS0I2akFCK05BNXRLQjZEazJL?=
 =?utf-8?B?Zk9iVDBvZFJmOHVWMnl0OWFxRm9lT1dKaXA0VFlGajczZ25aN0NjdUhyOUN6?=
 =?utf-8?B?UWt6YnVrMTVhMWhRME5MZXRJUFowUXJOY2pXbmJFaVFxTGVZa0VmU3NiYjQ2?=
 =?utf-8?B?V05PcHFKa3dEemNYdGswdjg2aElrUEFwSFN0L01BNm1EV1hmbml2NHJWY3Nj?=
 =?utf-8?B?d3JvMUdqZWFDUFdBQnNjRFRrc3Z0azc5NGpRQXFNVitnMEM4VVRpOTZhQlFq?=
 =?utf-8?B?VnNQWm04RytlUmhKTlg5MWxrYi9uVXk4NUR1M25OZEU1SUJYNnltVlhUdjlB?=
 =?utf-8?B?SXZBTDVWclFSYWsxZEo3bHpvSWllL0xuSm1QWFJtWjN4cTlSV29WTVBnQ0VV?=
 =?utf-8?B?Mm5XQ1Z2U2ZqLzArSXdiayttUEgvVkpQTi9Jdkw3aDhFaUhxYmZnQ3NGZzlS?=
 =?utf-8?B?emUvdUZPdHRYUFFuM0dVR2lJZ2orQ3Q2ZjhtNnRUZmFtcU5qVjFLZ1RCTWdq?=
 =?utf-8?B?VStBb1h2cDUyWEZjTit5eWVhcWRERm8yblNKQzNVN2ZqRlNHUndDb05qdHpM?=
 =?utf-8?B?S0N0RXlzVXFac1VyZTZSMmNnYTZVM3huRUxoOEtESnBWanZ1UVVqTWp6bE1q?=
 =?utf-8?B?SEVkZ3ZWdUl5aUdkNGczaGdDWVhLam1CTld4UWZKd2FzZjBzV3g0d05IZnov?=
 =?utf-8?B?L04zZ1NhQlIxcVBQUkQ1eGhaUHRKclBWM2Y5TEJHejFUelBvOVdsRHIvK0NB?=
 =?utf-8?B?Nkg0L2F0RXRmUUpWU3FIZWw2blAvRHNvUFZEVTlDZVdBanpvN29iLzZ4bEdS?=
 =?utf-8?B?VHBxbGJYUWFOZXkvdmhVNU1mWVpwYXFlWkpQeDdDeXRJYXJuYlJEQzIyMHl6?=
 =?utf-8?B?TmRNWjN3YXhEUU5ydng4Qm8zQStOUzI2WmpheDNLRVQvNzZzaCtqS1hPVjk4?=
 =?utf-8?B?cmhZMUZpMXFOaTlISzBhWmtOcWZ3OFhIYUlkR2J6dk9lQ1RIMVBZUWNiUDJN?=
 =?utf-8?B?MGdqanNXemlId1psN2QzZkprU2cvaThMVS9hdXlERlpZNVlTT21tRk5BdzRI?=
 =?utf-8?B?Sk1JcjlyK2tSQmxNZlRUeW02ZldUL2tyOEppdTFpVFBJOVJLRlN0T2lUQzlz?=
 =?utf-8?Q?nm2OYkYJ5vJnbpO2FEneCNgLvJ8OEeat?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1gyc2kyQnBQTHlTSStneW01K2VXT0c5WUJnU2l3dFVkRytWbDU0OWpZWHpE?=
 =?utf-8?B?ZE5aUmdmQ3hsMitDVUd1ek5aNjBpRkVFeHcwQ1BqWTdvdjV3RVFEMWJUaFRG?=
 =?utf-8?B?YVhnL2tiR09kRUxXcTNXUkQvTjM5Qmhac2xYa01MaU9PcitnU3IxMmJmdnZ4?=
 =?utf-8?B?UWg3eGpKd0gxdkhaaGllMmE1Z2JKa29FMmUyNE81aWl1VUpXTDR4dTFRRDFO?=
 =?utf-8?B?Uk9TMUFOcUZEakJId2JkUk4yRWtjK0tVTmFtdzNRdTVBVENDZlkzWkZUWHBj?=
 =?utf-8?B?Q0FsTTNDSXR5Zy8vZ05iTzUvNE5VdGZUandCZC9QczB2MURXOWZ5b2V5aWpz?=
 =?utf-8?B?WWN4SXZVdHd1TUFRTllzU25kQ0tMNlJpNEI1K2ZDZWVqQklEY0ZWd0loUENL?=
 =?utf-8?B?a0JMdFkxUzUvTHBBMlYzbUNlaEZlci9GZDdrdXBVWE8yMm1aNkRNVEV2ZEFG?=
 =?utf-8?B?RVpOejZwbllRL3NER0xjY1c5YzE3Y2hLODRhTXV2ZXlDUnp6aU9GNk92eFpu?=
 =?utf-8?B?UHF3blI1bnpIMVNDR2plV2RQeE5mRkNxR1VQTWVsMWdmUlJtNUJnMDREZmkw?=
 =?utf-8?B?UWFnWUZHcjdHd3dwM1VXcE1UdzQwOUZsZHR5T01hVHZxU0gySXJ0bWhBNXJX?=
 =?utf-8?B?OWUvemVGcEd1ZEszT0dmdmtBTmtKZVdBc2NzOWozTEQ3cWhSUkRoSjBvaW0w?=
 =?utf-8?B?Y2pHb2JrVjA3VmFwWWVXSUR6eHV6d25GMm9QdW90S1VWMHZvTkdFZ0UvNlo2?=
 =?utf-8?B?MVdCUmw2YWFsbmNqa0ZneVgxbytJc2t4dU1ZU0s3WWZXS1B3ZHpjV2lGUUZu?=
 =?utf-8?B?YWVFZW5CUWlHLzlnRkdjaVVhc3Zaa1N2eVNTTTdYRjJPdklvcnpjMFYyRXJp?=
 =?utf-8?B?ZFJFRzk5Qmx0MkFodjZlaTBjZm9vdTlYWG1Fc2k3RG9mTlcrU0REcmtVakpZ?=
 =?utf-8?B?T3QreURRUk0yb2pxVHJNWW1mMElWUy9ETnplZmUyclpZc05wTjlnTjQrenox?=
 =?utf-8?B?NUxpT3lhd0V5bGE4amszUVo5VW5ieXZOYWc5T1hWSWt6SWJ2M1dZZkFPNHZt?=
 =?utf-8?B?TEUwQll5a1FEb3paQmhidkd3VjEyczY2c1FCSE5pWHZWTWU3dGZmdEFTdkht?=
 =?utf-8?B?SEkycHowd1JaT2ZFc2xMTjVZcUVPb3p0TXlwekJrNjF6blRZbTVWZy9RMnhs?=
 =?utf-8?B?RGFka3RPcG9IRWxPVDBSbmJqblk5V2Vqd3k2djlRY0doK0xyYXFwdGJSR1U3?=
 =?utf-8?B?Q0Flb0U5NERHVVlQOVdwY0RHajJxQlJXNU5tUlJxUUhoLzlaekhCL1F2N3lw?=
 =?utf-8?B?WTJEdTlRKytyVTZpelVIZVlaK0szYkdpM2h2YjhDWlIwZUZLK1Fmc1h0VU52?=
 =?utf-8?B?V0JObGp6R0R4eGwzTDdKZTFCN1pEcS80c0hScHV2UXVpYWFZODIwaStabVVn?=
 =?utf-8?B?bjZHWnN5VHBNRDNlckd4aElaVmwwUExXL2pWYnFoUXZONEZjanNGRnIwd2wz?=
 =?utf-8?B?UDhMSmFTWk5obzBodW50enZtZzNpVFZYTjZnY0MvZmFLcG1hM1RsNVFiaWFD?=
 =?utf-8?B?aTJtVGNselJENUl2VDNSMk1CNkdyeXRVdEc0c0RDV0xuVEZnd0VjSGhrZjVt?=
 =?utf-8?B?Tk1FNzBqY2x4UlZUMjZNOWs2bmtySFdmOTE5eFkyNS9LRVZ0Unhhdjc3cDcr?=
 =?utf-8?B?UkNQenlZcXdiTUMzT1B3OEt3V2doL05lODc3ZUxPeFFjTVNrRDY2M0ZlV0pr?=
 =?utf-8?B?QXl2VTFHVTBhYUZrL3FRekt2cEg4R1BsYzRpMUVBMW9aZXVCRnY2WWRWeHRE?=
 =?utf-8?B?NU1DTCsxRGdRT3FFaGlyZ2p1azNjRHVZd2pUdGo3ZlROQjc2Sld3NkJISUI1?=
 =?utf-8?B?S1ZYczVKeGhZaEZwa1NpM3RlZldzTEVINnh5RXRLVjRYZGhpZVRNZ1dlUWo5?=
 =?utf-8?B?bkdLWlAyL09rNWFKd3ZOb1hJemZPRVZ0aXJ6emFNTEYwYWg0bnJQOHNXejZz?=
 =?utf-8?B?TW9uZVdpd1RBZmtOdmFsZmNPVUs1aFk4OHROR1RGNlVLanlLS3BYZC9pU1d2?=
 =?utf-8?B?eE5hQ3N6N3VJUDhPN3ZHbnRqbkRvS0lFYkJWTkNKMUl4Q1pJdDlOSHFKc3Ju?=
 =?utf-8?B?alN2ZE9CT0ljUlQ2NWxiZTRsa1VneS9tamRCcG5jc3hWNmowNTRUd3o3NFI0?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14eb54b3-959f-4c39-0d06-08ddff3600db
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:55:56.7579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BoVsHdyWHtW4ZGuW9mxlerEngbvTfQAjifXardTDlqnATyjT9IBuGEKYkN3sxakDdh9KsyQ0S2Oyd5jx2L5LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614
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


On 28-09-2025 23:18, Michal Wajdeczko wrote:
> In general, the VFs can't load firmwares so attempt to initialize
> the firmware late-bind component leads to errors like:
>
>   [] xe 0000:03:00.1: [drm] *ERROR* Late bind component not bound
>
> Fixes: 918bd789d62e ("drm/xe/xe_late_bind_fw: Introduce xe_late_bind_fw")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6190
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0421042597a2..386940323630 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -695,6 +695,7 @@ static void vf_update_device_info(struct xe_device *xe)
>   	xe->info.probe_display = 0;
>   	xe->info.has_heci_cscfi = 0;
>   	xe->info.has_heci_gscfi = 0;
> +	xe->info.has_late_bind = 0;

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   	xe->info.skip_guc_pc = 1;
>   	xe->info.skip_pcode = 1;
>   }
