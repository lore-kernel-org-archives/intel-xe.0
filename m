Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F771CD4F54
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 06:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F163D10E6CC;
	Thu,  5 Sep 2024 06:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGoXURbC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDD010E6CC
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 06:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725516342; x=1757052342;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HkqkJtJH4syZbRa46V0lFP4ZR7vdjDi2qoMrrXZED7Q=;
 b=hGoXURbCfj2zn9m9he7t9OAZucdWNJ3zzA5S8wNXsHS2PHJYIoXm7+gP
 VuXQ6Ulnq+L7vkSyBHQ6+zzoxXoA7pGbeiNxwBXcDlukzAKBSa35oN8qX
 NyCQ6a5cdI+Q6kFGVAFyLZS7/pXlMFOmE2I+V9Ly6H+dE3cJvtthRzJ5t
 PN8YD1CgzbRMwatMzfETV/FFOzKX2KNdEKGHTV8c5jpptb11sBhb0nFxW
 lcNywbjbv6kpUpMOkHS30B/gUxoUqpWupZTJiC4GFr7yGtDbL4Vdfc3SW
 NVU5rARnWc7QmbZ0cXOtiLY6BEMaf3CNsjDDvtH/uclx+iOlpqmPPm7dB g==;
X-CSE-ConnectionGUID: AAsfDdQiRkOZAWHgt112Qg==
X-CSE-MsgGUID: l3Mfh0vST6+PxdZI8z8hiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24011981"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="24011981"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 23:05:41 -0700
X-CSE-ConnectionGUID: sJue4GpFQhSFpVdK+QL1NA==
X-CSE-MsgGUID: PERcKzEdRmG3VKZDCe8vNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="65167312"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 23:05:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 23:05:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 23:05:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 23:05:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 23:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4vR2Ty6VrQywysNNmfC21eyhBOng+5QtW/+RRxSsm4HwVQXVKrprMwCoTG6gU8JNBpcMkIZ2P6fPnmm76WvJYoH3NRxsw8+ClflsrClPjHIM9Xn14Gm6WJAA4I1J7dIjzO7DM1+IUq5t4xO6o5oXjHdDAiM+dfNo4MVWbLyiuk8RXwdaTv/zfS9bRh41+yKx8fBdsBROesHoNjgvnIihBFCkBzStDWxLZQbdvwT2/PcMpy5PNc7epNpdoQWbnNz6aRgPrMZAxvTKvLtJaSZ/rXzZWuuA7nusF5sSwB6QiI98O42V8yqq0sHBz1JlCrR3RDh2msWAsTRmzXdIIxZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vho1QSbLkoLue1A6AmCjtszFhEn4XbOXTHLwHifvvzM=;
 b=Z9apB6B+ih76mQUGSjWddXq8jXl7tyvduP7xkZYsv2lCVg+iEOF5//S2SqW+1xpzMShIqIIJmmpRQ5AHWnAJ922pIhI/B6fTXeSfzPrtWGDXxt8tWdTzXgPXQbztBsUfeAxm1Rgs3vSlmk0eey2cIl/vauUkH6ELRv3b5c80IPl20zqMRIQsqUzBI6WRbds3jgEw5VwwKrOhWlCH24iu7sjDa2dHt9qr8a1fioD9RIbrtvkHK8qXaN9RJEcc85cwuRlDYnjME4Z1PGgif1Hm8BNFraWH03qMWaeRa4XzDTQ/1MqJEXdWtQHlSubeG7YqUis+hgRdBSutL4v6TCnn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 06:05:37 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 06:05:37 +0000
Message-ID: <3241416b-92d0-4ca2-9329-43ffee85819b@intel.com>
Date: Thu, 5 Sep 2024 11:35:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pciids: separate ARL and MTL PCI IDs
To: Jani Nikula <jani.nikula@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>
References: <cover.1725443121.git.jani.nikula@intel.com>
 <a30cb0da7694a8eccceba66d676ac59aa0e96176.1725443121.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <a30cb0da7694a8eccceba66d676ac59aa0e96176.1725443121.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: a0791658-3700-4c1d-53eb-08dccd70c2ce
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0VCbTA4RUJMNjV6cytOQ2g0SjZSSmdRQ2YzaVNXUUxkNngvWkt4Rll6ZklK?=
 =?utf-8?B?N1BwNFM0S1hXRWVUTXJBQWR0N1VqK21RQnJDUVhWUG5LMFFzbGMwVXhtS1hi?=
 =?utf-8?B?aXhiK1ZIamI0NU01ZC8wOGZjZXl0VFU1cHdmNkFsbGVNNEdubzU0VGVWNzZK?=
 =?utf-8?B?SmhYb1FoNGw5VjBVVVFseXRIZVBTbHZxMkxmZFJJRDhYcDZBMDczTlVCdDZ3?=
 =?utf-8?B?ekpYM0FleVMxVi8zekpaSDhtMVNHMDI5ZzVuRWs2NUNVMHNlRWkvVHNFU2Yr?=
 =?utf-8?B?UFM5andnSVdzenBUbXlpWUZ1WUV0KzFXdHNWSFBoNU1IbGQycUR3U2pPWnRM?=
 =?utf-8?B?YWtCeEtIVkVRVEd1SGJrMVNXdEFWQjI5V25yV3hCRE04WFplMUF6QmpEQm5K?=
 =?utf-8?B?RGRrdG93TDhOTHYyMHJvbTZkWlF4cTF0RVZJcW9LdDI3RGJmTms4QWNuY0pa?=
 =?utf-8?B?R1FFTXRUUkZ4VG0rR05MWlB5QTQ5YnBXNFI5T3o5U08rS1lsdVUwSDNZWHVr?=
 =?utf-8?B?aWc3K3JvTHZ6eWxtRldudkt6ME05UHlHd3M5UytzWWQrTUtEVTdXRkJES0ZX?=
 =?utf-8?B?eUtJRGd5OHVyMmpyczVENWJGS003MmNlQWNxaUVlVnVOU09yNk1VcWg1REJl?=
 =?utf-8?B?YXdFZENpSzlvcTFLaFNvaVZXNUdBYUxRSExrNVV6dGtFaXpBWjZuNUdtRGVS?=
 =?utf-8?B?NXhoU3ZVUkt5d3h4ejgvVEdCM3ZwdW9od3lpMU1qdDlGbWVramhPVWY4Vjgy?=
 =?utf-8?B?SjBBbnppcXBiTis5bXFDN1VKcHVBVHNvSE9nUGticzVtMkRmV205Z2Rva1RN?=
 =?utf-8?B?MlljR2piaFdUTDJEaGx6N2xMd0x5Z3lTZHdpd1VXSXQyc3NhQ2N2eGtDbEsr?=
 =?utf-8?B?eGFpNjZkZjZWUS92QmJGNFJHU0RmMkpNQTlIRDRKajlGU3IzTjh6VjJDTGV3?=
 =?utf-8?B?eW1iRXVmckR5ZjhpL05YdjI0Q0l1OFVRMFp3aFJyK0tDTDRPSVBveXhtTFlO?=
 =?utf-8?B?cnliNHp3WGF2R2xjNUtHUTBjcHJOdk9tYmZOcTlZRWhONldvMnREUU10RmVM?=
 =?utf-8?B?YlVWUnZ3clZna1NGb1hGWkloU0lRaTJyREU3cCtmZ2VTRXhEQVk2b3RBbkxF?=
 =?utf-8?B?Nm9DQVJxeU84UFpWbnV1eU1ZY0djandlVy9YZzBkVDdqWTdjdjJCQ1pwYkxk?=
 =?utf-8?B?a3BuQ0U0UEMwSGxWc3k1VnBseGs0cFdnOEhRNHRLZ0c5MG9WY3k2ZnBYTmVu?=
 =?utf-8?B?YVFFSHlpUzExTEtCMUZ0bUl2OGJUeFBjbkxuRmJZckxNcTAyR3gwaUNTV2sv?=
 =?utf-8?B?TGp1dkdDRlBTTkRIQTZicDNId3FsTXAyN3lhaG5xTzBLcUJscWo3bEpzbEZt?=
 =?utf-8?B?R0Nvekc4b0swT3owNE5kVnVqRVB4UUEzWHMvRWJKZDBBQlhRT3FXckZjbEJ5?=
 =?utf-8?B?b1ZJMk1pYmo5dThNTC9UUi9hVlVHVFJ5aFM4VTkrSU9ianJKd29LUENBQloz?=
 =?utf-8?B?SWdVUGlJaWFjSmhqQ2FKM3dJNGpKOGZRQUF4SmwzNHIwOXk2bCtXdEUvVzZ6?=
 =?utf-8?B?RUNVUWFReENtcWpONlV4UkJUeVBFeGNVZmErRFFpa1dTWm5MTnhGcWNVaXhY?=
 =?utf-8?B?UU8ydGlxc0V6WFl1dEVNRk5EK0ZxclA0a3U3eUN4U3ZGZzZvQ1RPMUdJL3VT?=
 =?utf-8?B?bE1aNVkvMGl0Zy8wb0h0T0NVQ2U0Mk40akkvMWdLY3UvRE1kc0NvRjF1aGtH?=
 =?utf-8?B?K1lna3JQemZSTVVmaWRPMkJadUlGT0FsazRJTmVFUFdOaUVZVXFxNWhieElZ?=
 =?utf-8?B?OEJmZUlLdjdGTHFIRU9UUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFpZa0NUZStOV1YybXJHS1p0dnl2eEFQLzA2cU9rREVjY2VoTTlSTWZZUUw5?=
 =?utf-8?B?NmNyRnNRRTJKNjcxWFRBK0EyUXdTdmlRbW5KSEF3d0gyUnpILzFLSFRobzZF?=
 =?utf-8?B?S0psV3ZsUkVUUUJtb2FBVzZudW9JQVdydjFEMXh6cmdvb3JjQlR1RnZ0THlM?=
 =?utf-8?B?N1RacjkwVFZVcXNic2MraWJ4SzJBM3Rha0VkYkVJVUxaM1ZEUXJIWkhKSXJ2?=
 =?utf-8?B?RW1WRnhJb0FvTVZLTCt6b3pWMHBqUVA2R2hZLy82bEc5ZGdzbGl3L1Q5RVlp?=
 =?utf-8?B?Y1lsN1E4Um52ZmtEekZ1a2E1L1RpMVdNSlRlS3pjNlpnRVBTcW9xM1V2emJN?=
 =?utf-8?B?a3Zuc2JPaGgyelUyUE1NTHNxaHM4c1FEMVgxRklRNGc2OGFYc0ZmL2xLdDBD?=
 =?utf-8?B?a28wWjJMWGQ0dmorb0pOa2FDK01YVG43RTMxd3BqY2RrRjRnbnRnOWxMZm1o?=
 =?utf-8?B?dW1KTXU4dnJpMlNVZi9Mb3Rxc1NCdVBRSVl6bUdmQ1JQQnErZFkrTXVrdUF1?=
 =?utf-8?B?dUJiUk4zZEVaaDZRNFdzUnVFaksxcFg5aGljb2lYVUE3bi9oVGN2a3pmNUNO?=
 =?utf-8?B?ZTR3N1czeGoxSGRvOXlaMUhJRFZSSnZtd2xTMHZjMnJvZ1dhQ1Mxcm9tZHpL?=
 =?utf-8?B?UzBTSXE4TFNMUk9jcXh3S3VuNEo4M3dhUW5tZTM5Z2VDc1RoMzljalN2WE0w?=
 =?utf-8?B?OGdqQUJEUnMySld1NkYyK3JVUHhIZ0V2VUpFc2ZWZ09YM3BXN093Z3NqeE9q?=
 =?utf-8?B?eEN0Um5XelBIZk04aEtJVTc4Z203d3FIUlFaRXlQRGNUeU14dTZWeXdnMlg1?=
 =?utf-8?B?RlhBUC9yVVNQd0xZK3puS3JDVmVPaXJ2ZDh6LysvbW85NWF0TldoVmk2RE4z?=
 =?utf-8?B?aWNmWEQrbysxQmErd0FHeS9oK3hSZEs5eVdzTmVSNUpjdkN5WWRXSmgvRGh3?=
 =?utf-8?B?Sk5mL3NaWWM4aDBkM0dOTlUyVTd4cEtnZzFPU1pGbjRaUGVjc24yeHd3d2Jj?=
 =?utf-8?B?K1FHeEJidHdoN00yTTlpUGU3NHBMZit0ZGJGTk9RTkF6SEJ6b3pzQWE3aVFn?=
 =?utf-8?B?SXNMMUpqbmpnRmRSSm5PQXFBVWhpV0hqM1VxRkJ6ckVvaFh5d296SlRvaVoz?=
 =?utf-8?B?NjVQd05yODZJeUJOTmRmMVFPYXp3Vy9IVlhmbUErTWlKQk9yZUlnVnpOQWhu?=
 =?utf-8?B?c21iaGZ2Um93OVNHU1pmbjlPQ3pYVlNNZERaSkVKM1dCM2U4QkRrQUlyYjN5?=
 =?utf-8?B?UmhsM0VYUlpGaDBhVkJXVTR6R1ppNnc1b05hMVZiM0IxeXZuVHJNZ2NnYk5n?=
 =?utf-8?B?eXlGMVRKTDF3MUh0OWJBMGUvOTZFTVZOODFWQkFORjJNNm1kdGc2Z1hHVEJj?=
 =?utf-8?B?cFhnUXBmb0hzRWRFdXNiUlo3ZGZzOE5ueU9tYkw3MWZTcE0rTHpkYytzNmg1?=
 =?utf-8?B?Znl0Sk5SSmgrYjZBM1NNSnBLcmxSQll1TEMxQ1ZJTmgrVjlUVFk0RDhsbFpn?=
 =?utf-8?B?cnQ5czFrTEQrNjBpajhNU20yK3N3aUhEdmtqMHJzMmEwbVF5RGpxZEExNkNS?=
 =?utf-8?B?aHppRFhrREtuN1VBeGRlWEZYVjRXUkJGNEwwazhpdXlsM0ErYXNCSmMzaC9Y?=
 =?utf-8?B?KzhRQ2laY3VPYmdvcVJsK0NiWGVxbUtJZGpIWDNDZ29sL1BzbUFTYkorbUN5?=
 =?utf-8?B?dDV4Uk1RLzh6VWkzbTJWRGcrVWtzOUhPbGlZam9PMjV4eWdTdDZaL056dlEr?=
 =?utf-8?B?L1k5WkpGZkFSK2pyYVlvN2NvM04wbFZ4Z21rNkpXSUZGZHdtUzZ1d0dZcy9h?=
 =?utf-8?B?RUtYQThhQjZ6cjVWOFlQZkxuS0E4ZFJLanBIa2twenVsWnRrTFRQNWJZYUtB?=
 =?utf-8?B?dEFUZDZOVzBwTXNwNUkyVjZBMFZUUnBuWSs3Qy8ySzNKL2tyU3dCRmw3UUlR?=
 =?utf-8?B?YkpWdkJ2eDBuMnVFaTBod0VOR2hyWjdUTTltNjExM3RlVCtQR2hyMXlCdWhE?=
 =?utf-8?B?aG9tSG9OcTV0OXJXQ01xMjk5N3JtNkZibU1COXN4UkxOVFFMcXdIZWdKWG0r?=
 =?utf-8?B?c3k3Y0tTc2RCU0pGQllrVHIzMzVVQXpTTk9yN2l5WGVBaUlOcE5JS0lyUUlU?=
 =?utf-8?B?ZFdyb1JmandUZzRWRktmSU5QdVVjcENlR1BHWmJyU1dPS0FqaHhNRENsMWVx?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0791658-3700-4c1d-53eb-08dccd70c2ce
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 06:05:37.0942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhfWrzENSyDJG9zXWVi70eCacG5DU/WkbzZ5PCgHmm2zA9EGspund0ua2EdETZtd4Z2Z5jp+cPfWct1CKF1o8GIvgoIknnbi7OxrUBq+RHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
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


On 9/4/2024 3:16 PM, Jani Nikula wrote:
> Avoid including PCI IDs for one platform to the PCI IDs of another. It's
> more clear to deal with them completely separately at the PCI ID macro
> level.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c   |  1 +
>   include/drm/intel/xe_pciids.h | 13 ++++++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b1cf21d77def..5c5eef2ae725 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -394,6 +394,7 @@ static const struct pci_device_id pciidlist[] = {
>   	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>   	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
>   	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
> +	XE_ARL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
With this approach of segregating PCI IDs of two platforms, wouldn't it 
make more sense to have two separate platform descriptors as well, say, 
mtl_desc and a new one "arl_desc"?
>   	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>   	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>   	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 334ab02ed6ca..67baa7c2246a 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -176,16 +176,19 @@
>   	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
>   	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
>   
> -/* MTL / ARL */
> +/* ARL */
> +#define XE_ARL_IDS(MACRO__, ...)		\
> +	MACRO__(0x7D41, ## __VA_ARGS__),	\
> +	MACRO__(0x7D51, ## __VA_ARGS__),        \
> +	MACRO__(0x7D67, ## __VA_ARGS__),	\
> +	MACRO__(0x7DD1, ## __VA_ARGS__)
> +
Also, if we're following platform public release timelines, can we have 
MTL block of PCI IDs above the ARL block?
> +/* MTL */
>   #define XE_MTL_IDS(MACRO__, ...)		\
>   	MACRO__(0x7D40, ## __VA_ARGS__),	\
> -	MACRO__(0x7D41, ## __VA_ARGS__),	\
>   	MACRO__(0x7D45, ## __VA_ARGS__),	\
> -	MACRO__(0x7D51, ## __VA_ARGS__),        \
>   	MACRO__(0x7D55, ## __VA_ARGS__),	\
>   	MACRO__(0x7D60, ## __VA_ARGS__),	\
> -	MACRO__(0x7D67, ## __VA_ARGS__),	\
> -	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>   	MACRO__(0x7DD5, ## __VA_ARGS__)
>   
>   /* PVC */

-- 
-shekhar

