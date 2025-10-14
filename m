Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9034CCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5057A10E159;
	Tue, 14 Oct 2025 17:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVeLTQM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF2810E159
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760462510; x=1791998510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l13nSgJBVomI08JHfdZz1BTD0sxWeGGc8444mFFWzBQ=;
 b=HVeLTQM5KKnrJQixYF6K5q4kBsRV5P+FLQQY4SlnBci/kvImEu3fZVYl
 p1oGRMw2O2XMfY6WZe7NzDO7NRqAFbxwkHUYsrq1MWSVr36kSE090kSaG
 fvxkB+GlyqL0RdqxTjVeF68sBAm7hPH5ek1iS7j9Zs/AX+47pQht5kH8V
 8InAM9df1cZ2hrGLAqPkePnMO23YDlovnHmqecV93TNZuTGcKC6R81rQP
 uQSihQIcZubYj5DoamV52jt7mxut+qRCf9Izuee8ddJlIIliz4Tvx6V0H
 I1sOcV/K4+BDrzvF5X7nS76JdlWEKOOBUYbOkmMwl5s3wgHCi2cv2F/5Y Q==;
X-CSE-ConnectionGUID: yZ2IqWxYQtW7E5GYlHM82w==
X-CSE-MsgGUID: 2cb5+yVlQCGlMZRQICNqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73731335"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="73731335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:21:38 -0700
X-CSE-ConnectionGUID: l/2/zlwoQ5yx9ynqifnVQQ==
X-CSE-MsgGUID: ZC0t4iX2TG6WoLkSmn9mag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181623545"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:21:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:21:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:21:37 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:21:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvyHrqobJDF6BsjL1fHm05J497JKnDRKo6BUp+59iLkF0cpeSN+mQd91WsEXcg+H5M765Io1wRClMwFGew41ZLHEoSE8O2gy3bI3axH4ocY9pUiq5jU5oNT1FydIyDKRMYzXIrAFQKSdwpH9RfVQ5fozTMK2tB+WkzOUJkFFMUxF62uY+bcViPuM1VAiV2nC6M+htQhGbJNozI6hAnSCPFpxsToH+9schgKApj/3Ia35XTUEWmYlwC/5nRp6PfukUtfx5Lh8jdzhhIFVqAdvkExRdMIrNxYWzrQ5l0BhO3FfhIVJbRGFTrPEvrQVOKJ1fuHNCBYrm3vbKWr65PWGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l13nSgJBVomI08JHfdZz1BTD0sxWeGGc8444mFFWzBQ=;
 b=P2A1DYbrXER5wfCjPb53WHyE3uxX2mGF1ZxWzvBNHDBa8FgiERvirZeonFxcNGWa6yIAGxNCbrGs9FkrY+ecTtSnh1TVWq2RhNGIw8leI8u88EkfttqKSR1zwTM2kKzRGwOJ1Q7VncyJWTQbMdM4/7oE2L2IytemPqkLpS0AwE+GVJqPVL7irIc78VOEy7QkO3tU+azcQQKEFtVXdIpoimyveS6uq7QXfSbnIoyV4a9Tj1a3dU3eGd1oGcT953y3LJ2msjbLKReNPmoW0UVBO3tN3DaR2/fjMjfEW7bvtjTEKxDk1CibZVAsAenzOcw8FjhTkc71ciegJyP/G4x+2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 17:21:35 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 17:21:35 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 1/7] drm/xe: s/xe_device_get_gt/xe_device_lookup_gt
Thread-Topic: [PATCH v3 1/7] drm/xe: s/xe_device_get_gt/xe_device_lookup_gt
Thread-Index: AQHcPSpTpnqaDM1NiEGdG5ZGAZh20rTB4nQAgAAAN0A=
Date: Tue, 14 Oct 2025 17:21:34 +0000
Message-ID: <CH0PR11MB54445ED35BC51FD54747443AE5EBA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
 <20251014164758.125598-10-jonathan.cavitt@intel.com>
 <02b2088b-1b61-4774-bef4-33b3d1ef44d5@intel.com>
In-Reply-To: <02b2088b-1b61-4774-bef4-33b3d1ef44d5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7049:EE_
x-ms-office365-filtering-correlation-id: 253b10f7-f0f3-4f3c-acdd-08de0b46203e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?S2JMZXYybWRIS2QyOTdTR0lTazUzQkdUa0NVK1VBdlQwMmJCRDN2STc1SzNG?=
 =?utf-8?B?bEwzVXJJV3B1MElkdVI3VUdCN000VWpLNUwySVlQbklOYVp5TmgrR1YvdHFI?=
 =?utf-8?B?N1VhYVdNZjBKUHFJUHNEdUduZjBYTThsVVQ3SnlvNDk3eWV1NWVEVWhnbzBB?=
 =?utf-8?B?SFZuNVNXYnFyTG5uYzgrNVNCdFJub24vcHNlOTUybmlBSEJ3MU5SbHNwTXdi?=
 =?utf-8?B?ajdmUDFkdXd4dXBlbWI1SVUvdmdNcVZHSnRxazFrMGExYk1xR2xmbkplU0lV?=
 =?utf-8?B?NFEyeFdwYnZqZ0hUQndWQjVSR20vdHdCTGZlRSs0aFpZdTJTYXk4bk5aZVdR?=
 =?utf-8?B?QmVuWGVZU20yWlRpUStOZ2phaFRJQk5lZGh6Z0tiOHJKQVA2TE0rVTA3T1RJ?=
 =?utf-8?B?ZlkwK3JPQ0U0aXVGNDNJVFN2Q2s4SThaU0syQ3Ayc1lvejZvem12ZFBnRzR6?=
 =?utf-8?B?YTlOaURrUzZQenJtQksxN3l0Z01aclNpUzdhM2U2NnJYVHc4WkR4M0k0Y1Jo?=
 =?utf-8?B?SThDS01LSEVmR25zeWNWNjVjai9Ccit3SU1QVS95eVl2eklmbVArK2R0cTc0?=
 =?utf-8?B?bVZoclJZeWxaU3BUbUp6Q1BsZGc3ZGlBQTAzTkZyb1ZaOGQ5czhkVmoyQ2Rw?=
 =?utf-8?B?NUdiRXJ6WUdhQ3Z6Nkc3S0NOWnJDZUh2YURGK0U0N296ckFEcWgwMWllRHVn?=
 =?utf-8?B?MEZnaU4vT0RzQThqd1E4aVZHajNxcHA4VUNUV2hKaU5RbEwrWXVqV0REcjN0?=
 =?utf-8?B?dE5SK2dKRmRhMmY5OTZBakJRQXBURS9oaFF1eDFnL2FXeDloZjVQd3ZDa3c2?=
 =?utf-8?B?bUVGdGhFTHV1U2JKQ1JOMS81YXVheTVadVZXU29XZDJ6RS9kcXc4Q01aNHF5?=
 =?utf-8?B?TmovM1Y4R3pYVUwzdHgwam1QYlMxMGx4MTNzUktFeG02OFFLbDBPOUp3Szdv?=
 =?utf-8?B?bXNSbkdiV09hbXcxM2pkR1M3WFVGTkNYeWR4cTNlajJrU3dvL2N4UU1lOERn?=
 =?utf-8?B?NTJHM01XejZSbWNmb1ZwS1dnd05tdDdnd3Y5VXlsWGJsTWRYS0ljZE5lRkV4?=
 =?utf-8?B?L0Z6SzBUakVZZmZTMXNtbUVpckh1cDdTNmZyQnpaRDcwdmZ1aXZNV0tXR2c4?=
 =?utf-8?B?ZWl4ZndDTlgwL1RkL1dvcmZkd3hVbE9CYXE2b3ZWU2dsL20vQk5YMkNVSllD?=
 =?utf-8?B?d05oYzNhRFp5eXg1aG1rdG1SZm9HQXhXV3M4czhnNS95OUxkMWQzYjFGcVNn?=
 =?utf-8?B?SWVITFE1bi9lWHRWVndJTUZlOUQyaFEwbHlMaEF1ZGVRbFFYUGlTNmx4aHVR?=
 =?utf-8?B?REorVUt6MzYyQUp4YmVUTFRXUXRwUXVnYU1PTUVIbnBzRWd3VXF6dHRhamd6?=
 =?utf-8?B?Ym5NNGc2ZllsV3JETUtSUmlENEF0d1dKMG9BU3ltYkJsN2NzZ1RYUkxEUmFx?=
 =?utf-8?B?RHdockNlUHhmYnhSa0U3OWdKb0dwWkxsVnRYMXFqaWRNYTlmc1dIQUJVUHU3?=
 =?utf-8?B?d2tHRXVPc2ZhQVNxWmRXM0hsc2hiSHQ0bGNUYTJUVGdXdTgwMDZyS2hvU09h?=
 =?utf-8?B?MGN4WmNHQkN6clZzOGFHYUpmVFhnV0FQcFlhV3FwdXJHWEYzT1FsQm16SUZF?=
 =?utf-8?B?TXZlbDIxbFYwOFRqWStmRkxyVDhXL2lJSWJnRzRuYzJFZ2JaS0hJSFFlcCtS?=
 =?utf-8?B?M1NaWUIrUE9USjFCbStXdU44RE95NVV2Y2RnUUpZWTk2RmxTNEZYN1Ztc245?=
 =?utf-8?B?bEhseE9GZFRFdjZnQUVYc0RjcEpyM2JxWWtZR3g4VW1NelpkNGhqZzd5REFI?=
 =?utf-8?B?TTVtRGx3OHJIbWttbk1LZnBXd2ViNkFsUEIxYy80cSs2VUY5THJBUnVYUEdP?=
 =?utf-8?B?ckhNNS9NVGdqNCtXSytpbWlKYkpXMjRhQUFCQW9rWlpMTXdTWnJjbkcxMU5m?=
 =?utf-8?B?ZFVTSVNzYVByT28zK0dLbE00N0tKZCtmcStnQ0l0RlR4RnNqN3FjMlVYbXhQ?=
 =?utf-8?B?YWEzL3VjRDFDRk56TC9XUHh0VStwc3RvNTJOV3RrWHVsdVMxZE0rTkV4MHdn?=
 =?utf-8?Q?4TiUwo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d05KczN4OXlUTUkxTWRGY0RBTmZNZldldllhU2xuZklDL1M0S0w4djhDcEM4?=
 =?utf-8?B?SWd6c3ppdTEzNDVuZkxTZVduQ2FiQVNaQi9QZ29BYWN3OUhKVVY5S3Ivd2Rn?=
 =?utf-8?B?dW8wdEw0RnM1QmtpKzFjWkhrSWdWV1piR3ZHMGo1dEVIS3YvUTJ0eVhCSVQ5?=
 =?utf-8?B?U1dRSk03bXd0djg4VVRmVW1QZGZHKytmRlBkci8vSlBwQVl5L1V1cDRqd2JQ?=
 =?utf-8?B?SWlMNzl3WmFVRm1oMmp6OThkOEtkUzlCM21HcTd0RGRNUitNeUtpMEwzVFpF?=
 =?utf-8?B?K1p3WVhiWFNpYzlSTFFuSUpQUlVwdUZZOW9uekJxbExTZUY0U1hRUVVMUlY5?=
 =?utf-8?B?QVdjWk02RzcyYXVrcWVFdWhla0VBelgvMTZUM0hNOURnYUVPL1dwUXJ2b3Rt?=
 =?utf-8?B?OHNDWXJES01kdTU4VkxQNHFmR1NjRG1rVWVIRFFqV0FNRDRvQU9Hd08ySmI4?=
 =?utf-8?B?REFJUHQxRlpYVyttQ3ZEL1dnQzlDSUVrT0dJTDh6MDVzdWVxb3N6Z0RQTmg4?=
 =?utf-8?B?clhBQk0xUVpMeGF6SGZEeWZCcUNYb3FybzJOdFc0M0FVMlI3RVF6RzhHS0JF?=
 =?utf-8?B?eDZEWUFqR3ZkbE1uN2xTcTgyNVlMbFdCcnlLZHhocGhvVUQvS1lGWUZkc3Fh?=
 =?utf-8?B?ZTFnRVlWVEVndENvRGpoQXNxMXNQdWVta0VTaHdUR0hBekwwTDRuc2EwQXBZ?=
 =?utf-8?B?NG9XSTVKVG9wRnp5WnI5VUFpMFAwYzdEbzNud0xNaFBkSzJkRUUraUc4YkJC?=
 =?utf-8?B?SGw5eXZ4RExZNEgycHZPRzMvK04rbExtR1JPTlRvRFhqRkRXZFd6N1lEQjNP?=
 =?utf-8?B?eG5wTjdMaXlrTXBtSDlCOUVzYU9SUDVUQi9DcnY2V2FNQ0JzZTlvN3BoNGxM?=
 =?utf-8?B?azJoRnNpM2N1OHFxeldCTzF5TzRjeVNQdUswSm44TFVjNm9sZUFFRHFRSU41?=
 =?utf-8?B?TW9jVjF0MHk3dWJJV1ZLRVJJKzhVWkJ5bHduRnNLbDdsVHF3dk5WVW9SNlNX?=
 =?utf-8?B?cERGejhkZ2d6Z2RxWGI3T3B5NlczZWZWMWFNSDBMc3hsUzZHYWt5dGtaTlBq?=
 =?utf-8?B?L2p1UDZoWEhMMGdJd0k0K3pFL1VIakhDQTFpaDhFL3NHWE5NM0xpaFB6U0NX?=
 =?utf-8?B?QkpBZVU1WmpvSkxaaUZBcFlYSFM2RjI3WXRFQUlHcmVoOGtGUHdoOU9EUllp?=
 =?utf-8?B?c2ZlNWR6bmdhWmZJb1kwSEFxN3krallXT3QxbWlzT3RDR0l5bTdJMlNuZTFT?=
 =?utf-8?B?NW5id29zV1B0a24rZS9VZW9zZTB6NG05SmFQQnNTVGRYaEFBQitjdTRmS1Ft?=
 =?utf-8?B?ay9IYmRIdFVUaHphNWs1N0lpcTVzR1JwYmZrTktma3I5ck52R0VqMmFoSXhK?=
 =?utf-8?B?UCtpdVkwUHBQejJyRVRtS0dhRUcvV01BVCszenovK1BJb1lCVS9tRmVRKytm?=
 =?utf-8?B?REZqVHUySVZxN0prTFBwSmZRK0JhTGZyKzRoUVRWY0phVytWbWc3eVlGUGtu?=
 =?utf-8?B?eUtQUk9Bd3ZNb0xGc2Nibk5wcjNHQzRmaWtOTkhHMml0dEJJSHBycG5SMGpo?=
 =?utf-8?B?dlk5cnJrc3BNQmd0UFAybjFLVTRPTFZCcUlXM3dzUHVPQjhMWjk0WVRacERB?=
 =?utf-8?B?ZmY4TXU3QzBOekRKYVJoNFAyYjZ3bHZrRWEvcVRRa0ZveVJBRVJxc0dWTEpU?=
 =?utf-8?B?amxUdHlqQlR4L0JqaXNyaVliSmg2cS85c0QreUpiT2oxRlBsSUhaem9oL01I?=
 =?utf-8?B?L1dSZGF0ZnNMb3FhaXRWaExxN25kQ1lpL1F2NEN5NHMxbG0wVWIydEZhTFF2?=
 =?utf-8?B?azJ0WVd2U0U1Q0MvT1FCM0RiZ08rYTc2K05ReWZLVWkwanVaSTEyWjVMdUxK?=
 =?utf-8?B?dnBNaGhCZGp2Qys2RzNvaVg1dGZUb3hubTVSeERneGc3TzZhdzZYMjQ4YVpE?=
 =?utf-8?B?MDFFQkNVMG1Wb3dTRy9nUW5wKy9ZWUtYU0grNE1pVlBUN25nc3dPQ1F3cU9V?=
 =?utf-8?B?TVk4VmJISmk2NFAzZlAwaGlOTEtvQVJLd1g2UldDYVhOMWRaaDlVM0Z3YXB6?=
 =?utf-8?B?cElrand1QnR3dE5SQmlDZ1hGdmpidXJoc0NTY0Z4clJ4dEdyOHJ4aVZKSVkv?=
 =?utf-8?B?cGNwR1ptUjRBejVFbGNha05BdTRsMVVpL1hvZkxqaHNMQWFIWlZWay9Gekdx?=
 =?utf-8?Q?jbu4efBzIPBS2ywSxi7the2pn5nCA7PF2R+wdWx7SD9f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253b10f7-f0f3-4f3c-acdd-08de0b46203e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 17:21:34.9572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Fea7ZNzYsJ3PSIvBMXBWTAOCphxtD1Zv6LWHERopplzq2ajpYYQwE2T8jPHtD1AYMia49/8rAk28weksbRUifdkyqoPI1Z8B0m+WdNhD/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDE0LCAyMDI1
IDEwOjE3IEFNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEd1cHRhLCBzYXVyYWJoZyA8
c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+
OyBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgVml2aSwgUm9k
cmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBh
ZGh5YXlAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzddIGRybS94ZTogcy94
ZV9kZXZpY2VfZ2V0X2d0L3hlX2RldmljZV9sb29rdXBfZ3QNCj4gDQo+IE9uIDEwLzE0LzIwMjUg
Njo0OCBQTSwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+IFJlcGxhY2UgdGhlIGZ1bmN0aW9u
IG5hbWUgeGVfZGV2aWNlX2dldF9ndCB3aXRoIHhlX2RldmljZV9sb29rdXBfZ3QgdG8NCj4gPiBi
ZXR0ZXIgaWxsdXN0cmF0ZSBpdCdzIGNhcGFjaXR5IHRvIHJldHVybiBOVUxMIGluIHNvbWUgY2Fz
ZXMuDQo+ID4gDQo+IA0KPiBteSBzdWdnZXN0aW9uIHdhcyBsaXR0bGUgZGlmZmVyZW50OiBpbnRy
b2R1Y2UgX25ld18gaGVscGVyIHRoYXQgY2FuJ3QgZmFpbA0KPiBzbyB0aGUgdG9vbCB3aWxsIG5v
dCBjb21wbGFpbiwgYW5kIHVzZSBpdCB3aGVyZSB3ZSBhcmUgc3VyZSB3ZSBnZXQgYSB2YWxpZCBn
dA0KDQpUaGF0IGlzIGRvbmUgaW4gdGhlIHJlc3Qgb2YgdGhlIHNlcmllcy4NCg0KPiANCj4gcmVu
YW1pbmcgbWFpbiBmdW5jdGlvbiBhbmQgdGhlbiBhZGRpbmcgZGVkaWNhdGVkIGhlbHBlciAodGhh
dCBvbmx5IHdyYXBzIA0KPiB0aGUgb3JpZ2luYWwgb25lKSBpcyBub3Qgc29sdmluZyBhbnkgcHJv
YmxlbSBhdCBhbGwNCg0KVGhlIG5ldyBoZWxwZXIgKGFkZGVkIGluIHBhdGNoIDMpIGFzc2VydHMg
dGhhdCB0aGUgcmV0dXJuZWQgeGVfZ3QgcG9pbnRlciBpcyBub3QgTlVMTC4NCkl0IGRvZXMgbm90
ICdqdXN0JyB3cmFwIHRoZSBvcmlnaW5hbCBvbmUuDQoNCj4gDQo+IGlmIHdlIGRvbid0IHdhbnQg
dG8gcmV1c2UvYWJ1c2UgZXhpc3RpbmcgeGVfcm9vdF9tbWlvX2d0KCkgdGhlbiBtYXliZSBqdXN0
DQo+IGFkZCBzb21ldGhpbmcgc2ltaWxhciBidXQgcmVuYW1lZCBmb3IgZGVkaWNhdGVkIHVzZSBj
YXNlOg0KPiANCj4gc3RhdGljIGlubGluZSBzdHJ1Y3QgeGVfZ3QgKnhlX2RldmljZV9wcmltYXJ5
X2d0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiB7DQo+IAlyZXR1cm4geGVfZGV2aWNlX2dldF9y
b290X3RpbGUoeGUpLT5wcmltYXJ5X2d0Ow0KPiB9DQo+IA0KPiBhbmQgc3RhcnQgYnkgdXNpbmcg
aXQgYXMgcmVwbGFjZW1lbnQgZm9yIHhlX2RldmljZV9nZXRfZ3QoeGUsIDApDQo+IHdoZXJlIHdl
IGtub3duIHRoYXQgY2hlY2tzIGFyZSByZWR1bmRhbnQvbm90IG5lZWRlZCAoa3VuaXQvc3Jpb3Yp
DQo+IA0KPiB0aGVuIHVwZGF0ZSByZW1haW5pbmcgdXNhZ2VzIG9mIHhlX2RldmljZV9nZXRfZ3Qo
eGUsIGlkKSBieQ0KPiBhZGRpbmcgcHJvcGVyIE5VTEwgY2hlY2sgYXMgbmVlZGVkDQoNCldoYXQg
d291bGQgdGhlIHByb3BlciBOVUxMIGNoZWNrIGxvb2sgbGlrZSwgaW4geW91ciBvcGluaW9uLCBh
c3N1bWluZw0KeGVfYXNzZXJ0IGlzIG5vdCBzdWZmaWNpZW50Pw0KLUpvbmF0aGFuIENhdml0dA0K
DQo+IA0KPiA+IFN1Z2dlc3RlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPg0KPiA+IFN1Z2dlc3RlZC1ieTogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3pr
b0BpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhh
bi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvdGVz
dHMveGVfZ3VjX2J1Zl9rdW5pdC5jICAgfCAgMiArLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
dGVzdHMveGVfZ3VjX2RiX21ncl90ZXN0LmMgfCAgMiArLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
eGUvdGVzdHMveGVfZ3VjX2cyZ190ZXN0LmMgICAgfCAgMiArLQ0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0veGUvdGVzdHMveGVfZ3VjX2lkX21ncl90ZXN0LmMgfCAgMiArLQ0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0veGUvdGVzdHMveGVfZ3VjX3JlbGF5X3Rlc3QuYyAgfCAgOCArKysrLS0tLQ0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmggICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ldV9zdGFsbC5jICAgICAgICAgICAgICB8ICAyICst
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMgICAgICAgICAgICB8ICAy
ICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyAgICAgICAgICAgICAgICAgICB8
ICAyICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAgICAgICAg
ICB8ICA0ICsrLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtdS5jICAgICAgICAgICAg
ICAgICAgIHwgMTAgKysrKystLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnku
YyAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3Jp
b3ZfdmYuYyAgICAgICAgICAgICAgfCAgMiArLQ0KPiA+ICAxMyBmaWxlcyBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4gDQo=
