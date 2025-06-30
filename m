Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB000C8302F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 22:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A51710E4D0;
	Mon, 30 Jun 2025 22:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAliLSYo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B458F10E260
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 22:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751321329; x=1782857329;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SaZw3BDVonjTMRUjoapfm47h5aDS1mC9JsEOPI+hOFI=;
 b=MAliLSYoL6QvSSNXOsfW+Z9vYdqLQp2R85NsdOCYbq39+UP7772mkU3k
 qwv1IqtSqxVwrB9y9I+J4Go8UmJW9OPCgOwmdCJMRwB4R997iFiXd+08M
 qjUL0DJ6ctCFEkq5WKwY/Xiv39FXRgqq5PVW+Kw7LdpdGpmZrX6QNgOMU
 wrGRGw5T3+msP9CyXAdm4uCkqeRI6ctrbcNzE56VUqgo/lz270g0w5bEJ
 VTr10hN4/zpPP+ad3ckXiR80qVIbEsRkmpMnO28FrWw/VOkq8xlfYL+PN
 n5OL/orTlSNcNk1oBV1kSm2TmWlKnpIjeqVa8oq2A2eovyaDFLe4WqOCZ A==;
X-CSE-ConnectionGUID: M4VZ+fUQQtKKzTFYdzYt/A==
X-CSE-MsgGUID: 1KivmqTTTUON8ceJdd0DvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53706699"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="53706699"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:08:48 -0700
X-CSE-ConnectionGUID: 6ITHD0FySfqoiDeKGkx5Vw==
X-CSE-MsgGUID: GMAuKExMQJaQCi0Icuuo9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="154108607"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:08:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:08:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 15:08:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZvgUCsYNgXw7APYWCdW9FY0RBtaRlmZZ9wFu1DE5rUWmvpu8A7QPxhCTbcwiPCXi1Ou5KPXAHytnac/y9BV9FpJUPwsAl9bzJNKJyonlrxsDl88F9Xhoq8bGcCAkG1NCCYzT5DMgjVHE2CxViJG7naj2YcELdiezSJAHzYRfyOAlV/LDKsbD8E8Ei5d0tx+8dJfIWozUO8YbvdrjfhZXXiTN95HfMcjEzdd7o2pq7+RPn15WfBjyNz0iKTi/pkYaEeqfdSd3GZVjb+rp7HD5yLQTiV4gwzhLBYPpNLfMPitDGzJejEEF4hH8Kv3RrrwvUO+h/WN1souIgz7nv+QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJtbHvaqolvBpkkv5I+qOWFZkJSAzGOgFdYUVJ5HmVg=;
 b=x5IYbIcU9+jSaV7gQnHWH8eob6+SgnOzCsGUMGXMBKLiLggdBAlDb3G6WpZFLH+5iCufZ3RL4m1T3cVxvdFwRaTPgJ+40NjmGhzN8WwM1s8eukfeiH7o7Olwhb3srpzi+u4kCcBMTGeb9i+mMOo61Ysr0AldbfwDuSAqXg2pu2izkWI8JVIFssacBuLnRgUYzJJAvv5ZUvbO/neKORhYUCRlb+tEtCJbN0oqF7hD4nd+fWccKQBoDTftY3DUYEh/PGYEwSZpZPnjw0M0mLCBST8dzAJQ+TGcQH7u58KUbU6r7dLAaYcKMP/tRHqYwZ+0X+a6QVq6W86cNjb8hZ1ALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH8PR11MB9457.namprd11.prod.outlook.com (2603:10b6:610:2c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 22:08:45 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 22:08:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 6/6] drm/xe/xe_query: Use separate iterator while
 filling GT list
Thread-Topic: [PATCH v3 6/6] drm/xe/xe_query: Use separate iterator while
 filling GT list
Thread-Index: AQHb6eVhOYGLl6HZTEi2IpRb16xBQrQcN4oQ
Date: Mon, 30 Jun 2025 22:08:45 +0000
Message-ID: <CH0PR11MB5444F82FB885D480A0C5E9B6E546A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <20250630173438.2342706-14-matthew.d.roper@intel.com>
In-Reply-To: <20250630173438.2342706-14-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH8PR11MB9457:EE_
x-ms-office365-filtering-correlation-id: 4b887d8e-f410-45c4-9ff8-08ddb822ae9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SfeYV0/5R2QnnKpqeTYh360QRO/1zxmcag3dD+jZn+n7PT5Ce6hroRDf077n?=
 =?us-ascii?Q?rCBgqW3hc48QiKVstqxLNRMfOhPDiKPOu0ZivdmXeQqVqJUFCkHx5xc4elm2?=
 =?us-ascii?Q?jJqUSPv+0bdsNgmV1aHuiLwOEN/VYACZH45a1TL31xIGa6Bp6B2H95F0WNmv?=
 =?us-ascii?Q?e8JqcgtnOLb6iZIAwfBaFkpupWzsDtpxurcYCzuP7gONBMohKQON5dVbOYMI?=
 =?us-ascii?Q?A7w5yU+xbQj56vjHlzX9NWXd7FBNsnhFocOAOWTTawLCc419xEuT5vYER2Kf?=
 =?us-ascii?Q?qGCggKiZKp2mzOzNS/AZpmXn4UAenLf9fZhyQ1ImyuISNPfnIe5nGxgTU821?=
 =?us-ascii?Q?UEuWj2t3dB9UrV0iSX7D+n9pqTefDkNqo1JDtTo0btt0ebmelu4X5OuOz2xC?=
 =?us-ascii?Q?5ZBAmJkp2p6RHoWZFI2nCIFC0ULACMeIeOFihj3OitiHzE3M3oSrSol8Oekm?=
 =?us-ascii?Q?E41mwFVHSuqDC8E+SGQdHqyhC1XsuoFmUQHaVbFZYDNLlH6ZJ/P7bqPhceca?=
 =?us-ascii?Q?ecXYKSyAQdqm+a5kLZ20ANZGDLKuPQoVFYwWNxvG2ZsgsnG50TG4LrNEbcBe?=
 =?us-ascii?Q?bt2xTUloT8sGqA5w6t35uFpYgTVOjPCnPEbcHeg1WN3UjMnxi+yfNg6D6aKA?=
 =?us-ascii?Q?EIFwdkzbdvFjXjxQVIKjU1KS9TQfNqjNaBdJZbOttmetLabCljDTdOUcqEEq?=
 =?us-ascii?Q?hKWxGFGJvyfmf06PC8mI7EkIb4Fx2G/G6WZBjU+5Xg/RGgJ50Qqc8xfKOW7g?=
 =?us-ascii?Q?ClwjGFvjHcFH8vR1wVzOovZm/vGCNDfGZJwalCYhfpFfg6GBs6/c77LYaeEs?=
 =?us-ascii?Q?1Mv1blQT/Om0mieFpg/YBQym2vp2YWfa+BKx5HszhXXZTR3lhyuQYD6mfUgr?=
 =?us-ascii?Q?L9oKNQWbVPqHxEMnMfVh2c+oThiK68+yzxfLP/9pg4d09Mo83uyTQXIrn53V?=
 =?us-ascii?Q?Np5ZLgVqqm4XJ2W7/sxkdGtXkjeDX7fbGeuTCJff865kgmGV0SoMp+JAV55e?=
 =?us-ascii?Q?74eHT2ejYm4xbEB8MkAg194o+bNrGLm7l6s+/7QkE5MyBiHHer9YoOb0TVL+?=
 =?us-ascii?Q?9whBPqHwl4ucIsTBRuXF7Xn5yaqmMVgJTz91Q67rf1aZa+nXXpiQZDTGdVPr?=
 =?us-ascii?Q?8+hBMOkDncEIdDfzaCHv44ZZWyYxPWQtu+qSM5wySlp+BMlXvxsjZ1iInIiC?=
 =?us-ascii?Q?EaHfgYnFCZ/tAfs5ikkYvffInFocbrp2f/bPpT/bq4SwRnxHjEW1ySoT80YJ?=
 =?us-ascii?Q?pvJdC+4Uz6VFNzeOwou9akkfB4xNCAjwSa4pw8xu7JDXJDvThWcfiLHXWoYM?=
 =?us-ascii?Q?rRQcFBtwKNVdFA1kuFypHZHHNnAtqX3KW3a8prnu6djK1PtEp1R38I6ublug?=
 =?us-ascii?Q?9q9Yyzi15cTP3ab9kvvtXNm7yQOWe1+r6AB0sM56DnDMHPkbKwwRzHIKZmKU?=
 =?us-ascii?Q?KIk7ZjDzCVrJQYFwX7SPJQ4nedb4+ZImHEw9TtVlhfUexsmYn9LQMM3pgESQ?=
 =?us-ascii?Q?dDbM3EQz8jlzvqM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0XHLQ7NmL2cCfPuNkSldvEOC2EInz0fKCmp7WIPi2Mc2/rgAuXbe1xpp825n?=
 =?us-ascii?Q?cv3DsN1XGa1NT+KMnijvaCi206RiIj2CWJS/43YaSgrLWO1fns1xhtQO0zLe?=
 =?us-ascii?Q?7lNlWSDFBVTJrP47EraNtfnYQUjSC30xLk50uuN2oaA9L75slwrR+vWxQqM1?=
 =?us-ascii?Q?xr2TkyS+705mwg+2RR41oiExfT7T2yh7HnwpThs7vEwzuO4rG1EOzutuVN5p?=
 =?us-ascii?Q?LgN6/i5G8zQk6NYgVQKq1L51DounGX4erX6kfXCuvxvbNXNTZ6WavRHqapRM?=
 =?us-ascii?Q?sgpbV3spqquUVV+gZIiF0FiEBC8WXHy6d+TPNwXtoN51k30vlQ32fNzrqcEk?=
 =?us-ascii?Q?N9RfBwSO4QZNFA/vrGKV+UE5MDKnOCuTLyzhOKZoPsDtLueTa5UkJLwPbdoN?=
 =?us-ascii?Q?s8wvq4qKZZDGgobmcDDjK7L77KPeeJ2QnY3DvIQKQHsZjNo2eRNnWC2rL22L?=
 =?us-ascii?Q?x4fxphveQuJN7WWRB92XE8jBfGiurhAEeAQmdKqgm2YOLLkuRqxC698XlKch?=
 =?us-ascii?Q?h9OrAV5JXCd2YznccrsB+1vbooDgHraQxZiTma6qEwwfjrPymTtZMJoSCrZb?=
 =?us-ascii?Q?DiRUlOwaXlFAY0WE+70u1NQpmfh7j7X8GxUy18KW19a+G5XYITMNS0/NQUcK?=
 =?us-ascii?Q?ybWT8EzjjHAXU9m0lt5G2uFPL3Ro8DY9EWfTEivko2E/+ZT7hGdWNToUbKRf?=
 =?us-ascii?Q?AzyXniWztEQKU9J9AS2BD75OYmmN+CnTxHNC7lVS4Ngck30/aWb2AYV5plPd?=
 =?us-ascii?Q?whOUz3Rnqzh+akO4r4iCeHOQcu2EMh0mo/8glGIap5hmf07S8T/ErJXG6lOq?=
 =?us-ascii?Q?wWhHohv/+f/BseSeGrPz1LQBDMnf4B6zqR3naucdTu9F6u+RlktXUF4Q00F+?=
 =?us-ascii?Q?nRMybH8J6hs6hVLJFao0EV6YszEW8yrfmQ3Ep3bhwL9z9b+eG/McfiCry3Q4?=
 =?us-ascii?Q?/uVMojWJ3yUA0SjoZ6CyB98PacLBAMDJ6J07mU/xi54/7IXRVZGTKMGEtZs0?=
 =?us-ascii?Q?ebO8n4+YtABkJ0MXWzMOMxqGK8NrCd5p7G3CltI9kN7qG0gSsVWoDWKLQG4F?=
 =?us-ascii?Q?8OCVjIvbSv80puRTKhScHdwFZst4QcjbV08+ezSP2nLaT2tZ6mJsm+8CCtAm?=
 =?us-ascii?Q?hhjijrYJu+bghSh1GCuGQUiHpfKA33deasWioHf0Xx63I6BD4+crpJBPEydS?=
 =?us-ascii?Q?z21NYrpzLJom4Elh6aOscyUQY2r8SvY58v4R5ftz+UNgxY9MXhSVSe4/YQp5?=
 =?us-ascii?Q?TUTbQaxF0/hXuwyfhAMB4HqPBzwFGNTeK9MqUhMsGDsZ56yQNIvjAxusakXZ?=
 =?us-ascii?Q?7MyowwU//tQ7i0x8C0/76VxaCwXaOa3eeRrvaGo9EKaTCbUe259Ee1rd5kzj?=
 =?us-ascii?Q?s6ZG2ZtLm9Fu5vtUHApZ3qMDnHfoCLcXFsh9fqM3Uvu2lVENSLOZ1Ny7MgMm?=
 =?us-ascii?Q?6kbQUD+WxYtxIVdGOCK/KF+sE2U9/rQkzSjbbrHCBfnHV9u56CD77NI+nUMX?=
 =?us-ascii?Q?apCO42r+INSkuNUoGd4ld9hiYm48hTldltwvwHmxvtZh8JPSjL7dN1AMV7BF?=
 =?us-ascii?Q?QzwFU4UOFmLLeIhPW2QWzhUNpoJecNLQpw1kBz5p?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b887d8e-f410-45c4-9ff8-08ddb822ae9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 22:08:45.3767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Z11rz6iXRccV0DkoYJHyNIhw1q921lrFhbJt31SihUFU/PSZb1KYdvXaayyY5LmzkooB3pctma//cqmuOZ4MQdfwOnO8fywKp9LCHgTRW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9457
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt R=
oper
Sent: Monday, June 30, 2025 10:35 AM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>
Subject: [PATCH v3 6/6] drm/xe/xe_query: Use separate iterator while fillin=
g GT list
>=20
> The 'id' value updated by for_each_gt() is the uapi GT ID of the GTs
> being iterated over, and may skip over values if a GT is not present on
> the device.  Use a separate iterator for GT list array assignments to
> ensure that the array will be filled properly on future platforms where
> index in the GT query list may not match the uapi ID.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.=
c
> index e615b0916217..c3e0a22f09f0 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -368,6 +368,7 @@ static int query_gt_list(struct xe_device *xe, struct=
 drm_xe_device_query *query
>  	struct drm_xe_query_gt_list __user *query_ptr =3D
>  		u64_to_user_ptr(query->data);
>  	struct drm_xe_query_gt_list *gt_list;
> +	int iter =3D 0;

It doesn't look like iter is being updated below.  Is it expected to always=
 be zero?
-Jonathan Cavitt

>  	u8 id;
> =20
>  	if (query->size =3D=3D 0) {
> @@ -385,12 +386,12 @@ static int query_gt_list(struct xe_device *xe, stru=
ct drm_xe_device_query *query
> =20
>  	for_each_gt(gt, xe, id) {
>  		if (xe_gt_is_media_type(gt))
> -			gt_list->gt_list[id].type =3D DRM_XE_QUERY_GT_TYPE_MEDIA;
> +			gt_list->gt_list[iter].type =3D DRM_XE_QUERY_GT_TYPE_MEDIA;
>  		else
> -			gt_list->gt_list[id].type =3D DRM_XE_QUERY_GT_TYPE_MAIN;
> -		gt_list->gt_list[id].tile_id =3D gt_to_tile(gt)->id;
> -		gt_list->gt_list[id].gt_id =3D gt->info.id;
> -		gt_list->gt_list[id].reference_clock =3D gt->info.reference_clock;
> +			gt_list->gt_list[iter].type =3D DRM_XE_QUERY_GT_TYPE_MAIN;
> +		gt_list->gt_list[iter].tile_id =3D gt_to_tile(gt)->id;
> +		gt_list->gt_list[iter].gt_id =3D gt->info.id;
> +		gt_list->gt_list[iter].reference_clock =3D gt->info.reference_clock;
>  		/*
>  		 * The mem_regions indexes in the mask below need to
>  		 * directly identify the struct
> @@ -406,18 +407,18 @@ static int query_gt_list(struct xe_device *xe, stru=
ct drm_xe_device_query *query
>  		 * assumption.
>  		 */
>  		if (!IS_DGFX(xe))
> -			gt_list->gt_list[id].near_mem_regions =3D 0x1;
> +			gt_list->gt_list[iter].near_mem_regions =3D 0x1;
>  		else
> -			gt_list->gt_list[id].near_mem_regions =3D
> +			gt_list->gt_list[iter].near_mem_regions =3D
>  				BIT(gt_to_tile(gt)->id) << 1;
> -		gt_list->gt_list[id].far_mem_regions =3D xe->info.mem_region_mask ^
> -			gt_list->gt_list[id].near_mem_regions;
> +		gt_list->gt_list[iter].far_mem_regions =3D xe->info.mem_region_mask ^
> +			gt_list->gt_list[iter].near_mem_regions;
> =20
> -		gt_list->gt_list[id].ip_ver_major =3D
> +		gt_list->gt_list[iter].ip_ver_major =3D
>  			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
> -		gt_list->gt_list[id].ip_ver_minor =3D
> +		gt_list->gt_list[iter].ip_ver_minor =3D
>  			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
> -		gt_list->gt_list[id].ip_ver_rev =3D
> +		gt_list->gt_list[iter].ip_ver_rev =3D
>  			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
>  	}
> =20
> --=20
> 2.49.0
>=20
>=20
