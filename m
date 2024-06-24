Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50229C30653
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 20:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F5B10E077;
	Mon, 24 Jun 2024 20:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HogbutCV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4CE10E077
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 20:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719260305; x=1750796305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=C2df310HVcK4T11gqmlXh/16Vf8Wn4Gt84C2GWr7gFI=;
 b=HogbutCVs2UlX3sUnfRbTt668wMS0bb0B0+Xabw3Qw+qEp6bWxQTi0SX
 NBNs3WZovD1D2vMFbwMVTN/GhlNWelvWUBqjqc1fJfzK+nXWFQQCqRY2P
 gxuQSX/8+ri3W7tFOqtkD95SdGaiNYG/7YkVtXWhSRczH3z7DQwb5rfzm
 Jyz2v7eJLD4YsMQOc4kBn+8iqqbxtcYHXeWAL4aUJ5dAvTksUPscAUzcS
 YYG+6kAuX4/3qzkoPu/In6k60OnLG56yV1ZItqw9MB+8BiNzpYdlhpOvM
 9Dosl2aKdHoVq19vK5gjsFnV8hQCI0AiYBSnvUibZ717Nf6uLndQvAh9K g==;
X-CSE-ConnectionGUID: Bo2Ud0QqS7yhpEwUZcmKGg==
X-CSE-MsgGUID: myKjZKpMQhS62QU3ZvJnng==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="27661911"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="27661911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 13:18:24 -0700
X-CSE-ConnectionGUID: KnDueMQfSRKaMn2XsP740g==
X-CSE-MsgGUID: a7MHP/0fTqGXchqMipWbkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="43499621"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 13:18:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 13:18:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 13:18:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 13:18:23 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 13:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL13loYTvuKyJWJPBs0hf8MZ2/75m9+FubSYAhkas3Jdb4JmXV2y7GstLvnJTimPbhS9dyqxpxQiKPwHKCuufLyKXPEUt9o9LD6bttO3BCA3DbLtHnCsm8SHqC4ZzrfTN9al/Qg1k6LVgZyFFqkSNgwCfBVxsfEMIz0QGqNorrST1tfYF4OEt4sAmDcQVnK+v8DHTjYulh6wUQPIB10LaBwuEjc4/UnMEizdadRXpQvNboFwb7iTsF0r08l8Sr7lHrs7PgF0LcCWUSq6Zfvyp7jbz0zRDYgH5fD3fXbllXPeAMA4BWSxV52sf/OWsBCfhf7PWKGtsMfml+ngRVnNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2df310HVcK4T11gqmlXh/16Vf8Wn4Gt84C2GWr7gFI=;
 b=Stomrp98rbLsSXWEPggFRvY3vdMLbYJ9rYE6l7/nyKHGbma7UK49aKfmAbA2xZ0Wf7J7V99YlbgMXI/qMULXcW4k80cX8QApQ8afa5aUlxRAob8aZkygptZYVrQLRl2cI5WApIvtkUm4VSF1fCB+YDwCwcNoI76jcYXH5om0IgZUbNS9py5zajZzdtl90rEvxYoI52BU6UcfXw0DUkL/0lGROjeNCNRu0DD/4jSc92Lfj8y6btzHrpcOql6Pd7Rd2+7zSEyuGA3ndIaSd5RX2M2ozQdmmOX30TZwD9BFPudN0WtpxUN3B9mQB0kbvd3V6GOz+4KJ7yYBLH0eA/WLVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 20:18:21 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 20:18:20 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/oa: Fix kernel doc warnings in xe_drm.h
Thread-Topic: [PATCH v3] drm/xe/oa: Fix kernel doc warnings in xe_drm.h
Thread-Index: AQHaxaxXYw2AScCiSkaqoT4zhCszLbHW2UmAgAB+w4CAAAPoAA==
Date: Mon, 24 Jun 2024 20:18:20 +0000
Message-ID: <91631dc09610974b9ca5aa1756ee72c258c09dd4.camel@intel.com>
References: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
 <9de03fae-edce-41c6-8b1f-421c83d6c23a@intel.com>
 <851q4mqf98.wl-ashutosh.dixit@intel.com>
In-Reply-To: <851q4mqf98.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA0PR11MB4672:EE_
x-ms-office365-filtering-correlation-id: 846296d9-ff75-4eb3-c11e-08dc948acac6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?cGlVOEpTV1ZvRllqT0VBcjdzRmN1UzhVaVlYVEVHZHhHdXk5N2xSMnVEY3pw?=
 =?utf-8?B?Qk0rNlMwczdnZ25WTlc2M1RiS1pwU3JyUkh0VGJkV1RPcFpOV21JSDNDL244?=
 =?utf-8?B?QXQ3dk5yaDJCRkJYZTdFTlNGbGFnWll2d1d5S1ErMWtpS1VEU2NJT0FaN0FL?=
 =?utf-8?B?cS91dXFCckcreWsxdlkxa3ZYbGFJU0MyeUxJVWc1WnVaYnJnMDFRRWhPaTJh?=
 =?utf-8?B?M0pNRTdZQkhVSUpUcWF1TmZDT0tjK29TRzlMWkFmYStHTUlKT3hlcEIwNzFV?=
 =?utf-8?B?dE1PNUFwRHRJWkF6K21obnBYQmtHN1NvZit4bGhKdWJVOFBpQlFFdTVMS1FF?=
 =?utf-8?B?TGxrb0N2WS9KaU5qZFhac3VSZDloNHRVc2djL2ZrVDI2QlBVYVhXVm5yVjJS?=
 =?utf-8?B?R1lUaDNnamRYKzdxZEEyT0dQL2trODFNblRwWExXUDRjQUtPdm4wVGVQY01r?=
 =?utf-8?B?YVAxWFJBNVhuMTRycFJOeHpuMDE4RXZlTC9qSDBOdG02WnE1NGQyZGJkUy81?=
 =?utf-8?B?NG9QeUxteFoyYUFpUW5xWjhlZXdlMkdoS0pGbjFvakdWc0RnUkQydC9uR2V4?=
 =?utf-8?B?MHFBNlpxRWRCLzNxS2VCNDZSUDhRQmFBR21vK0dGV0JpWEE5b21aRE1obHRI?=
 =?utf-8?B?SFFBNzRGNTJObklFT3BVbjE2MGpQTjFJT0JLSm5iVmpNMmdSWGRaNzhOTWdi?=
 =?utf-8?B?Rk53SFpPdVhBSG9DWUJxOFVhNnlMbURGNGVOQzByMXlOZVlRMG9ubG9PcVd1?=
 =?utf-8?B?WGlueXY5blNiVSs5bENqODZFVWY4RnVnZ3BEOHBEc0R1RWNoN2syb0MzS3Bp?=
 =?utf-8?B?Sjd1RkpqaXBlRmI5VW9wcmR4SEo3K3Z0V0lmeUlaQmtTTzZSUVdnYmhYR1kz?=
 =?utf-8?B?cm0wY1JVWnYyQVRwQUQvNGFYQ0kyeVZBK29ET0RUVEcrcUdvM2U2Y2djdnlB?=
 =?utf-8?B?TzFrZlAyMjdYekxERVNhWitiKzdxZ3NVU2gxVTh5L1Zka0R4M2FIeTRaWVFq?=
 =?utf-8?B?aXdpVmhjeU0wYTFBcnhiZnUxb0RyUEtaYmN4NjRoTmY4RjQwWk9ESXRpeG5n?=
 =?utf-8?B?ZXlCV1drZEZFY1Z3UStrOUVlQzhzcEVnbEhWZllYN1gzZFNvVzRLT3U5RnZk?=
 =?utf-8?B?amZNaDE0WEZNYUUzYlFLWExCNVJxRWxHbDVNc3FaQkhVbEpId0JkSjVVREJC?=
 =?utf-8?B?bGpWQ3loN1RjZVo2azFzZnpZTytadFJkKzNlYnM3SE5STkxIK25VTjBlcUpD?=
 =?utf-8?B?ZFFDOGUySjlmSFh3MjRmdEFvMzV3V0hGc0JlL3VXRzlIcE00bSttRFR0SjF5?=
 =?utf-8?B?YWhKNGJ0UTUzRjdMV2RHWDFnNTMxU2JORjlJODI2ZGlBMTIvVzU1OUxpRzVp?=
 =?utf-8?B?S3pkTFdqNkVGaHBuV3J6YlpBMGdYTXlKMzhhcWVGZy94alpnZmpiZ3BzTmtQ?=
 =?utf-8?B?SldXeDA1UFBydFY4OXhUSDQvMnZMcVBDMDRCa3JISHZHQ3hiNk5BakRJa2Vi?=
 =?utf-8?B?UFJlTCs4TWUrV3UyMlgwNGVJU1lGUjJPVEtTUW5KMisrdmVhanlzYldGZ2pE?=
 =?utf-8?B?VzFMOGVmV0ozRElBSzQ1a3hwRm5hekdkLzJTZGhMV3pBL1gxbWQ5N1FtZEc0?=
 =?utf-8?B?UzU1TldsYU9vb25DWGJsUTRwbDg2VG8rWXJvdlJIbGdvL29qblJhMUFxOTBq?=
 =?utf-8?B?QTV4dHExSm1kVXd6dGkxdlNiSitveFFUb1pya0xRWjBzKzFPQzNJS3d6RHFt?=
 =?utf-8?B?VWhjOG9JZkh0cUpPMkoxVllrZVVzd1JqdWdXZEUwMCsxT0RkWTZWekxnV1gr?=
 =?utf-8?Q?XeH4mmiEuNm5/lVt6xmRLJ2m394IclAL3Z4Vk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWJsTnY5K0RUR2tMVWtsZXV6dWI4MGd2NHhDdmc5d2dSd3l2ajMrNWZXTTlU?=
 =?utf-8?B?cnVmTFBJc1YrbTZiUU1kd1UxQ0lIM3JkTVV0RUZDOUtWZlJaODJ4QU10cDcz?=
 =?utf-8?B?V1VtOEthWVV6ZGZSOUMvaUNIcnRMT0VOYmJxSjRSNU5kQzg1bitHdEI3QzZn?=
 =?utf-8?B?bU0wQ3R0NGhIUlRRa0t1MFFFRjdrM0hkRG9TbVN0T05TMkhIR3Z1NlFpcWFP?=
 =?utf-8?B?dlZQcS9tT2lMTmdMb3FQUGMvb01JaDErdmx6RkZaQUNzR2MxRS9zaitWRzYy?=
 =?utf-8?B?SGRkY3JrRnd4UE04Q1U5bEdOWi96bFgwd1U3RENVY3hIbWp3aHEra055eHBZ?=
 =?utf-8?B?ajMvNThMVWREQnh3Q1hoY0d0dHY5RGUxWG1HMHg2cXdzZjl4TVFyYTNNYnhF?=
 =?utf-8?B?TTBPV01qOHc3bTlWRERZRVhXTlZkVnRiOVYvUUJlM2RpVWx0TnRqNzRPdFBk?=
 =?utf-8?B?aTFzazB2VE5PYWRaS3JJWVM3V3lHdHhCWEVvOVR1a2VCVEFzTzc5MXcxN3cw?=
 =?utf-8?B?MHV6OWxvMjQ1OC80U1VMSS9GSlpFYjVSUnoxVG5TR1NzMmxTZzdpdXBFQzh6?=
 =?utf-8?B?Y1RQano4eC81Y1lISnNjQ0lWY3ZWVGhtRVhHTU83MzlOdjJkQ2w5OFRnc05V?=
 =?utf-8?B?ekxpWXVFQlRGb3hEY2VEaWNuem9XbmpHY1JpbVhJS0tpUHhockNpbktPVzZB?=
 =?utf-8?B?SU9jK05YVHRIN2RTL0VJWkxEV1lPQWpGbnYrS0YwL3RGeVJ4M2tDYTQ4Vngw?=
 =?utf-8?B?dGRrcXBrTE9pOS9JclZoeDFUL3Rlb1BiWUNHZlgwSzB2VFBFVCsxQnBnMEF5?=
 =?utf-8?B?Z1Q5d3c3N2QrdDk5YkVQeG8yTXhpNUhOaDdqcGt6UWxJQjJtd3VrNFU2YXdG?=
 =?utf-8?B?U3M0Y0xackNXdDJFVU9vNVovWTMzSXZPUU1aYlF3Y0crRUk2aUh4VEdJQUlu?=
 =?utf-8?B?UVgxWVVxRmFoUGgvUVR0QWlrQjJHbG1xZmJiQno3WjVxa21DL2hIWkV6QXRq?=
 =?utf-8?B?bzUrMkl1MGh0NWVVdktobmVhNHhtU1BNOHNMaitYRlR5TVlCdHJTQ1ByNWtQ?=
 =?utf-8?B?Wjl5dHFCV1JNazlocEVUalkvNm1kRkcrdGlRNVluTXQwZmJiaXdEWHMvd2RI?=
 =?utf-8?B?dC9iUi83MzQ0RTEvd1lEYUJmQ2Q0Q3dTL0xsaHhMR3ZzbC9Db0NlNGIzZUxi?=
 =?utf-8?B?SW10dFhlOHptT2xoeXd2WGxhVVplTTdRMEcyRklhTDJGcHFTdzF2SVo5TXpN?=
 =?utf-8?B?c3ZCYm5XMW5UZk1Vcys5WFo2cnMvSWN1Z2prdmdOMjNqamN0WlBEam9CSlpO?=
 =?utf-8?B?OUhpTzdncnJHc0trRHYwQjQvUHNNQi95RFdpZklxVHZiUzhTcjVKTWQzMzNJ?=
 =?utf-8?B?U3dVQmkvQXJibnRmYlAwVGIzbUtvRzdyZll2U1V0M3ZLbGFLNGZoQnZtTHJG?=
 =?utf-8?B?ZjBLdXVrcjJhRFZ0UVJ5Z2VVclBWN0ZpNXZzMmRDWFY1Q1BkU2pUMitKNC9G?=
 =?utf-8?B?SU9sMGsyNlIyWi9TY2NuS2dINE9lRUZwOHZSaE95aFpOeUU0MFpTb1ZkS0h2?=
 =?utf-8?B?K3JkeEJVaEJ2NzFlbzFOYWlBU0lTd2NldW9hdklYRVBGQUhqdWVUcU5OS3Mr?=
 =?utf-8?B?cjJJS1lyV3JidnZXa0VXelN6djN2QVFkTUFVd0hnODlRWWlZOWpTOUk1czhq?=
 =?utf-8?B?Q0I5K1NhOEUxaEV0WXRGem9Qd1AvR21MNDVxL2F1NDNMMHEraUlJMitMMUdk?=
 =?utf-8?B?VmRWYjBmYmZFSlhTcUJxOEx6Nkw2ckRWNzlQVm40aGc0UHkzcHNGd3NFdGVo?=
 =?utf-8?B?WjBUbHFtQ0ZKYTRaZ3g3Sk1QQTg5eHdJbllMK2xyMk1NZ29kQlA1ZnRkak8r?=
 =?utf-8?B?TkxObXE1ZzI4VGZrSzlsa3N1bng5TUxBUXVXRzV2SEtRSW5BVm03ckg0RFE4?=
 =?utf-8?B?SFFET29nR2tqYytaNTVJVVhMdk82OWRTbnlxcUt6SEpGWmowcFFTUkpKaXdt?=
 =?utf-8?B?UWZCanF2V0VJNVpibDV0NUdaZDhGNmpOT29GV3V5cjBHQ2laNUpGMXIvdVo1?=
 =?utf-8?B?TDRYMysxSTA3eTV5cktmZjFtTFNSWUJqd0dkRWJndWVhbkNlSS9xRS9OcjZk?=
 =?utf-8?Q?qEeVOUO6b4dntpR9uAXe7Xz6g?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4172304AF7F88499D4CB11C0BC38B4C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846296d9-ff75-4eb3-c11e-08dc948acac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 20:18:20.7909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iikMWv81WYyC3Soa/N3PSP62ywtM/xtUxhZmh82oHFsvBluse9VLe9vyzJ9oKgbRYntyBTuHZFjjfUM7sevz8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
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

T24gTW9uLCAyMDI0LTA2LTI0IGF0IDEzOjA0IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIE1vbiwgMjQgSnVuIDIwMjQgMDU6MzA6MzcgLTA3MDAsIE1pY2hhbCBXYWpkZWN6a28g
d3JvdGU6DQo+ID4gDQo+IA0KPiBIaSBNaWNoYWwsDQo+IA0KPiBBbmQgQ2M6IEpvc2UgYmVsb3cu
DQo+IA0KPiA+IA0KPiA+IA0KPiA+IE9uIDIzLjA2LjIwMjQgMjI6MzEsIEFzaHV0b3NoIERpeGl0
IHdyb3RlOg0KPiA+ID4gRml4IGtlcm5lbCBkb2Mgd2FybmluZ3MgaW4geGVfZHJtLmguIEFsc28g
ZWxpbWluYXRlIHByaXZhdGUvbm9uLWFiaSBlbnVtDQo+ID4gPiBkZWZpbml0aW9ucy4NCj4gPiA+
IA0KPiA+ID4gdjI6IFJlbW92ZSBfX0RSTV9YRV9QRVJGX1RZUEVfTUFYIHNpbmNlIGl0IGlzIHVu
dXNlZCAoTWljaGFsKQ0KPiA+ID4gdjM6IEFsc28gcmVtb3ZlIERSTV9YRV9PQV9QUk9QRVJUWV9N
QVggc2luY2UgaXQgY2FuIGFsc28gYmUgZWxpbWluYXRlZCAoTWljaGFsKQ0KPiA+ID4gDQo+ID4g
PiBTdWdnZXN0ZWQtYnk6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwu
Y29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0
QGludGVsLmNvbT4NCj4gPiANCj4gPiBzb21lIG5pdHMgYmVsb3csIGJ1dCBpbiBnZW5lcmFsIExH
VE0sIHNvDQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53
YWpkZWN6a29AaW50ZWwuY29tPg0KPiANCj4gVGhhbmtzLg0KPiANCj4gPiANCj4gPiBhbmQgSSdt
IGFzc3VtaW5nIGl0J3Mgbm90IHRvbyBsYXRlIGZvciBzdWNoIHVhYmkgZml4dXBzLCBidXQgYmV0
dGVyIHRvDQo+ID4gd2FpdCBmb3IgYWNrIGZyb20gUm9kcmlnbw0KPiANCj4gQ29weWluZyBKb3Nl
OiBpbiBjYXNlIE1lc2Egd2VyZSB1c2luZyBEUk1fWEVfT0FfUFJPUEVSVFlfTUFYLCB0aGV5IGNh
bg0KPiBwcm9iYWJseSBhbHNvIHVzZSBhIHZhbHVlIGxpa2UgMTYgbGlrZSB3ZSd2ZSBkb25lIGJl
bG93IGluIFhlIChJIHdpbGwgbWFrZQ0KPiB0aGlzIGNoYW5nZSBpbiBJR1QpLiBNZXNhIFBSIGlz
IG5vdCBtZXJnZWQgeWV0IHNvIHNob3VsZCBiZSBvayBJIHRoaW5rLCBidXQNCj4gdGhleSB3aWxs
IG5lZWQgdG8gbWFrZSBhIHRpbnkgY2hhbmdlLiBJIGFtIGFzc3VtaW5nIGFzIGxvbmcgYXMgdGhp
cyBhbGwNCj4gZ2V0cyBpbnRvIDYuMTEgaXQgc2hvdWxkIGJlIG9rLg0KPiANCj4gSm9zZSBwbGVh
c2UgY29uZmlybSB0aGlzIGlzIG9rLiBUaGFua3MuDQoNCk1lc2EgaXMgbm90IHVzaW5nIGFuZCBl
dmVuIGlmIHdlcmUgd2UgY2FuIGNoYW5nZSBpdCB1bnRpbCBpdCBnZXRzIG1lcmdlZChhZnRlciBL
TUQgcGF0Y2hlcyByZWFjaGVzIGRybS1uZXh0KS4NCg0KV2hpbGUgYXQgaXQsIGRvIHdlIGhhdmUg
YW55IFVNRCB1c2luZyBkcm1feGVfcXVlcnlfb2FfdW5pdHM/DQpCZWNhdXNlIE1lc2EgZG9uJ3Qg
dXNlIGl0LCBzbyBJIHRoaW5rIGl0IHNob3VsZCBiZSByZW1vdmVkIHVudGlsIGEgVU1EIG1ha2Vz
IHVzZSBvZiBpdC4NClNvIGRybV94ZV9xdWVyeV9vYV91bml0cyBhbmQgcmVsYXRlZCBVQVBJcyBj
b3VsZCBiZSByZW1vdmVkLg0KDQo+IA0KPiA+IA0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX29hLmMgfCAzICsrLQ0KPiA+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmggIHwgNSArLS0tLQ0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX29hLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYw0KPiA+ID4gaW5kZXggNDE2
OGI1MWNmN2I1Li45MjYzYWU5YTg2NGUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfb2EuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hLmMNCj4g
PiA+IEBAIC0xNjg0LDYgKzE2ODQsNyBAQCBzdGF0aWMgY29uc3QgeGVfb2FfdXNlcl9leHRlbnNp
b25fZm4geGVfb2FfdXNlcl9leHRlbnNpb25fZnVuY3NbXSA9IHsNCj4gPiA+IAlbRFJNX1hFX09B
X0VYVEVOU0lPTl9TRVRfUFJPUEVSVFldID0geGVfb2FfdXNlcl9leHRfc2V0X3Byb3BlcnR5LA0K
PiA+ID4gIH07DQo+ID4gPiANCj4gPiA+ICsjZGVmaW5lIE1BWF9VU0VSX0VYVEVOU0lPTlMJMTYN
Cj4gPiANCj4gPiBuaXQ6IG1heWJlIGl0J3Mgd29ydGggdG8gcHV0IHNtYWxsIGNvbW1lbnQgc2F5
aW5nIHRoaXMgaXMgb3VyIGNob2ljZSB0bw0KPiA+IGxpbWl0IG51bWJlciBvZiBuZXN0ZWQgdXNl
ciBleHRlbnNpb25zIHdlIHdhbnQgdG8gc3VwcG9ydCAob3IgYXQgbGVhc3QNCj4gPiB0aGlzIGlz
IGhvdyBJIHVuZGVyc3Rvb2QgdGhpcykNCj4gPiANCj4gPiBuaXQ6IGFuZCB0aGlzIGRvZXNuJ3Qg
cmVhbGx5IGxvb2sgbGlrZSBPQSBzcGVjaWZpYyBsaW1pdGF0aW9uLCBzbyBtYXliZQ0KPiA+IGl0
J3MgdGltZSB0byBwcm9tb3RlIE1BWF9VU0VSX0VYVEVOU0lPTlMgdG8gc29tZSBzaGFyZWQgbG9j
YXRpb24gdG8gbWFrZQ0KPiA+IGl0IHVuaWZpZWQgYWNyb3NzIGRyaXZlcg0KPiANCj4geGVfZXhl
Y19xdWV1ZS5jIGFsc28gdXNlcyBhIHNpbWlsYXIgbWVjaGFuaXNtLiBCdXQgSSB0aGluayBiZXR0
ZXIgdG8gbGVhdmUNCj4gdGhlbSBzZXBhcmF0ZSBpbiBkaWZmZXJlbnQgbW9kdWxlcyBzbyB0aGF0
IGVhY2ggbW9kdWxlIGNhbiB0d2VhayB0aGUgdmFsdWUNCj4gdG8gd2hhdCBpcyBiZXN0IGZvciB0
aGF0IG1vZHVsZS4NCj4gDQo+IFRoYW5rcy4NCj4gLS0NCj4gQXNodXRvc2gNCj4gDQo+IA0KPiA+
IA0KPiA+ID4gIHN0YXRpYyBpbnQgeGVfb2FfdXNlcl9leHRlbnNpb25zKHN0cnVjdCB4ZV9vYSAq
b2EsIHU2NCBleHRlbnNpb24sIGludCBleHRfbnVtYmVyLA0KPiA+ID4gCQkJCSBzdHJ1Y3QgeGVf
b2Ffb3Blbl9wYXJhbSAqcGFyYW0pDQo+ID4gPiAgew0KPiA+ID4gQEAgLTE2OTIsNyArMTY5Myw3
IEBAIHN0YXRpYyBpbnQgeGVfb2FfdXNlcl9leHRlbnNpb25zKHN0cnVjdCB4ZV9vYSAqb2EsIHU2
NCBleHRlbnNpb24sIGludCBleHRfbnVtYmVyDQo+ID4gPiAJaW50IGVycjsNCj4gPiA+IAl1MzIg
aWR4Ow0KPiA+ID4gDQo+ID4gPiAtCWlmIChYRV9JT0NUTF9EQkcob2EtPnhlLCBleHRfbnVtYmVy
ID49IERSTV9YRV9PQV9QUk9QRVJUWV9NQVgpKQ0KPiA+ID4gKwlpZiAoWEVfSU9DVExfREJHKG9h
LT54ZSwgZXh0X251bWJlciA+PSBNQVhfVVNFUl9FWFRFTlNJT05TKSkNCj4gPiA+IAkJcmV0dXJu
IC1FMkJJRzsNCj4gPiA+IA0KPiA+ID4gCWVyciA9IF9fY29weV9mcm9tX3VzZXIoJmV4dCwgYWRk
cmVzcywgc2l6ZW9mKGV4dCkpOw0KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiBpbmRleCA5M2UwMGJl
NDRiMmQuLmI0MTA1NTNmYWE5YiAxMDA2NDQNCj4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+IEBA
IC0xMzc5LDggKzEzNzksOCBAQCBzdHJ1Y3QgZHJtX3hlX3dhaXRfdXNlcl9mZW5jZSB7DQo+ID4g
PiAgICogZW51bSBkcm1feGVfcGVyZl90eXBlIC0gUGVyZiBzdHJlYW0gdHlwZXMNCj4gPiA+ICAg
Ki8NCj4gPiA+ICBlbnVtIGRybV94ZV9wZXJmX3R5cGUgew0KPiA+ID4gKwkvKiogQERSTV9YRV9Q
RVJGX1RZUEVfT0E6IE9BIHBlcmYgc3RyZWFtIHR5cGUgKi8NCj4gPiA+IAlEUk1fWEVfUEVSRl9U
WVBFX09BLA0KPiA+ID4gLQlfX0RSTV9YRV9QRVJGX1RZUEVfTUFYLCAvKiBub24tQUJJICovDQo+
ID4gPiAgfTsNCj4gPiA+IA0KPiA+ID4gIC8qKg0KPiA+ID4gQEAgLTE2MTEsOSArMTYxMSw2IEBA
IGVudW0gZHJtX3hlX29hX3Byb3BlcnR5X2lkIHsNCj4gPiA+IAkgKiBwYXNzIGFsb25nIHdpdGgg
QERSTV9YRV9PQV9QUk9QRVJUWV9FWEVDX1FVRVVFX0lEIG9yIHdpbGwgZGVmYXVsdCB0byAwLg0K
PiA+ID4gCSAqLw0KPiA+ID4gCURSTV9YRV9PQV9QUk9QRVJUWV9PQV9FTkdJTkVfSU5TVEFOQ0Us
DQo+ID4gPiAtDQo+ID4gPiAtCS8qKiBARFJNX1hFX09BX1BST1BFUlRZX01BWDogbm9uLUFCSSAq
Lw0KPiA+ID4gLQlEUk1fWEVfT0FfUFJPUEVSVFlfTUFYDQo+ID4gPiAgfTsNCj4gPiA+IA0KPiA+
ID4gIC8qKg0KDQo=
