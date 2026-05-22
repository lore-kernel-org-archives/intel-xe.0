Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298B4CD4F5B
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 05:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C1010E05F;
	Fri, 22 May 2026 05:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGQik6KO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFC610E05F
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 05:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779428304; x=1810964304;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8YBX2HqwNDDWi3HiSqVwMM2VeeTxV7Wc7hn5BW+4y7s=;
 b=eGQik6KOcm8V5WG2x0ufJcA/IHMKzAyhuNuKzxAQVntUEHdPO5/vAgYf
 u+XSS+ZMMgt0R6uG2OoML/7v8jrQ/peWveFm0gm2s4XDk2xWXuN7w0Coh
 8pdl3261DvlCYxpwW4sUtILNJxCpA7uC5GUq1FwZ1WlXCOHVNFOv5OlOp
 8HwFFQ6gSlZz6UgOH2g4l29Rzi+v2EA5SDaYg+SK4Bx1TyNuwx9uudQdW
 X6ElI0IP3b/x0ZkMuXP9oQ3xCJ9usnS7jewLsJE3pFYqZUWiGi3/DFtdP
 CYZ4l75d9BRsIj2QadEl49DX4xJODsrGny+UHfdwF/QVd9xZMN8IskFD3 g==;
X-CSE-ConnectionGUID: wilFSMFGSK64XRB/DkLDiA==
X-CSE-MsgGUID: U8/Fk3CPT8SQu/SdyyzwHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80475114"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="80475114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 22:38:23 -0700
X-CSE-ConnectionGUID: yMfHDRZURuWxSZw+BWbJLg==
X-CSE-MsgGUID: KHN6KfMdQ+q1N0x2HxSe4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="271164745"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 22:38:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 22:38:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 22:38:22 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 22:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hrm+/uhVLfPxkfEn10gwjVx3zIdj5l8imzHAg9bzrrFYEloIYwVpXjpHxXBKuMof1FSb9jYOzF10Rs4RX4y3E5iL/F6EJzm7EETs7GbrGVysPP7QXCDAiKIjVnzeftjd4nImPgovzL1izkt3U99hEr/x66M43kEx4xovNc1dA3X1OaBjLQrpcte8K29kE4++vgxusj8r0Jo4DHLbZhfQkUqgshEchR12ht4P7Mzi2P8W9AANcZ1ID86M4+wY60Wt18ylixFkd7nhricHMRUq/ouIgKEzCeslwB8dLudR3wtcTGRMYknyut6hOUf1d/pxSodeXr9zJFbGTA960JOtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YBX2HqwNDDWi3HiSqVwMM2VeeTxV7Wc7hn5BW+4y7s=;
 b=QKChp2ogBd3KfuXbWlX/Dw4T4TXAwmWe8N8lVl0FyFrTJl9+J+jqCI/A9P1p3XXn6txv7q2uXo7nRODVXX9QXXY1MDiq0wvKySou/BorD5a1PK8+M2sYcVwdN/iJiYUzByoCW4P0/xalAZPvRA6oRXf4m9FT1kCWhfH+fxZ7fB+zqc3H9hNSxw5YwcdnDSGGJhvevBW6qS5vEdO7oJ77jSIe7OLAX8anZAoH/tbs/tS9zmz+xdkhOnoVqhl6nroWa5vpQp1KfLxrsJ7mAJnXSGK0jTD7rYWNCpCCwU/cW7382+YTjdHWc7XKRH7itcGbIVPI+E2kG8/M2SOYkWHufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 05:38:18 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0048.013; Fri, 22 May 2026
 05:38:18 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH] drm/xe/nvls: Update PCI IDs
Thread-Topic: [PATCH] drm/xe/nvls: Update PCI IDs
Thread-Index: AQHc6UyJKfI+97FN+kGg58uEPurSC7YZh5Zg
Date: Fri, 22 May 2026 05:38:18 +0000
Message-ID: <IA1PR11MB62668CABB8F8F92C53A19467E20F2@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260521-nvl-s-update-pci-ids-v1-1-ec59e5d6bf12@intel.com>
In-Reply-To: <20260521-nvl-s-update-pci-ids-v1-1-ec59e5d6bf12@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|IA1PR11MB6099:EE_
x-ms-office365-filtering-correlation-id: a5ba2d32-159d-4137-5cb4-08deb7c453ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021|11063799006;
x-microsoft-antispam-message-info: zoW5Hr+OFP1fQop4rbxOPzlGpdqVovIuj1DbNY5Xa1/0jMlzEhz5WZ5DtDCsTyxiZ64Cl7bNCUGjRxSMTyAZYgwH8L+vhny294YNlXQ655yVwjsfIArYsszZZQkYrxgIkEc86iRJXErkBzMTKvUkfB5iapZt0z1Css97PQGoX8gYqfoTv3Ax+WKNntcpHcQGxbGPpa4OH1wJIUmdN4hTvdajIXEW1NEVEpIktPxqCKvfRRtZ0mJSoTXTzulgGQvqaHjRfCPEuwGvIbJjhufh0n40/SqliGl4827pxRZxNpjBgcznqkPZvsKSMiTuHqTvBbyGC43usU/WjdK6IPFQz23Myql48LN7fYKsLpl/GxOQOJY0MZF3j5nBDxk01LmJGGNQYfmdDfBHgeGRj4CuUwjmlHVA6Iv/rhXz6GQ8spHII6ufHxYRGC9WP0B7pQQPIohXVLqyIocx/+9Ah0fy6IbIm40rWjJZ9kOMMrnIVsqdXDdtsccJpR5iFaWAdXT/DGgD7PzcHDMrx+nAcJypwwDvuQ43Wv3BIw6iMSx1PDlLMitm8HZyIL7uBudLlY8xDBv3gvbenVAV6iv58NJ97RMQ2OxHFlI6bqalqcin9BCNPVzoprgTENze/5j/Kd0Ozkp2cxvghAdsveZG5cd8wZyKAt6nlb270dD260AAt+g/SgbCnyOu2lRCssuMx5nIGiD1aU+kt4t1dUk2naUVU4iYPtxHfzwo4RziYgLdLQxg6sV7Y3ROTX2sRQ4UycGZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGRpV1g0R2lhQVNCNzltM2JaS01rall5UDgxa0pGTkhkaWN5SFY2UDdpazkz?=
 =?utf-8?B?UDc5WGdONmpqaEVJWGtEUFZOZ0lyYnUyekNiVFhqYzR5R1E1ZHJaS1pLbGw1?=
 =?utf-8?B?RHdrYUFwejRwTGszbzRVQnhWL1Awa2RmLytCc3VvamlMYy96ZC9JWjl1ZVZ2?=
 =?utf-8?B?SW12Uk80YmprcDdKZVp5b01RcCt0azIxeDFBc3ExcHBjYVpFYWk1alNJdEpW?=
 =?utf-8?B?K29OMFRFQmUraTNvdDR2My9kM2IzOE82bytGRVB4MGhjSWJmZ2lkRVB6VzBk?=
 =?utf-8?B?dXdQcWtOelZtSVVGbitEcEl5dUR2NU9aZVB5SG9Bc3RtcjJXaVkyOUJjbXRz?=
 =?utf-8?B?cEVucU9EQlFrSHdXSkFNN05Sb1d0TWs1YytkMmRjOUVKc3lQemNjWlA3U3ZY?=
 =?utf-8?B?NWFwY3hsOXc3QTJweGo2S3AvU1I2Q3RYTTAxV2tpcTZnYUlMcU96TTBJZVAz?=
 =?utf-8?B?Yk0vVnJYTDdOZTRWdnZJYjc0S0Z3NFRtM05vREIvWFlOd3RyWFdYNUZIb25v?=
 =?utf-8?B?NHNpUURlMENKdmUzL0pKNU93Vk5hU2U4Um9lOEJLNEJqUVFuUFBQejlIZm9S?=
 =?utf-8?B?SG5Kb1d5MFlMdjl3WkFOL2VkN01GVGtlTHBZOVFvd2J3cTJXYW84Q25jcERB?=
 =?utf-8?B?NEJ2U3p0NkpMa0g5T1Z2Q3JxNHNtVGtvSnJJclM1M1diL0lnWVRRdFV4SHZp?=
 =?utf-8?B?bGRqSHJ3S0lOZ1dzWmpNeXVjTUo3dXdGYnRoNlEvd3VCd1AyeFpMYjQ5dVNV?=
 =?utf-8?B?TmdRdmcwcDVlUzVyTzNnNGttcXlaQXh4Nml1Y0ptRXhsYi9oaUp3ZW56bysr?=
 =?utf-8?B?WWlGZXRqUUNyd2p3ZlM2N01QS2hkUkxQR2Uvd2M1SlNrMDJ3ejZ1ZHZ5TDBl?=
 =?utf-8?B?VWlwMTBKVWdTUkJxYVBuanRqdHN1OCs0bis4T3o5WmQvOVkvWHQ5ZTdaaks1?=
 =?utf-8?B?L2JTdVZmaUhEbEh6aDlMUHJGQTdKYmNzalMzSTgrL1NHdVFDWlRaZllOa09U?=
 =?utf-8?B?QWYvTXcxd0lLVzdqMzNqeW1wemhkbWdGeUdzWTBndGN5VmVIUDVQTGZ2RG9a?=
 =?utf-8?B?anlFLzZBNzFhWXZDSVdXWk42aWZLUkJwQmd6U0F5RkF5U2dDMjAvZmJrb09u?=
 =?utf-8?B?bXpSWTNycVBQS3ZnVEcycTE4MHoxRUs5MHRMYnkzazQrRTdsVjh4YjR0WHBP?=
 =?utf-8?B?cStkQlFKR3N1Qy8zNEp4SDVpUTBMSEdsSjlEcE1tM1JiMUZGK3lDaHRjMjZu?=
 =?utf-8?B?OTNNelpIZnpnemorMVhRUmR2YUZRUTQ0S3pZVmY0MUl2VGRUdStYUUIxWDhq?=
 =?utf-8?B?cEN2T0Fpcmp5eFBkZ1hJcWlFLytUM20wNzBtbW9uVFp6M0FUbGM3U3R4a2JL?=
 =?utf-8?B?R2VuSTgwcmlFMkU5cWVTWmQ4NjRwaEhLdmZhYm9JeEdaMnFzc1RFV2dETDV3?=
 =?utf-8?B?emtmUlF5UVVjZEhSWmJGZzJmL28yYStlc051R2lHUXp3MkNGQ0VWZnVPckdv?=
 =?utf-8?B?R0wrc2ZBZDY4R21GdWllK3dhd2lNVm1kZm1mTVlNR09NNy9LL0p1OVQ1NEFn?=
 =?utf-8?B?TklyVVF3QldZUzVBOU9YK1ZMeElZbVdkdGVyMFJOQjVjSG5vTlBZNyswZDB0?=
 =?utf-8?B?aUtjYW04SlhzZ0thTmx0dzZZeEhQRHllOEFncFR6bFRoKzRyUnVHT042dVBT?=
 =?utf-8?B?anN5aWVBYmxHVktMbkNLOGNCRlMwM2RnUmdhZW1jeEZHeWhUQm1Ja2FOa3dm?=
 =?utf-8?B?eFJ1RzRndmpCVWYzZFF4a2pEUWpSKzI2bG9yUkNlQXJCS0FRUEU4T1ZpVXh5?=
 =?utf-8?B?aURNaythSFRtdi9WV2xLY0hnb2haLzc5aUdWMDlzQUxrNlFtcmhVWlgxSGE2?=
 =?utf-8?B?c2VFdEtSR2J5Sm1uVTZ2TjlmMEVLNlpMSURMMkxJTmQxL1pxME0wQk9xUlRC?=
 =?utf-8?B?YlUvM2xkL0w3SWNOUnhTNDROWWRlSjgyN0hFLzRnb3o2WmVYRVlxWUxMWHZT?=
 =?utf-8?B?UzZiQjY1RXMzYVFDRjRNdytIS2pCOEdaMnZocFVISHpJaXlnbTRjcy83WjYz?=
 =?utf-8?B?NTQ0MGZ4V0pDMnVlaW9vUHdTZjhMU0NoczNIQjFNY1FPdkk5Tm5WaEpLNmNR?=
 =?utf-8?B?WC93TFBLNlE0dnNGK1ltdm9rQVVVYytnWFp0a3NGTFl2bmE1SU9XanRyanIv?=
 =?utf-8?B?SkRDT0UxTlU3K0ppK2dyYk5rRnFmNmJ5U1hWLzA1MHpYWDBONy9mc2diWjRx?=
 =?utf-8?B?cUwydEtqbEtmdzZPTEd3YVViNGYxdWxkQmpJOUVmVXVEd0c3eEhuK3czNHh1?=
 =?utf-8?B?L25FQ0gzUVBhR3hKMTBrSU1ITlErK2pHSEhBTUNxMTRUV0dtRVBpK0FpeXla?=
 =?utf-8?Q?ea7uUBF7aRs8KBPw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GIeOtzqyE2ZzolkEyOaN/t3LeG8s5Xq7gRuHJzrzZK2XT40iruCvoghWOkX25mWzCtAzQrV9dIbIjmKJOIqeZSOEld9+0oUZeN4hhSqBs7PTclwKDhV1QAXOx330yOLrAen0pljb+hvVLECqforxZlPE6E9eHts/DrkJT8UB8/l+sNrMtRlGulxhvbXYXnkvk025j/aklwuR41gIb8BL18ps+yZFx1nZJgCOGLAY2+R/uz65rmRGiEzvg9mzf9OIIRTRqFBLTRz0c9lPDbQjtFqcuy3nM1WPLQOk9cDoMsv9JLkJbAt4Kiu15UnVA0x8Gk1ktFdeQFICnRkLJDQi2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ba2d32-159d-4137-5cb4-08deb7c453ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 05:38:18.3312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ulzOuoqy2pIwrE/aEcnkT1ZCmeXtz4KMZF6z4XNr6YpIyolYgusXJBjruk9sFQrBl2O/4jlOZn4x3POIgImtaH7Knf3HQo6JcC5D1h8iDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR3VzdGF2bw0K
PiBTb3VzYQ0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDIxLCAyMDI2IDExOjM0IFBNDQo+IFRvOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFNvdXNhLCBHdXN0YXZvIDxndXN0
YXZvLnNvdXNhQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0veGUvbnZsczogVXBk
YXRlIFBDSSBJRHMNCj4gDQo+IEJzcGVjIGhhcyBiZWVuIHVwZGF0ZWQgd2l0aCByZXNwZWN0IHRv
IE5WTC1TIFBDSSBJRHMuIFVwZGF0ZQ0KPiBJTlRFTF9OVkxTX0lEUygpIGFjY29yZGluZ2x5Lg0K
PiANCj4gQnNwZWM6IDc0MjAxDQo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gU291c2EgPGd1c3Rh
dm8uc291c2FAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvZHJtL2ludGVsL3BjaWlkcy5o
IHwgNSArKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaCBiL2lu
Y2x1ZGUvZHJtL2ludGVsL3BjaWlkcy5oIGluZGV4DQo+IGUzMmVmNzYzNDI3Yy4uZGZmMzg5YjU2
ZWIzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaA0KPiArKysgYi9p
bmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaA0KPiBAQCAtODkzLDggKzg5Myw5IEBADQo+ICAJTUFD
Uk9fXygweEQ3NDEsICMjIF9fVkFfQVJHU19fKSwgXA0KPiAgCU1BQ1JPX18oMHhENzQyLCAjIyBf
X1ZBX0FSR1NfXyksIFwNCj4gIAlNQUNST19fKDB4RDc0MywgIyMgX19WQV9BUkdTX18pLCBcDQo+
IC0JTUFDUk9fXygweEQ3NDQsICMjIF9fVkFfQVJHU19fKSwgXA0KPiAtCU1BQ1JPX18oMHhENzQ1
LCAjIyBfX1ZBX0FSR1NfXykNCj4gKwlNQUNST19fKDB4RDc0NSwgIyMgX19WQV9BUkdTX18pLCBc
DQo+ICsJTUFDUk9fXygweEQ3NEEsICMjIF9fVkFfQVJHU19fKSwgXA0KPiArCU1BQ1JPX18oMHhE
NzRCLCAjIyBfX1ZBX0FSR1NfXykNCj4gDQpMR1RNLA0KUmV2aWV3ZWQtYnk6IERueWFuZXNod2Fy
IEJoYWRhbmUgPGRueWFuZXNod2FyLmJoYWRhbmVAaW50ZWwuY29tPg0KRG55YW5lc2h3YXIsIA0K
DQo+ICAvKiBDUkkgKi8NCj4gICNkZWZpbmUgSU5URUxfQ1JJX0lEUyhNQUNST19fLCAuLi4pIFwN
Cj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogOTc3YjhjMjEzZGI3MDFhOWVjMDk4N2JlODJmMDBm
N2Q1YmMwYTMzMA0KPiBjaGFuZ2UtaWQ6IDIwMjYwNTIxLW52bC1zLXVwZGF0ZS1wY2ktaWRzLWIx
OTc1ZmQ3YWVkOA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBHdXN0YXZvIFNvdXNhIDxn
dXN0YXZvLnNvdXNhQGludGVsLmNvbT4NCg0K
