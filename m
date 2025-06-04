Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877EEC5AE59
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED2E10E6B2;
	Wed,  4 Jun 2025 00:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mnr9gbXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CE010E600
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 00:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748995688; x=1780531688;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=F1yDxrrbH+tdyjsppCUn8rc2kmnYE4ejIdz091wbS9s=;
 b=Mnr9gbXUs0lrqq32QdL69cfigSxgEu6rlRVgNkg337TEFm5WsUhU33zS
 BDNsz+ZYZjvT2VzgAhLHnfyEF45qVq8kL3+0E/xqQPyWzO3cUm680spDv
 mpbrLVqbcyHPO0MYXmfDGQJnzr6OhGV37Ow8uqs+MuFIU6w9Ikc+hkXgG
 XhV22fgfmJDoB2o8pAfbbHAS5agI8FVukTyzwBOouQnvKtDGvKpXBc0xE
 L4quGpeqDuXEdWaYvXeGQBq9mRboMe/IY0wM4op0eTpgaFqf3PQYb6TFq
 epFOyougoRDoOiJzvhjHkC2jm4wODOGfnkku6G00QLAX78MbdheaA24Yk Q==;
X-CSE-ConnectionGUID: kszFJenFQByS8JzZ9CUCLQ==
X-CSE-MsgGUID: /XstnZ20RnShC+9E3JyoQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50175758"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="50175758"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:08:07 -0700
X-CSE-ConnectionGUID: 3iBwmWjYQ0qsDiJpkvloUA==
X-CSE-MsgGUID: RSqUh3Z/Tc6DolWhPGZZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="150165676"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:08:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 17:08:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 17:08:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 17:07:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaPvjlPE1qj77f5+EjmMOPgRO1hqTn0VbcxqLb7961KnsVuzl25M1DtnG1HgiQYlu4eftNoyQzy/jowJ5yd2XcXZ2eRVZoCIc/4QbAhYRQ2UTDJuWnyygOHNbT96nophpfvgyxpejP6//lFBDbQBN5QR7zSMqC8YkGxcadttUHnRjMCSRFxuUgcrwSAsM5aoxQXifgXx6U4m+3PEk9S9LvwckjwXhTU2mn2CVAb1XoA79FcCoqzWujd/MgW2ENccx1tqLgWLCEDYv0q9Al3XZA9HnvtmzP00yBTYbtUKBIF7AbSkJeVR9Q2PSrJ4KML9uhgmOY6ahNjBnI8JHHF5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1yDxrrbH+tdyjsppCUn8rc2kmnYE4ejIdz091wbS9s=;
 b=upZBWDsFQoL/pv3Ft/N6rDejPdSB/PCfpauR1FyNubq8ozBjkjrENbGpSHgbEYN0PYOAAhxn8hDrmIq1IQs6GF3YONYgSOcB9L4O8K9ikrRYBpLtru0efvPWFDkUi/Kjd8/IkoHRE60cLDTuRZWlEoj2B1sZSVv0JMbfBuAHVJ9jKy22ImVWiRqlQ7vsLBpj/BLSINDrICuhXqVEFok5ggXxKlnYfJsLmE5O8S/GEIIZvuuPR9ziMC47UY14SbrNiJoAjfSEs8ZFCwevK8wG50ISNnkMb4fiMU79kspqar5wqPiWDATGKa+i03K4QGNgncvpeCTBzBPYaUNrcQQ/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Wed, 4 Jun 2025 00:06:52 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 00:06:52 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Topic: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Index: AQHb1Bi2Rz7m/s3aGk2VJ2AWxoSwWrPxs8qAgAASW4CAAA3TAIAAEPKAgAA8BoA=
Date: Wed, 4 Jun 2025 00:06:52 +0000
Message-ID: <7094d8f3f850baed86783365bfbf5ffb84663edf.camel@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
 <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
 <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
 <5f834906-e62e-4a61-8dbc-7bed51904548@intel.com>
In-Reply-To: <5f834906-e62e-4a61-8dbc-7bed51904548@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA0PR11MB7356:EE_
x-ms-office365-filtering-correlation-id: 9188714b-31a3-4a4e-00b2-08dda2fbb586
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WkRKek4zVnhKa08rYUN1OFYxRmNFYy9JaXRweWZvM0t3ZExxWlQ4WGtIdkFS?=
 =?utf-8?B?YmloaUs1YUliaXZNNnRubmk3djh4QS9sSHFvaFIyN3JrYURUZXRWblRNUWdG?=
 =?utf-8?B?M1lBQXN5MVdpQm55YmFkUURRWUdQRWhob2MyRlVsWVUwbFBMWHJaQU9xVGVQ?=
 =?utf-8?B?RkExeThMYkxRcHZSbURNTnhZT0QyYldPa1YwUUJ3eGd0VHVTNVJDOHBCVEVo?=
 =?utf-8?B?d1Iwb2lheFYvdEZUbFhkVjhLSytJdTVhUmEwQk9TQVpOWDNFMVNjaXZ5MGkr?=
 =?utf-8?B?elNpalkrcFJhMHNQRXVZdGRVR1FoV1RKRU8xZ2xPdUZrejc2R005SlVCV2xz?=
 =?utf-8?B?cDdXZHhNcFh6S20xRVNqS0NNakg1VUJVOURCRWhOWDhIc0czdjhBM1gvUFRU?=
 =?utf-8?B?YkVOQit6QXltemFaZnp0T1BZVWpCWlBtb2FRdHdiSzNwc0lLOW1US0QvQk5N?=
 =?utf-8?B?QXhMWjl1cy9FeStWZkYrVVBMbzFxenVoY2NUM0V6VmlISS9iMXBKQUZKVk13?=
 =?utf-8?B?d2lJczBWeFNXcWZ5U3JtNklZaFdqRWhNWG9USVNWQmxMNlhNRE5ZYS80OHBW?=
 =?utf-8?B?YXVSenVaMW90dFVpOU9McUg1K2J1WWxwUHZwSzhzMnNRSUdmL1loTUI4bGoz?=
 =?utf-8?B?V2p5ZHNnQU85cWJDc0dHVUhsaGpSdXI5SVN1SkxNeUxwMGJQYTU5REwvVFlx?=
 =?utf-8?B?S2FIMDlER1ZqczFJWTJ1MVFEL0h4a3RZSEpZZ0hYc1ZxVUptV1draGJXd3BE?=
 =?utf-8?B?WlhMaS8zNW5xcGNQenNyRTBZVkF5NzlwZnRMTUVIR0c4eHUwZEFHdkF6eloy?=
 =?utf-8?B?UWdZYkhTRUMxNzFVZlBHVU5YY3o2YTI4TFF4UU1OZkduQVRUQzMzcjQvWTdB?=
 =?utf-8?B?bmlyb2xwdmJXZVJMQm83Zk54SlBrbVBEMkdpMGtnbmVYWFkrN3BZUUpzeE9s?=
 =?utf-8?B?V1dZVUtPZExSaHZYQ1hRNUZ3OW53M0NLYU5QODQrWjVQSHFkamxLMloyN3J6?=
 =?utf-8?B?UDA0c09zWFlSZjZmVlBhNFB3R0hvWUo5aU5RRTNaNFE4cXQwWkgxaTFoMndS?=
 =?utf-8?B?RkZsblR4Z0ZzcVBXOFAxbGJ3bmE2RlBISWw0dzhUdEZYWVZDWHN4WGROS1Nu?=
 =?utf-8?B?RkNGeGlwZUZWd3h5cURrYmNsb2xBZHFhajRucnkrVDIzSm5tTkhacm01ZUls?=
 =?utf-8?B?eTJaSEUzUEdyNzZJNk9VOE9sOXBKNnU2TTRlVVVZRGJDRjJRdmV2dGxZSjFT?=
 =?utf-8?B?bE5tSERHRzFQTUo5eDRRdHk4ekx0bVFQcXVQS2VCS3drWlJ5M2g4blZGb28v?=
 =?utf-8?B?MGdsNWgwV0ZsUzNNcitTSzRXODlIbTRNU0Z1akNQdkJaa1pLS0ExbDFSdHdv?=
 =?utf-8?B?TzgvWXlENmd5S1krMlZUcWlxWnN6a3lqa2Z2Vy95NzNXSjlQRFJYOWJoRDRT?=
 =?utf-8?B?blNMQ1dkWW9wM3ZWZnE5dUNXR29vN3FFNmtod0pPdXlhNTJ5NmNQWWJvQ2xV?=
 =?utf-8?B?RS9BZVVrRnZ6eFcrWE1kaG9hc0dLQmJ3WWMvWU9tN083T25qMzNML09PbkRU?=
 =?utf-8?B?eW5rbEpLcncvOGVOcVhzVFViT1pqc0Eyc0RybUdyNWRqVmJMbU1hWHYxZ01p?=
 =?utf-8?B?ZDhyVkIzc0J0a3U0a2VKc3ZTclJGR0wzY2JIUGlNcnlnb01MeTFXYVI0UUt0?=
 =?utf-8?B?U2pLZ01LeXlBS2N3OElnSWo1d1k1cGdpM1ZMMTI1c0x6QTRnZER1L2xiRkFE?=
 =?utf-8?B?SXZMMFBLR1Z0NlhrdDV2V1NRdVBJMDRNcnVyTTN4RXBVajhScklrWi9CenZI?=
 =?utf-8?B?N3N0VElGVnJqWk8wNDh2aWJhRUozaGJDQjJYZWN2NHFFMVpCU1pQZFh3bW5F?=
 =?utf-8?B?Y0JGL1M3WVlKOWRyTGN1U1VLOXdETERmMCtJNFVWUmwyMzdReUwrUHZtNzM1?=
 =?utf-8?B?QU8ybis4cUN3eDNRKzZOWW9seStRNm80aDdHNnNycjBqNUpxRjNwaFAwVlA3?=
 =?utf-8?Q?cXCMO1sBiAecYkJ2Yvtulg1oMdSDaA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHdOUysyUDhIMjlWSUVtTk5GdXkxTk5qWGQrTm1qWngxWTZSWTRQN0h3MUdX?=
 =?utf-8?B?U1NBNExYWDRKay9XVWRQMTMweW1JV3pqVmpNZDMwYlJna1hXSzN0YXVzSkZE?=
 =?utf-8?B?UHhvamJuRjhWMmtucUZkT0QxcEtxajVyUStUZFpCTU1zUVQ1aUEwVnA2NHZL?=
 =?utf-8?B?cENTVzhTZEUzQzhCbGlUV1Y3KzM0MHBRa2djamEySlNWZUxtN1hvNnltYzNu?=
 =?utf-8?B?UGdNancrcnhJa1puKzJXU2JXaXM1S1N4MzdJWndpSzRraEZIaVp2RVJnR1lC?=
 =?utf-8?B?VCtTL3czREZBUmhWVEFyRTlMQ2libVl1ZWU3Y2pIM1RId1NDUTdqMy82T2Z6?=
 =?utf-8?B?Z0F5SFpONmUrTVNpMGVEd1ZPL2d1QmRabHFhZzF1TU9FOGZVUS91c2YyekVn?=
 =?utf-8?B?cGVqNEkyV0d2dHJrTjUrem9RelZEYW1pcG5TSDlFWDk0RWhHQVJ5N21XMTJj?=
 =?utf-8?B?YVdITU83cTZsNjF1bEczd3MrNk5UYzdEOUVkaFBUampHUGluTnlRVnhzKy8x?=
 =?utf-8?B?RzZBL3dhRWZFNVRCUU1iZ1RQREZFb0NiMnF1RWJZRzJCRjlxb1QvOSt3YzJp?=
 =?utf-8?B?TURoSWU1RVhEMENPaEpzTlN5YlV5MFF4cTdhLzVOTXAwb3pZcXRnUXBFemIv?=
 =?utf-8?B?TTJYcEdIR0NWcTRCNHpBVFBKRzFPb3JOdGVtaDdUM211MmtudWpGczFDQ3Y5?=
 =?utf-8?B?UFNFMUxGWHhBYkx1Y3ZNZUlEZE56dEdPUWpUd2hOTkdldEtSa3laWmdmQkVC?=
 =?utf-8?B?UEhyeE1tbVZEa1V2Z0dsdmg0cFZ6Y2xSVXVNd25iZWtOU1pNdUtuMHQxczZx?=
 =?utf-8?B?NFZRQnRLRndqcFpPQVJ5MHRwYlZTNUxXR2FWZFB3ZDU4TTRycFRUSkxmOW5w?=
 =?utf-8?B?Mk9nSGhWS0hacDhERVZxZGE1bjBCaVVTRVIyL1NIM0JKWWdiWUlqbktSQ1Zx?=
 =?utf-8?B?MGZRMnJTeFhHYWFpYktrTzlVa1psTGxVV0djVmNYdEZVTkltWVNjcVJqTFhP?=
 =?utf-8?B?NVJxV1poeEdXd3JKUTVsaVJvRWhHWG1jcjJOc2d3ZVVFZXZPSzVBUnh3RGxV?=
 =?utf-8?B?Q0RNUStlTDVielBuNXcwZ1pZWFBiVXZ5WTJ1K1h4dkdjdE5oMUdIeFdRN1Uz?=
 =?utf-8?B?aEUvQ0FzdlYyWTlYMkNmaGlkK203dURET1AxZGEyWlhna0p2OFJrZDRVRlVm?=
 =?utf-8?B?VGMwRHMyVDJRekUxdDdqeitSOHJtcWtzT3Yvc0J2eFg4MkEvb2tLYlk1d2tZ?=
 =?utf-8?B?VVVRejVQWGtlbE45NDd6ZmV3ZGk0ZXNEVW5pMjU0VG55SHhBN0t4SVllekNG?=
 =?utf-8?B?Z1VYc25nOGt2bzdnMVNOYVV0Q1RBQ0pWZEFaWVIrb0lMb2RXajhXSkRmajFa?=
 =?utf-8?B?N0VWM1NRMk5xOUt4Y3lXYnN6bkd6K0lrSnhMRjdCOXV5bWlOaEJPcEUxQnZ6?=
 =?utf-8?B?Q0c5V1hRYlRYTVpEM1pxdWJpakM0WnBMaVljcWoyZk5SU3FZcjJndHloK1JG?=
 =?utf-8?B?NjV4RDNHNUkxQ3VSdzZ3UXpDRGM3OVpPTWliZVdwR2thYk9Gbzc0c3REN1Jx?=
 =?utf-8?B?SmtVRjJzNXRvZUtKK3NacG91bTBJcHU1QzN1MVJhdk4vZW51TFRtOU9rN2xU?=
 =?utf-8?B?ZjFJY3ljZjZMM3VkVXU0d1cxVTBtVU1aOXludy9UckdYMGczdk8zMmh2TDBz?=
 =?utf-8?B?d1NPQjgwczQ4MHNPYmtFVS9BVXgxZ3FOMklEV0Nzb2daNnlFZ0RzdjVRQlNW?=
 =?utf-8?B?WVFLM0RuVFBSTUFHN3dwV0drZzNvTDJNckZBL0FjVFc1aVU5K1MzcnVEcmZR?=
 =?utf-8?B?WDFGNHJQQUowRWxwUGY3RHFlbDZ4VlNuUVViYjJTY1NUaTR2bk9QU0YxUnor?=
 =?utf-8?B?Vkc2RFdIbW9DdmkyamN1bkJJci92VUJaUzFCVTF6WExvTkFNRTZiTW5tU3JR?=
 =?utf-8?B?UmdzbU9FaVY4S1NNbGdzbUhqUkFQS29xaG1OOXRXR09mV284RU1jZXBUNGMw?=
 =?utf-8?B?a21nbUZwNkJ4dGtVT1E1bUpBaTladktReXZGd0g1eGRjNmhHbW1FdGFzaE11?=
 =?utf-8?B?VWxiL3VoZmt0WFZnM1drbk1hUStlV2hzUldKTEV3UUl6VjcvQk1tbjNIV2w1?=
 =?utf-8?B?NmU0NEJ6Zm1Ec3Z2WFBLbHdiVDR3bEp3aGdUTTE2Qi9GeWtWMzN6R1BBTTMv?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B221A4CC28247F43A9F164ABB1555DB7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9188714b-31a3-4a4e-00b2-08dda2fbb586
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 00:06:52.2000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alOmCAJ53j3iGMDg1v+D4sZrZB0kMOg7QsFzbbDg3fcUNZ/n8vMuOkv3F2BzTrlE61FmAlOrYbwFDch4h2PitgvTsNtJk1+Zv5fu/qMYEV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDEzOjMxIC0wNzAwLCBCZWxnYXVta2FyLCBWaW5heSB3cm90
ZToNCj4gDQo+IE9uIDYvMy8yMDI1IDEyOjMxIFBNLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6DQo+
ID4gT24gVHVlLCAyMDI1LTA2LTAzIGF0IDExOjQxIC0wNzAwLCBCZWxnYXVta2FyLCBWaW5heSB3
cm90ZToNCj4gPiA+IE9uIDYvMy8yMDI1IDEwOjM2IEFNLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+ID4gPiA+IE9uIE1vbiwgMjAyNS0wNi0wMiBhdCAxNjo0NCAtMDcwMCwgVmluYXkgQmVsZ2F1
bWthciB3cm90ZToNCj4gPiA+ID4gPiBTZXQgR1QgbWluIGZyZXF1ZW5jeSB0byAxMjAwTWh6IG9u
Y2UgZHJpdmVyIGxvYWQgaXMNCj4gPiA+ID4gPiBjb21wbGV0ZS4NCj4gPiA+ID4gPiANCj4gPiA+
ID4gPiB2MjogUmV2aWV3IGNvbW1lbnRzIChSb2RyaWdvKQ0KPiA+ID4gPiA+IHYzOiBBcHBseSBX
YSBlYXJsaWVyIHNvIHVzZXJfcmVxX21pbiBpcyBub3QgY2xvYmJlcmVkLg0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+
ID4gPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogVmluYXkgQmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1bWthckBpbnRl
bC5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gwqDCoMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19wYy5jwqDCoMKgwqAgfCA1ICsrKysrDQo+ID4gPiA+ID4gwqDCoMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcyB8IDEgKw0KPiA+ID4gPiA+IMKgwqDCoDIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+ID4gPiA+ID4gaW5kZXggMThjNjIzOTkyMDM1Li5jYjA1
NjM0OTRmY2MgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19wYy5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+
ID4gPiA+ID4gQEAgLTUxLDYgKzUxLDcgQEANCj4gPiA+ID4gPiDCoMKgIA0KPiA+ID4gPiA+IMKg
wqDCoCNkZWZpbmUgTE5MX01FUlRfRlJFUV9DQVDCoMKgwqDCoMKgwqA4MDANCj4gPiA+ID4gPiDC
oMKgwqAjZGVmaW5lIEJNR19NRVJUX0ZSRVFfQ0FQwqDCoMKgwqDCoMKgMjEzMw0KPiA+ID4gPiA+
ICsjZGVmaW5lIEJNR19NSU5fRlJFUcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAxMjAwDQo+ID4gPiA+
ID4gwqDCoCANCj4gPiA+ID4gPiDCoMKgwqAjZGVmaW5lIFNMUENfUkVTRVRfVElNRU9VVF9NUyA1
IC8qIHJvdWdobHkgNW1zLCBidXQgbm8NCj4gPiA+ID4gPiBuZWVkIGZvcg0KPiA+ID4gPiA+IHBy
ZWNpc2lvbiAqLw0KPiA+ID4gPiA+IMKgwqDCoCNkZWZpbmUgU0xQQ19SRVNFVF9FWFRFTkRFRF9U
SU1FT1VUX01TIDEwMDAgLyogVG8gYmUgdXNlZA0KPiA+ID4gPiA+IG9ubHkNCj4gPiA+ID4gPiBh
dA0KPiA+ID4gPiA+IHBjX3N0YXJ0ICovDQo+ID4gPiA+ID4gQEAgLTg0Myw2ICs4NDQsOSBAQCBz
dGF0aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QNCj4gPiA+ID4gPiB4ZV9ndWNf
cGMNCj4gPiA+ID4gPiAqcGMpDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocGNf
Z2V0X21pbl9mcmVxKHBjKSA+IHBjLT5ycDBfZnJlcSkNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBwY19zZXRfbWluX2ZyZXEocGMsIHBjLT5ycDBf
ZnJlcSk7DQo+ID4gPiA+ID4gwqDCoCANCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoWEVf
V0EocGNfdG9fZ3QocGMpLCAxNDAyMjA4NTg5MCkpDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldCA9IHBjX3NldF9taW5fZnJlcShwYywgbWF4KEJNR19NSU5fRlJF
USwNCj4gPiA+ID4gPiBwY19nZXRfbWluX2ZyZXEocGMpKSk7DQo+ID4gPiA+IERvIHdlIHdhbnQg
dGhpcyBhYm92ZSB0aGUgZ2V0X21pbl9mcmVxKCkgY2FsbCBhYm92ZT8gU2VlbXMgbGlrZQ0KPiA+
ID4gPiB0aGF0DQo+ID4gPiA+IHdvdWxkIGZ1cnRoZXIgbGltaXQgd2hpY2ggaXMgd2hhdCB3ZSdk
IHdhbnQgaW4gdGhhdCBjYXNlIHJpZ2h0Pw0KPiA+ID4gTm8sIHRoaXMgaXMgZHVyaW5nIFNMUEMg
aW5pdCwgd2UgZG9uJ3QgbmVlZCB0byByZWFkIHRoZSBtaW4gZnJlcQ0KPiA+ID4gYXQNCj4gPiA+
IHRoaXMNCj4gPiA+IHBvaW50LiBXZSB3aWxsIGFkanVzdCBpdCBsYXRlciBpbiB0aGUgZmxvdyBp
ZiB0aGVyZSB3YXMgYSB1c2VyDQo+ID4gPiByZXF1ZXN0Lg0KPiANCj4gVGhpcyBlbnN1cmVzIG1p
biBmcmVxdWVuY3kgaXMgc2V0IHRvIDEyMDAuIFRoYXQgaXMgcmVxdWlyZWQgYnkgdGhlDQo+IFdB
LiANCj4gSWYgdGhlcmUgd2FzIG5vIHByZXZpb3VzIHVzZXIgcmVxdWVzdCAobGlrZSBiZWZvcmUg
YSBHVCByZXNldCksIHRoZQ0KPiBtaW4gDQo+IHdpbGwgYmUgc2V0IHRvIDEyMDAgaW5zdGVhZCBv
ZiB0aGUgdXN1YWwgUlBlICh3aGljaCBpcyBhcm91bmQgNTAwKS4NCg0KT2sgbWFrZXMgc2Vuc2Ug
dG8gbWUuIEkgZGlkIGNvbmZpcm0gdGhlIHdvcmthcm91bmQgZnJlcXVlbmN5IGNhbGxlZCBvdXQN
CmluIGJzcGVjIG1hdGNoZXMgaGVyZToNClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1
YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBWaW5heS4NCj4g
DQo+ID4gU28gdGhlbiB3aGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoZSBjb2RlIGp1c3QgYWJvdmUg
dGhpcz8NCj4gPiANCj4gPiAtU3R1YXJ0DQo+ID4gDQo+ID4gPiBUaGFua3MsDQo+ID4gPiANCj4g
PiA+IFZpbmF5Lg0KPiA+ID4gDQo+ID4gPiA+IFRoYW5rcywNCj4gPiA+ID4gU3R1YXJ0DQo+ID4g
PiA+IA0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiDCoMKgwqBvdXQ6DQo+ID4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+ID4gPiA+IMKgwqDCoH0NCj4gPiA+ID4gPiBA
QCAtODc5LDYgKzg4Myw3IEBAIHN0YXRpYyBpbnQgcGNfc2V0X21lcnRfZnJlcV9jYXAoc3RydWN0
DQo+ID4gPiA+ID4geGVfZ3VjX3BjDQo+ID4gPiA+ID4gKnBjKQ0KPiA+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19wY19nZXRfbWluX2ZyZXEo
cGMsICZwYy0NCj4gPiA+ID4gPiA+IHN0YXNoZWRfbWluX2ZyZXEpOw0KPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghcmV0KQ0KPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9n
dWNfcGNfZ2V0X21heF9mcmVxKHBjLA0KPiA+ID4gPiA+ICZwYy0NCj4gPiA+ID4gPiA+IHN0YXNo
ZWRfbWF4X2ZyZXEpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQ0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+ID4gPiA+IMKg
wqAgDQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2Iu
cnVsZXMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4g
PiA+ID4gPiBpbmRleCA5ZWZjNWFjY2Q0M2QuLjc1ZmJkYWI2OGQ0NCAxMDA2NDQNCj4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzDQo+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiA+ID4gPiA+IEBAIC01OSwz
ICs1OSw0IEBAIG5vX21lZGlhX2wzwqDCoMKgTUVESUFfVkVSU0lPTigzMDAwKQ0KPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE1FRElBX1ZFUlNJT05fUkFOR0Uo
MTMwMSwgMzAwMCkNCj4gPiA+ID4gPiDCoMKgwqAxNjAyNjUwODcwOMKgwqDCoMKgR1JBUEhJQ1Nf
VkVSU0lPTl9SQU5HRSgxMjAwLCAzMDAxKQ0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoE1FRElBX1ZFUlNJT05fUkFOR0UoMTMwMCwgMzAwMCkNCj4gPiA+ID4g
PiArMTQwMjIwODU4OTDCoMKgwqDCoEdSQVBISUNTX1ZFUlNJT04oMjAwMSkNCg0K
