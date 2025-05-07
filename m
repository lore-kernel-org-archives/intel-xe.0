Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367AEC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23EE10E88D;
	Wed,  7 May 2025 20:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNtY3gVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56A810E88D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650199; x=1778186199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7yRqp/2eVteZpMT47jvwf7KvBeXRl7Vqt7we6QF0MF0=;
 b=aNtY3gVPByK7r9BwROskza9eBV89LlF08FHnTNa2PCqNW7srAqmTKR7y
 dJAFao49ZJfebmXIXFTZk3X3Cx98lQ15ycnEW3aN6y3Pn6wypEMU1yxeF
 CNR+7Ltm3AI6mLS3vEQIT9KpKVTrUOC4Wiaadj/4/lP7T68QvihYXjndO
 i07NzG51IF3MOtqS7Z2H14y+OONcM67BIo4ieDZvhArcQ1BWjKWNZTZSQ
 qBW4sIIwCopVfmAc0sWfPMGm4ua39gZFs6SaUlxGXNhl2DNndX3dYoGFj
 YbFiFAkfIez61XHkX39eWislH3LtfcsmHB6ZMdcbfNKaBFrzrIGBc/Nhk g==;
X-CSE-ConnectionGUID: C+Zb/paERo6H07hy4GJpNw==
X-CSE-MsgGUID: oHpW6DjaQl+XqOeFkuYSAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51062742"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="51062742"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:38 -0700
X-CSE-ConnectionGUID: IZMbynuHTIS+qyYZjfpJTg==
X-CSE-MsgGUID: zZvZf2qQTPuvIZNvTPGJbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="137002507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cu3GcltNfqcZtKrZ5tIW9+sR3VqTyUFVLgwTzkLCIzILeiNsld+4Hv/2QpQsUX63u9cpHKSWLJYMvZah9yiTEQquKVW4xKoW6wLo/TEHtxnfbCKCVDtZ8ZQHW6rU/ECNs1Kvk2jySUKBg5TOrCeLY0Kk66QSvrzg83AbajNKPEMMn7lIimtt8dMxLjtIbwe2XqFPFbHuwPKhT/SPijhCv3qXsdHR2ksWjdfoofD3WmYLJr1oAebX7Pj5yIO9D55fwuEs4aAPfE9telmmVDsa4HUe0cKItAcTfrem6NblmOSWTauL9jH7Mxvki0EBl1HGomt5bxUtsc2vmkvKfTL/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+Kxe+OTvKh1T4JRbPJhd0YrFURFHWW0Aa9RDUqwFB4=;
 b=TJhLkQrCNDic8XySQs2Kmbhbp4NsVmbo5FBSdAzyM3fa/QJFlmVE3IrsSmZqzM1OWnkkxwLB+IXa7RCC+45iuo+QX5msgBDOuVRHt0gXDAPd+Qpn51UM6F2YfMqeCgsUJPU9F0si7YdT/0SoRCJABjqaxK71keo3yuHTJKeOmNnC8KHpBcR97T+ywUY9DreEtDKIHY97R3OSovkQBnzwGELyZ9bGjUgX1uBhV9v3Vuv6yEnWRPqB+aVB4CI0tFvKkQt5gIzJWJ93NfG76iSDrym3M0AVRseh2TZSiZZEloH6IdOVMAQRXpZRw7Hl6YhK4hsoCDIUvnGhkJyC1Io/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 20:36:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 4/9] drm/xe: Add pat_index to properties line in VM
 snapshot capture
Thread-Topic: [PATCH v4 4/9] drm/xe: Add pat_index to properties line in VM
 snapshot capture
Thread-Index: AQHbv4yqaBYiMNceCkKBlPlXzgjXy7PHnZaA
Date: Wed, 7 May 2025 20:36:34 +0000
Message-ID: <CH0PR11MB54448EA3602B49239EA375DDE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-5-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7009:EE_
x-ms-office365-filtering-correlation-id: f258a1a6-5905-4c16-35f9-08dd8da6db90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?jPN5OZIeBYmyszJhenyV/hTsvBW+A+tUn9AIAehWri8JWez16k9BDNYLOv?=
 =?iso-8859-1?Q?/bczA7G5/2P02Y/Nt2OEPYrp/DQ8L7Qn2fB8n6avcVXqu4Gj0OVC5PXG20?=
 =?iso-8859-1?Q?hr3XCY0vAJsLFIVqT/dWOfBQ9cb4RQs2HguCVKOeaos3KzEGYvY9Lvs8hR?=
 =?iso-8859-1?Q?OzdHnD5BGPI+KNdr9VM7vsiNbR9fM/aW45XOfeWAsViaQnXDn/A8QvKpRH?=
 =?iso-8859-1?Q?BLFwssuEU1kU2FbzJ3uEL0fz3FQWWe120E1KY7iYrZtEcwleVq6Ggn2x2K?=
 =?iso-8859-1?Q?w/wEx6YbUm8sc+p0FQjQr6RaKtW1qtAqRvMPK8694/focPtAyjK8GHiifR?=
 =?iso-8859-1?Q?L31nnI2HcekcLj8EPsbgbRjj3vZyFl59gsEF1EmSBW3Gb8rwBx9P5dRBNg?=
 =?iso-8859-1?Q?GameL/+43aUWmWk1SY+OFqxL7KXJ2mGp9EGRFDXjatSm6x1YqimCJehEae?=
 =?iso-8859-1?Q?igzDXEjjVSw2jbaRbepJ4P9H1iNB1FiC0tnDVyEh3KUeYAxqBQ+vcJ1Jl0?=
 =?iso-8859-1?Q?US5mepFJ17HD07lDKZaBlU1jSiLLLhAixT63mh1yctdU7vaQoG3xN5KT5Q?=
 =?iso-8859-1?Q?2+HLI7AKGa0/OYzltqVGqp3hIvVP5UUXNJIarou8SHwHbF8xtuA70abQAi?=
 =?iso-8859-1?Q?GRGjpNs4JIWkzhDLmJCu28HuhusTssGyppZVr0FBrJeEXmg4xZvchZbrT8?=
 =?iso-8859-1?Q?pCG885Y6t4kRzSOHxJwqgNZ/OG/t5O/BSloRKSUlJKdVQlTqrb+cwH9vLS?=
 =?iso-8859-1?Q?uR5iLV8k4RzZIvYlkqAvmrpV9hH4Nyskcijzf7+9/hV+oX0dC+6n9LhRYV?=
 =?iso-8859-1?Q?yyPDXIMnWFhv3PSxZ8eur1LcQtJ/PidBY36sn78XkBixyW9qf57KMMHuXL?=
 =?iso-8859-1?Q?YacJVCFzcoOHjNTsrYli9nzG2F6CD2cL41TYE+k3e54tp9RX+Lc/L5uUlv?=
 =?iso-8859-1?Q?lboBrVNoAfjk6B3VJ+VdOLsjK7vrpqwkG+tWq/791prApnTZwO/FMPROAY?=
 =?iso-8859-1?Q?v2naMt4e6pMTe7GRIxjOZsV9R402BbPuUnJ22tNPP/+7ot7qWFGrDWYDQE?=
 =?iso-8859-1?Q?5VzjqYJqUGqob71lZxZPBH6i4PLpl6K5BtnAapxs5iCtwM8UBGaTUOeg36?=
 =?iso-8859-1?Q?kgUjsmJ7scGWmxQqKIM/CUQtjJ7cUrLZj+Hf0BvWESNAAUQinM8VNRjvE4?=
 =?iso-8859-1?Q?uDcL2Q3SqUVQcV3+Yg0QvRTunKPyEXZ/bdLVexfQQJKx0WWm6dkFPZQMzl?=
 =?iso-8859-1?Q?KzSMdQKQrWzkTX7omwyWoM148vInDig0qDPYKjSvBveYfkPPZEv6vNROqc?=
 =?iso-8859-1?Q?Vo9KlIvuYRLlUOp27tiu7/UCvBiPf/Q5jm0Kllw9Xf/1zECyHQi4yofOiE?=
 =?iso-8859-1?Q?4UOB2JrzxbS1FBI7nLHfC98lIeRbZ9JC/8l8GsLN1e4thlAGHmLutEbPcz?=
 =?iso-8859-1?Q?rHujVkP7MMGZFMEsutE5MGN37+oHSo7Qet70t8PTlyl2RR0tU3QdpoxgAB?=
 =?iso-8859-1?Q?KlIZ1YxS9XhcnxbW4vmh5xjbNkoVoB9V7tugz6Mw7fks6rqIAql0lWbCR/?=
 =?iso-8859-1?Q?1MiPGtE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?i6GX32vmKxfLxy9DZDfxXN+Xi4gyWM3ppdXsRWoNfjvQnLUCbk0K6iZBHh?=
 =?iso-8859-1?Q?5fNiCFYPwoE+DE6MCwJ9xQTzJS0pAxxiYkmbJ0CzLqEtG0GwXpoxxTAc88?=
 =?iso-8859-1?Q?qGhEFbxHoG8q72hNihqhi5ZYbBskHqCzXmcZ9r7GQ9fL35CT6nrVnzO/5X?=
 =?iso-8859-1?Q?rE0RY8Tt0QT7xBkFl1j1Eseo/lRxMPbWxTDf1IAKxPXxhrQIwNrIYkhSBK?=
 =?iso-8859-1?Q?1uIq5+rn85fIQyX+ZUkx9dqZPSWJQx5lYE36lyherevs0bp+BgtWKCyaY/?=
 =?iso-8859-1?Q?8adRmNsTvMy2VYInYzi1O++mtZ71Oabl8TkgIkeb1p6pEYSLNNr3hhgRNn?=
 =?iso-8859-1?Q?TTKlpj3+fZgmhS+RZrsHYCoYssrkwMXjj5gdHMUjuJhJlAMBR8JxxapS5M?=
 =?iso-8859-1?Q?56bfe+7udFThLt/T0/cY4HRCPLHkbOwhUIJ1IbpPdD6KlptK/1nCWEyzRW?=
 =?iso-8859-1?Q?tySxCWdoV8dAQUJ9qAUGzRuqwmwFoTnD5oAaQZb73jA6weoMRs3HN6wHhV?=
 =?iso-8859-1?Q?htKAZmwIfEujOLbIJIWAnm3TN+2b1/Vv8QY4WKjtLjSKzWD94lZq8lMLzb?=
 =?iso-8859-1?Q?cdIA3jfYUxKKQs8PegCxEQ6bCnymKqF9l0WqgADwIciylrNtXRUFb4q6UU?=
 =?iso-8859-1?Q?j+UC9XOMnraSyb5h6Y42PCADvew4FpOS9qzh89Wb0aZQ+XPiHofnUw1Oas?=
 =?iso-8859-1?Q?toOBvNWTWBrtwNbkcbEfiVCrAcGJ0+pM/tj38YZ8p9cYLhlBueVX0HfBlh?=
 =?iso-8859-1?Q?1o6YaZ+UAmElJWWKJ3v22GZfd1PImkDUIOUUJvmZ+BCQUJLF6L8AjfYK3f?=
 =?iso-8859-1?Q?fbSKgi+iEOlNyT3autTsVM2unCsJepfg/az3BWTSPXU6ioh/uXtxY4r9W3?=
 =?iso-8859-1?Q?qEXl0oxx3AQwpB1ewnBzFaiKFDlm3QhGdEiSKXKANTbJmEzjvnqXuJrz7w?=
 =?iso-8859-1?Q?CXtBuM/CEvcMCQS7LAHdY2Q7soLvugxMIIrkT977hqRVAhX0/w25CD6Rto?=
 =?iso-8859-1?Q?VUVnWCMrB1ozVxwg97Yl3po48Oc1L47WbONnfgNH5Uv5zNDwq2fYLjqiWn?=
 =?iso-8859-1?Q?AqCI6YrGybmhSdHE+5SZWs4kyzVVfauGtUeDmEnr4NZQ2nk3/Of89+ceKA?=
 =?iso-8859-1?Q?2NeIe9GXomfAWtaj5booEi/12pz585zYNTkuXsg6SKs76fjyzkMjBU+FKr?=
 =?iso-8859-1?Q?YwE8ChsoUtaibyUeJAL9Gibyp86YahqtYRQJmue7aT273KQA9uDAV4mRwS?=
 =?iso-8859-1?Q?EvGHTAkoHUabrOtPYg3Tt/GQdSktKx/Q5dKL5MXRXyk+DJOVlVUm+FKnA9?=
 =?iso-8859-1?Q?/81A7KffS02uBCIdQcnIsD0orIoN/0a6f3K3jZSqV+rI6AAU1ut5uU3Uv/?=
 =?iso-8859-1?Q?Fcc7ubEyeqyAxSecaFHTteFk7O9JKjyb6Dcynqb4kMpGkQImf28N491a1U?=
 =?iso-8859-1?Q?YPil1v++QwH7Pc80SlRcWf7que5oyQIuC0Z11n0r8YrlBy1jNqF9P+K2kP?=
 =?iso-8859-1?Q?Q6k00tGY1+C9l/sPWpdV61mceUIO6BrzvkC3c3JADxT0RkZdpjBVnZNz8R?=
 =?iso-8859-1?Q?VcWBfhf580Ol7YgkdlP/v0ELmGQ7kRIgLGtkX9LU0nN8oaRyk/SzmvDnn1?=
 =?iso-8859-1?Q?QeJ0wiErwsFmyAWgfQWTfi4vqAWwvWlheo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f258a1a6-5905-4c16-35f9-08dd8da6db90
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:34.3707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgAMPArtzfhiXTUACsjre/wGAdyNRwmQdLuq7ftlYjaaBLvy/WccyD4onWtRXoDURNrZra5Z6EaFqrNMXNefVL6b7L9wDyUew+YgEx3k1JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, May 7, 2025 1:16 PM
To: intel-xe@lists.freedesktop.org
Cc: Souza, Jose <jose.souza@intel.com>; Santa, Carlos <carlos.santa@intel.c=
om>; Venkatesh Reddy, Sushma <sushma.venkatesh.reddy@intel.com>
Subject: [PATCH v4 4/9] drm/xe: Add pat_index to properties line in VM snap=
shot capture
>=20
> Add pat index to properties line in VM snapshot capture indicating
> the VMA caching properites. This is useful information for debug and
> will help build a robust GPU hang replay tool.
>=20
> The current format is:
>=20
> [<vma address>]: <permissions>|<type>|mem_region=3D0x%x|pat_index=3D%d
>=20
> Permissions has two options, either "read_only" or "read_write".
>=20
> Type has three options, either "userptr", "null_sparse", or "bo".
>=20
> Memory region is a bit mask of where the memory is located.
>=20
> Pat index corresponds to the value setup upon VM bind.
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 842e482b60b2..0675c46b7c63 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3732,6 +3732,7 @@ struct xe_vm_snapshot {
>  #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
>  		unsigned long flags;
>  		int uapi_mem_region;
> +		int pat_index;
>  		struct xe_bo *bo;
>  		void *data;
>  		struct mm_struct *mm;
> @@ -3774,6 +3775,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struc=
t xe_vm *vm)
>  		snap->snap[i].len =3D xe_vma_size(vma);
>  		snap->snap[i].flags =3D xe_vma_read_only(vma) ?
>  			XE_VM_SNAP_FLAG_READ_ONLY : 0;
> +		snap->snap[i].pat_index =3D vma->pat_index;
>  		if (bo) {
>  			snap->snap[i].bo =3D xe_bo_get(bo);
>  			snap->snap[i].bo_ofs =3D xe_vma_bo_offset(vma);
> @@ -3875,7 +3877,7 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *sn=
ap, struct drm_printer *p)
>  	for (i =3D 0; i < snap->num_snaps; i++) {
>  		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[=
i].len);
> =20
> -		drm_printf(p, "[%llx].properties: %s|%s|mem_region=3D0x%lx\n",
> +		drm_printf(p, "[%llx].properties: %s|%s|mem_region=3D0x%lx|pat_index=
=3D%d\n",
>  			   snap->snap[i].ofs,
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
>  			   "read_only" : "read_write",
> @@ -3884,7 +3886,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *sn=
ap, struct drm_printer *p)
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
>  			   "userptr" : "bo",
>  			   snap->snap[i].uapi_mem_region =3D=3D -1 ? 0 :
> -			   BIT(snap->snap[i].uapi_mem_region));
> +			   BIT(snap->snap[i].uapi_mem_region),
> +			   snap->snap[i].pat_index);
> =20
>  		if (IS_ERR(snap->snap[i].data)) {
>  			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
> --=20
> 2.34.1
>=20
>=20
