Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA9FEC10D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 20:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA05710E00A;
	Tue, 24 Mar 2026 20:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwFSddoo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F54D10E00A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774384799; x=1805920799;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/jTJQXPUcYSnHNTYCqIbYtamOcG0E8A5aro5ojAz6tM=;
 b=VwFSddoopbTfSn/PAlvRH7HzOMxbmeXVNeAWotMnF36oEALQ9tSEQmKH
 /opTq5E0TnBzzCpyZBSFXAVB7WEq83oc1tqKsLORaSFltzhyWhy56HxCg
 plVOOnE+BqXSH0j608VpqzE+fjnFjv9MZdfYHn3p+qZ5rtxPSDOk+DvGP
 UCzf/wui3tJvgQ668QJPIAi4joaK1FsQsv/n5ys6js0xww7563/5/ZjLA
 NSqSmMb5FtJHwxYWW1iLfSLqdtQnI3PKyGD85xa4u5zJDCYl0C268LeJW
 TOVSWUMz7Cwl9LXbZdr7AeQq6lfr8WANCzomDAWFPh5oXH2Bxeb7iAQCH g==;
X-CSE-ConnectionGUID: wKH0fLIBR7qeWhR01BIbKQ==
X-CSE-MsgGUID: 42/U9i4KQI+i9nFvWL9WXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78015855"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="78015855"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 13:39:58 -0700
X-CSE-ConnectionGUID: qxFZlLueQT68Zc1Ev5uYxg==
X-CSE-MsgGUID: b0uy/K98R/mc39ij41tDeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219593246"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 13:39:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 13:39:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 13:39:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 13:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3scCeBOqPYm5Rp+98tceepzGyhwPhOOJP4Dbx4LjdRrreYpc2nzrFoLz5SUZzmEk1Td8Lw20JetTDy7NCg55m5xmzK7fjJrYki0MelS6x2KAaqesNT4iWhH5K6bNs3BxiiknWp28lpvQMO/SOmgsS233/wyq038j2JZOH/q42qDb1h96IW0iiFL5hBNCzgzWzdFazN5ASrO/NVb1/fjYBhPc0Gs4KaLtiXZnYdkVfqGQpbqdZRxTYY0C9uH4WV3J2myW0MnlRKKbPrp8kh/9x80GmWpDs7h2tihdoc+26AD7tu38SfzItzrSK/Q1ltp5NWhCWxdUFw5PuZJVqn+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jTJQXPUcYSnHNTYCqIbYtamOcG0E8A5aro5ojAz6tM=;
 b=cguCTZTMNEIanKb2ikieEowVtqfmkskSjJpIKeoUd6v2SM7wV5mMcHnr0nE3GWHLdm0uInqw0LjH8OD1xswuROD/R1KagBUDitbPLOxVtj7nWoXVHRb+QmcTJRgv3MvQH1bqxBrh++ETWoWPd8qI4ZMxi25p20wdPK30YZYCjl5fTJt/PbIT3SrV9L1q62PEloCWccfmgkMmmZfnuwSD2V/l/PobrlE9nywRgUro1xMDPzPLUT6lSH6NBVzpsuZ5K0fBICn3FusjsJZoXz5lh58lf6ZsXsKrBKryExKuxBZMH9vMKFRVk/95RmfjH/fm6YQ9PvOIbsavlhVRkIZjXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 24 Mar
 2026 20:39:55 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::796c:2779:697e:54e7]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::796c:2779:697e:54e7%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 20:39:54 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Wait for HW clearance before issuing the next TLB
 inval.
Thread-Topic: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Thread-Index: AQHctmSE8hT45kL6OE6nXMzc9Cc59bWzXqoAgAav8oCABCEZAA==
Date: Tue, 24 Mar 2026 20:39:54 +0000
Message-ID: <BL3PR11MB636276501728DE765677A4B49A48A@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20260317232133.4106716-1-fei.yang@intel.com>
 <6a481f4d814c4247dcb62929b72e153ab7905cc7.camel@intel.com>
 <ab9/o3gr002U28RM@lstrano-desk.jf.intel.com>
In-Reply-To: <ab9/o3gr002U28RM@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|SA1PR11MB6991:EE_
x-ms-office365-filtering-correlation-id: e5e4427b-170b-4114-8c22-08de89e581a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: weeScnt7nCkuSwaT9b0AmOsYIsIrCZ1+6tonCSI2AUDNhZHv7W9E9jN4qiVUZwkhXEzML9xzSjkd9Po8n2KcmlS0GrSuFy2evioHQgzuxGPVi4tG2yxUKtVGPnhfLG5Bb1vKPR2Y5xb2mVHyC7boQNh9GIZ3Y1x+7OyTnwFkYniB0hSHbW+0XPBOLhDKq1e04b7ZoCn2M1ojzOjy+P1cBSPwNWjOnnGResTXG300kx1rEt6fVInvBCqnMNOEdCftqQIVB7wB/pg3VNrkrfYn7eFjPTak0hD2/AFsiRDSyBr+zwYgK69T6jwwcQRZ1/vceiCErmHhgxcN3rLHNR3MPmZyD3lxMlS9xvFOyyhxkCHQWOPamFWQnhulAkTLbAlcnIQO1+F0J7g3p5CafGy3pWbpPjRRl7e8/B68CrtU4IttZomZaaMwskP1XnSuMd2AZEgU1zuV8/V7Q5EnINu2uzH3xPHs7z9BacC78ouikGmrLOvrV8RiJRBz1x/emJxq+5PBNJOs0LvrGt+80t0t0ascUUA4mtMktrR2alBnXwBb1zlELQ0EZoVhUBwXLoOf9alW6kinX+W387mDraIMnEov5xKDkqtQl+Eq/zBOpwo9hFwBkfDqaUiX/HCpKO6xg/26equEcz9g3DI8btdp1gchzmbFydmyVbPhbtCAsasnIUfQcV3E524JHLclSYWvphavioIjgLIa6sE0PDi8T+wghhMQMkHMh8wYbQQ0SCHXDLQvH1AOXpS22vptENzuKJLo6SsQVk/4TM6Rl1pb9XClzkTjCC5/1sWA/47Zfjs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkZJR201SXhHUEFhRWpKdzBuTEZFT2YzRjlraCtXbHBTTjFjOSsrRjEvdW5S?=
 =?utf-8?B?SUh2dm5PajdUek80aDEzcE1PTjRoTjNPRjFkSTcvbk4veFgxVXR4N1N0Q3oy?=
 =?utf-8?B?V1FMVC9EaFhVZ2tTTGoxN2dRalNTSUdyZDliWFNxNytSWEZDd24vNUhoUm9I?=
 =?utf-8?B?TEZFTWt3OVdiT1dzcU9QWGR0cTRCU09IZTgxVW9Ya1MvckVHSTdvK0IwblEy?=
 =?utf-8?B?TERpdWxzbUt3bVFjMlp2OWFicVRWYnU4OUNDQ2lrTk1XSy9BdkJTNVc3dXUw?=
 =?utf-8?B?Kzdhd1ZXVFF3TmN3TzRwRHFoSm5Jc1FFckJNV0NTcTdCN2t6QVZMWTNSMWpN?=
 =?utf-8?B?RnBhMysybG5jdU9GeDY3NkhqMVJmL20yNjl2VzZSdnB2bGNGcnI2WkJyM1Zq?=
 =?utf-8?B?S2wwK2hhb3RZa1ZLc09zK1NiVFhSaXU3clVrTzdUSG5pZ2tRcGN3aUw4bHVP?=
 =?utf-8?B?dml1aVZ4QllaSk1IWnRRK3ROUDNCbksrSDRmUk5SZ2ZDYmZXdFY0M0txcDUz?=
 =?utf-8?B?Mk0yRWNwaXl1TFJjUmZIV2RDVGpJcVlVVUtRcXJGbXhvcEYwS0tqSFVQaFRz?=
 =?utf-8?B?NkQzOHIzYmFodFNlK3VRdU5sWVNuMlhJTndEeFVSdGYyUEs4ZklGVkJNdEZQ?=
 =?utf-8?B?VkpSN3Rld05LTFF6SmZMeXJlR1owMkY2a1ZkMTQ3TTFka1FIcENiVXRhTWlR?=
 =?utf-8?B?TXJtYUc1NitXdzgrMWUrMGFCTWt5WFZ3YXZvOTBKL3hpYldmRDNnQW16ZXRV?=
 =?utf-8?B?M002bm9LaUNmelFHOEczcFNyMGc1UHJLc09lTHd3TTM5MnpFa3g0YXFWS2hV?=
 =?utf-8?B?SVRXVXgvNUo4Y3BiRGVUbzc5blVzZnRyc1NGU09nTkFrQm9KZTNpWU9sL1p5?=
 =?utf-8?B?Mmhua3I4UjZCa3JFYnQxOFdsUUhuVzZydnNUakFzZTlzemRVb2ZYelIvdnlF?=
 =?utf-8?B?STJPKzFqeHdoWXN5WkYrbUpwemEvQzBGV3FFWUFycTk0Q3BIM2Z6UzFzMFZk?=
 =?utf-8?B?Q0JsQkZvYitSRzFWd1pqb1dKdXFsUGM0WlhXZkhza2dvS0loOGZCQ3RaVHhi?=
 =?utf-8?B?VVZ4RDdMSzh5UUxzTngrZGI0Tk40WmVpbjdmWmliZ1Uza2txMEZKMWVTQ2I3?=
 =?utf-8?B?NzVPZnE5MEtYcEV0YlpwRHBZS043blpNdU1YTVByUlhDcG1wMFhXTzNwWlg3?=
 =?utf-8?B?blpWWXpxWEJPM01zSFUxNDVhVWN5aXo0NkZUUHNIZ2M2YjMxT1V0MUhTVkFY?=
 =?utf-8?B?bUhPRW1yZXNsSzZpdks5WUxDV2ZyY1VGeVJGZFFiRDZyTEMyRndqV2wzdFFt?=
 =?utf-8?B?THJEazN5aHNNU280MDJRdVo2dVRUbmU1OEx1VTNiQldFZjhDYm95TkJaMWNa?=
 =?utf-8?B?MVArL2hKakQ0blg3dkNrMG44bGZ6cE9KL0YxUlZMdjNYdkpBelRId2YvcmtW?=
 =?utf-8?B?Tmd1TnFNdEthMHltSllsT3JnUms4S2R4anIzQnVCQ09LUERxS1dMTW9TMm4v?=
 =?utf-8?B?MTBCaXhjeDROMlNDZzlMZHJUTkx0bTltN1RjSHVtWVM2OHIvQnNrWlJ1cGg2?=
 =?utf-8?B?VWR6TUx0WjJLNXVCSm1Hanp6MVZIVmdyZWQ3d0p5OXFkbkRvMjU4K0FKTUJR?=
 =?utf-8?B?a1hpL013Snk2eXVNa0h5amYraEdsdG9vQnptc1ZtNnhlWnJ3M3RVTnR3VHBM?=
 =?utf-8?B?Qk4ybjM5cTVBejU0bjZLWUF0OUVKbDhlUXJZa0VOZW5CN3JiMXJRRE0zN0RP?=
 =?utf-8?B?c1dBTFUzK3JzVFpkRzMyekhKN21PK1BkV01Zc2szNysvbGhBZUpsRndHa3pK?=
 =?utf-8?B?bld6S1dISjhXRm1jRS9IQWU4R0dMMkswdVhsWHZXcnNZcllGZkVBSlpSTnZX?=
 =?utf-8?B?Sjk0Vjg0MlY5TFZKMUpJck8vRWVTTU93WXFicjRPWWRIeWM0TnZnMDhzOXJU?=
 =?utf-8?B?c0h2QTRHQmMvZzJGVG0vcUdzTHlUbnIvam00QWtLRnViQTBPbVR4SjdRYWo2?=
 =?utf-8?B?WFQxS3QxTDlLSmszamphYzhxMGNxeEordzNNNTZwdXJBL1JCZTR6S09TN29Q?=
 =?utf-8?B?Y1NEY2lsQXlkY0xrdlRjSjc0SG5TQXdXcTRKdzJyTG1aOVYreXRNZGltSDNa?=
 =?utf-8?B?UkdvU25FV29veTJFQWJRdnJMbjM1RnNSV2ltUThYZ0VIL1VNM0xZcWV3YUtT?=
 =?utf-8?B?bjVzNHVQWlE4aGlYRmgrajJmbEFaZkloekh3bDR1NU9iUnhWMHVjdVZFT2ZD?=
 =?utf-8?B?U2c3MktWZUlDeEtQT3p5MHF5K0wxQ1oySGpnTXRoaW92RFMyWkQrSkFsQTVv?=
 =?utf-8?Q?I+Bc7Xh4rgEXriyn9p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pJBLI68+1W2HOLXsEeVfpP5iaFleg+90ypg09xb/pqz2Q/pL4qANbAxsjmfDtqTuwXhydYvG/GGwwr/N63QetjzrIOdNIZfjSRDG4z+QPAzDDDLbi/TBRbs8sKD9BMI4t3mtJdFf1QpoedzXL5abQQKWcSMrH+qyiMYGNjKBbNnzZrW0NfZAblM+iSl6VZyxEzh6zLwEbaWZsGPd2gQggQZIOU+aPPYUG8QFQa0pIfdcydLm0QLuB1zLrCOK2Zqdw7haYfJyI4ll0gX5fGya9BD7VCsNiFHJUXajgYOKIayMuBaz946Awq4X7hh41fkNUsQA6r6qD17UnDWaP7iw7A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e4427b-170b-4114-8c22-08de89e581a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 20:39:54.8599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1ob2Nf9JEiAxU3eZvvSDrg5zzIGTC0V9PXsd9QQTDsUXlc3HmyjVz6wVaOr17AVt16tZvgjLRTRwGkclIwsng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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

PiBPbiBUdWUsIE1hciAxNywgMjAyNiBhdCAwNToyODoxNFBNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+PiBPbiBUdWUsIDIwMjYtMDMtMTcgYXQgMTY6MjEgLTA3MDAsIGZlaS55YW5n
QGludGVsLmNvbSB3cm90ZToNCj4+PiBGcm9tOiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29t
Pg0KPj4+DQo+Pj4gSGFyZHdhcmUgcmVxdWlyZXMgdGhlIHNvZnR3YXJlIHRvIHBvbGwgdGhlIHZh
bGlkIGJpdCBhbmQgbWFrZSBzdXJlDQo+Pj4gaXQncyBjbGVhcmVkIGJlZm9yZSBpc3N1aW5nIGEg
bmV3IFRMQiBpbnZhbGlkYXRpb24gcmVxdWVzdC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEZl
aSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+DQo+Pj4gLS0tDQo+Pj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfdGxiX2ludmFsLmMgfCAxNSArKysrKysrKysrKysrKysNCj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3RsYl9pbnZhbC5jDQo+Pj4gaW5kZXggY2VkNThmNDZmODQ2Li40YzJmODdkYjMxNjcg
MTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYw0K
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMNCj4+PiBAQCAt
NjMsNiArNjMsNyBAQCBzdGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX2dndHQoc3RydWN0IHhlX3Rs
Yl9pbnZhbA0KPj4+ICp0bGJfaW52YWwsIHUzMiBzZXFubykNCj4+PiAgICAgICAgIHN0cnVjdCB4
ZV9ndWMgKmd1YyA9IHRsYl9pbnZhbC0+cHJpdmF0ZTsNCj4+PiAgICAgICAgIHN0cnVjdCB4ZV9n
dCAqZ3QgPSBndWNfdG9fZ3QoZ3VjKTsNCj4+PiAgICAgICAgIHN0cnVjdCB4ZV9kZXZpY2UgKnhl
ID0gZ3VjX3RvX3hlKGd1Yyk7DQo+Pj4gKyAgICAgICBpbnQgcmV0Ow0KPj4+DQo+Pj4gICAgICAg
ICAvKg0KPj4+ICAgICAgICAgICogUmV0dXJuaW5nIC1FQ0FOQ0VMRUQgaW4gdGhpcyBmdW5jdGlv
biBpcyBzcXVhc2hlZCBhdCB0aGUNCj4+PiBjYWxsZXIgYW5kIEBAIC04NSwxMSArODYsMjUgQEAg
c3RhdGljIGludCBzZW5kX3RsYl9pbnZhbF9nZ3R0KHN0cnVjdA0KPj4+IHhlX3RsYl9pbnZhbCAq
dGxiX2ludmFsLCB1MzIgc2Vxbm8pDQo+Pj4NCj4+PiAgICAgICAgICAgICAgICAgQ0xBU1MoeGVf
Zm9yY2Vfd2FrZSwgZndfcmVmKShndF90b19mdyhndCksDQo+Pj4gWEVfRldfR1QpOw0KPj4+ICAg
ICAgICAgICAgICAgICBpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfUFZDIHx8IEdSQVBISUNT
X1ZFUih4ZSkNCj4+PiA+PSAyMCkgew0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIFdh
aXQgMS1zZWNvbmQgZm9yIHRoZSB2YWxpZCBiaXQgdG8gYmUNCj4+PiBjbGVhcmVkICovDQo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0geGVfbW1pb193YWl0MzIobW1pbywNCj4+PiBQ
VkNfR1VDX1RMQl9JTlZfREVTQzAsIFBWQ19HVUNfVExCX0lOVl9ERVNDMF9WQUxJRCwNCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCAxMDAwICoNCj4+
PiArVVNFQ19QRVJfTVNFQywNCj4+PiBOVUxMLCBmYWxzZSk7DQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKHJldCkgew0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJfaW5mbygiVExCIElOVkFMIGNhbmNlbGxlZCBkdWUgdG8NCj4+PiB1bmNsZWFyZWQgdmFsaWQg
Yml0XG4iKTsNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUNB
TkNFTEVEOw0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIH0NCj4+DQo+PiBJcyB0aGVyZSBh
IHJlYXNvbiB3ZSBhcmVuJ3Qgd2FpdGluZyBhZnRlciB0aGUgd3JpdGUgdG8gbWFrZSBzdXJlIHRo
ZQ0KPj4gaW52YWxpZGF0aW9uIGNvbXBsZXRlZD8gSXQgc2VlbXMgbGlrZSB3ZSBzaG91bGQgYmUg
c2VyaWFsaXppbmcgdGhlc2UNCj4+IGFuZCBhdCBsZWFzdCBtYWtpbmcgc3VyZSBoYXJkd2FyZSBj
b21wbGV0ZXMgdGhlIHJlcXVlc3QgcmF0aGVyIHRoYW4NCj4+IGp1c3Qgc2VuZGluZyBhbmQgaG9w
aW5nIGZvciB0aGUgYmVzdC4NCj4NCj4gWWVzLCB0aGlzIGlzIGNvcnJlY3TigJR3ZSBzaG91bGQg
YWZ0ZXIgd2FpdCBpc3N1ZSAqaWYqIHRoaXMgY29kZSBpcyBhY3R1YWxseSBuZWVkZWQuDQoNCk5v
LCB0aGUgaXNzdWUgaXMgdGhhdCBzb2Z0d2FyZSBjYW5ub3QgaXNzdWUgYW5vdGhlciBUTEIgaW52
YWxpZGF0aW9uIHJlcXVlc3Qgd2hpbGUgdGhlIG9uZ29pbmcNCm9uZSBoYXMgbm90IGJlZW4gY29t
cGxldGVkIHlldC4gT3RoZXJ3aXNlIHRoZSBoYXJkd2FyZSBjb3VsZCBwb3RlbnRpYWxseSBsb2Nr
dXAuDQpTbyB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGUgdmFsaWQgYml0IGlzIGNsZWFyZWQgYmVm
b3JlIGlzc3VpbmcgYW5vdGhlciBUTEIgaW52YWxpZGF0aW9uIHJlcXVlc3QuDQoNCj4gVGhpcyBp
cyBlYXJseSBYZSBjb2RlIGZyb20gbWUsIGFuZCBpdOKAmXMgcXVlc3Rpb25hYmxlIHdoZXRoZXIg
aXTigJlzIGV2ZW4gcmVxdWlyZWQuDQoNClRoaXMgc2VlbXMgdG8gYmUgcmVxdWlyZWQsIG90aGVy
d2lzZSBtb2Rwcm9iZSB3b3VsZCBmYWlsIGF0IGdvbGRlbiBjb250ZXh0IHN1Ym1pc3Npb24sDQpb
ICA0ODAuMjM3MzgyXSB4ZSAwMDAwOjAxOjAwLjA6IFtkcm1dICpFUlJPUiogVGlsZTA6IEdUMDog
aHdlIGNjczA6IG5vcCBlbWl0X25vcF9qb2IgZmFpbGVkICgtRVRJTUUpIGd1Y19pZD00DQoNCj4g
VHlwaWNhbGx5LCBpZiB0aGUgQ1RzIGFyZSBub3QgbGl2ZSwgdGhlIEd1QyBpc27igJl0IGRvaW5n
IGFueXRoaW5nIG1lYW5pbmdmdWwgaW4gdGVybXMgb2YNCj4gcmVmZXJlbmNpbmcgbWVtb3J5IHRo
YXQgdGhlIEtNRCBpcyBtb3ZpbmcgYXJvdW5kICh3aGljaCB3b3VsZCByZXF1aXJlIGFuIGludmFs
aWRhdGlvbikuDQo+IFNvIHRoaXMgZW50aXJlIGZsb3cgb2YgaXNzdWluZyBhIEdBTSBwb3J0IFRM
QiBpbnZhbGlkYXRpb24gaXMsIGFnYWluLCBxdWVzdGlvbmFibGUuDQo+DQo+IFNvIEknZCBzdWdn
ZXN0IG1vdmUgdGhlIHdhaXQgYWZ0ZXIgaXNzdWUsIHBsdXMgdGhyb3cgaW46DQo+DQo+IOKAnFhY
WDogV2h5IGRvIHdlIG5lZWQgdG8gaW52YWxpZGF0ZSBHR1RUIG1lbW9yeSB3aGVuIHRoZSBDVHMg
YXJlIG5vdCBsaXZlPyBUaGlzIHN1Z2dlc3RzDQo+IHRoZSBHdUMgaXMgc3RpbGwgaW4gdGhlIGxv
YWQgcGhhc2UuIEludmVzdGlnYXRlIGFuZCByZW1vdmUgdGhpcyBjb2RlIG9uY2UgY29uZmlybWVk
LicNCg0KVGhlIGlzc3VlIGlzIGEgY29uc2VxdWVuY2Ugb2YgYW4gZWFybGllciBmYWlsdXJlIHdo
aWNoIGNhdXNlZCB0aGUgQ1QgdG8gYmUgZGlzYWJsZWQuIEFuZCB0aGUgS01EDQpzZWVzIGEgYnVu
Y2ggb2YgVExCIGludmFsaWRhdGlvbiB0aW1lb3V0cy4NCkF0IHRoaXMgdGltZSBJIHdvdWxkIGV4
cGVjdCBhIEdUIHJlc2V0LCBidXQgdGhhdCBpcyBub3QgaG93IFhlIGJlaGF2ZXMgKHRoZSBvbGUg
aTkxNSBkcml2ZXIgdHJpZ2dlcnMNCmEgR1QgcmVzZXQgb24gVExCIGludmFsaWRhdGlvbiB0aW1l
b3V0IGlmIEkgcmVtZW1iZXIgY29ycmVjdGx5KQ0KDQotRmVpDQoNCj4gTWF0dA0KPg0KPj4NCj4+
IFRoYW5rcywNCj4+IFN0dWFydA0KPj4NCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICB4ZV9t
bWlvX3dyaXRlMzIobW1pbywgUFZDX0dVQ19UTEJfSU5WX0RFU0MxLA0KPj4+DQo+Pj4gUFZDX0dV
Q19UTEJfSU5WX0RFU0MxX0lOVkFMSUQgQVRFKTsNCj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICB4ZV9tbWlvX3dyaXRlMzIobW1pbywgUFZDX0dVQ19UTEJfSU5WX0RFU0MwLA0KPj4+DQo+Pj4g
UFZDX0dVQ19UTEJfSU5WX0RFU0MwX1ZBTElEKTsNCj4+PiAgICAgICAgICAgICAgICAgfSBlbHNl
IHsNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAvKiBXYWl0IDEtc2Vjb25kIGZvciB0aGUg
dmFsaWQgYml0IHRvIGJlDQo+Pj4gY2xlYXJlZCAqLw0KPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldCA9IHhlX21taW9fd2FpdDMyKG1taW8sIEdVQ19UTEJfSU5WX0NSLA0KPj4+IEdVQ19U
TEJfSU5WX0NSX0lOVkFMSURBVEUsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMCwgMTAwMCAqDQo+Pj4gK1VTRUNfUEVSX01TRUMsDQo+Pj4gTlVMTCwg
ZmFsc2UpOw0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByX2luZm8oIlRMQiBJTlZBTCBjYW5jZWxsZWQg
ZHVlIHRvDQo+Pj4gdW5jbGVhcmVkIHZhbGlkIGJpdFxuIik7DQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVDQU5DRUxFRDsNCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICB9DQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgeGVfbW1pb193cml0ZTMyKG1t
aW8sIEdVQ19UTEJfSU5WX0NSLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBHVUNfVExCX0lOVl9DUl9JTlZBTElEQVRFKTsNCj4+PiAgICAgICAgICAgICAgICAg
fQ0KPj4gDQo=
