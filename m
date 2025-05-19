Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CF3C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 04:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404E110E212;
	Mon, 19 May 2025 04:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7xsUOl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6F010E212
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 04:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747628529; x=1779164529;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k/4jU9tVp3rgy3DDUwXJzWNah14e9uKqyJocEAnjYI4=;
 b=E7xsUOl6/nbpOFgnnI6ZRBqV67/PLQZVi2PEbkNKJxyh3GpS/XAD1D5V
 IHTfwywgPgA88muLXWk5qMZAmFI1Cd4mf76P8QLkGCM+kn0DNKJG8ALVL
 WN3+kmp2qwwee+mGDaEyR46vPXzbFthcHv+IEv8pPRcr84iKatRAT3cza
 envtaJ73BmsuMoViq09Y6GBdvawYPgzTD2VD2aFeyfZUBKFUiRdf8y/rq
 dmt/cDvX/6FsR0mrHTZz8iAki9G7Im2yaqACJu2sf+FRkUD0YB1G3q8cK
 lQX/loAzywLtwNV4u+wdFBNG7agVJFzRMshAq6Xj2I4kXTliwtkQMPTcE Q==;
X-CSE-ConnectionGUID: FgLCz3h9RdmmWBwDwJkCGQ==
X-CSE-MsgGUID: Gm6BPBPfTKOxCQABRcAeEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49666524"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49666524"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 21:22:07 -0700
X-CSE-ConnectionGUID: yrbMBfpeRLmD2GxmtG8Qaw==
X-CSE-MsgGUID: ZZ7j56H8SkCGxIGub9Puzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="170170438"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 21:22:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 18 May 2025 21:22:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 18 May 2025 21:22:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 18 May 2025 21:22:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYd4moBM1hjby7s8ZzonGQHSHuj13IByGUX82rldNiGFLt9DssIX184UUrD3MXHibnJ0K8b6kbHtMG5T1WVk19A9niKd/UwjdlQaXFHvh7Y2CXdKY9NLzI0OhmyNGTjQ4tS188hikEVlUn31uWNUuNJrTmO7+Mw+Z7SOgxQA21hRA50mB68Z93DS2U6f/vWQrlruD187gmNJh5phfGFHXCtg4/bVF0c9kKs4xOJ4hdC9Cv7z+Bh00jeFF1cUm8/zzzHcVkYk4cXvH+KR3rDRbYmCYEkeAnN0YQwGoxUCUW0VbBHVvXtH1NvwKYj6Y6lR+oO5vri4ZoRZm+VZ3zp9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/4jU9tVp3rgy3DDUwXJzWNah14e9uKqyJocEAnjYI4=;
 b=Lq/Vu/AK5boNKx37MF9XUingc0nGIyVvx05WhwnCFGa3K8a2UHkvh6WKruAO3AMr/u0kpDmWAs8e3QGAGhOS64jTYgatouEy4PKQzUY+4C9yS+712CEEZlh747KSUQkMIiQsUl58fO3OsZDdhqH6p7lIaSxa7ED8XbXrj3TrghVA0sTVFp7kRZGIx7uRSfRsrFrrtycQa1xllQbsPKoTwBSmg0M37NUHqzxYDpxGUYCFG2NieNGzD5YuuXjCiQ+DG7DGaesi2RqhATk+9r3f2Rpp00Sc5VA0IbduWKgO+OUVvIjKWGozLHz9t6lYqkR3EQ1NDpT0nSWw7xBz6J2RKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 04:21:58 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 04:21:58 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe/bo: optimise CCS case for WB pages
Thread-Topic: [PATCH] drm/xe/bo: optimise CCS case for WB pages
Thread-Index: AQHbxniWEDOfrfSNhUGZwimAoNQeorPZXeHw
Date: Mon, 19 May 2025 04:21:58 +0000
Message-ID: <LV3PR11MB869577CB9DB26A1ABB5ACFD6F99CA@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250516153810.223530-2-matthew.auld@intel.com>
In-Reply-To: <20250516153810.223530-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SN7PR11MB7637:EE_
x-ms-office365-filtering-correlation-id: 96ffa6a2-34a4-42c3-f457-08dd968cb1ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?bDFLelNzTUZjN0xkYU4zdDZUMWtxOWFsbFNSVUR1cTVwOUQvNHMyZVlidmNE?=
 =?utf-8?B?STM0eXZOcU9SR0VlclFkc1JXT3lPdEk3cFBhZm9BT3FCQU0rVWdCMmpleEhw?=
 =?utf-8?B?WXJFOUtEeUlBOWFDRXdpWDU0dkR1cDJacDU5YXFjeTVNUmZneXV5c0tOM0dr?=
 =?utf-8?B?OUJFT3llQVA0MkVtTkwvcjlBZ2gra3NjRFQ5WXZiQWowTG4yV2owNXd0a3B4?=
 =?utf-8?B?d2c0eVRmSHJBKzBJUlBLa3Z0RlJzYlIvb2p4ektxSFNGbzUxNkJoeHR4SjFK?=
 =?utf-8?B?U3o1WVI1N3FjekVxdHllQUNwK1QrOG9nSG01eWJKUUxuK3N3UDhTSVVxWTdi?=
 =?utf-8?B?UkxNNDA2Y0JHZ3B4ejhkdHVCSHFwN1dRdnIwV0ZKUHhmVU1QYm1lRGlCcGl1?=
 =?utf-8?B?WTJISVJ6U0M0cDV1VG9VQy9aMzI2cy9YQjZSa2xkR0ZhN05ER2d5RkNMUGFj?=
 =?utf-8?B?UWU3emIvY1dMTE1mOU9zZEIrT013MGRabWNwa3lVZ0lnQ0JwZkt3R3VpcnNG?=
 =?utf-8?B?REtRcVFueWxIYTYvT3hzeURoZm1WbFpmYnF4c1pETHU5ci91WEQweUY2NXRQ?=
 =?utf-8?B?NGF1ZjNMN0hud1Q4VnZYZFRqUCs5VDZwYVN6b1dmT2JtTW40a2VIeHN6Rjhj?=
 =?utf-8?B?RE9DUnRsR1hUekkxbTJrTmFxYTlDUzhDQTNyU2hNNHlRNzN2YmF0eXZYN2h6?=
 =?utf-8?B?dW5OYnJjWnpodjRmNWU2aDdYdllSQUVIaVVBSWpLNktYOXpGS1JsclpNR0dY?=
 =?utf-8?B?QXVuT2NxamZQN2FMUTRyMFg1aWJZbEwvdzRtcVlmRHdXdUE5eFVGYnM2ano3?=
 =?utf-8?B?T0V3VElzc0ZzYk4wRFk1T0FobThTTDA0QUd1RksxdGltUzNvbXh3d01uaGV1?=
 =?utf-8?B?WnpQYk1RdVgzU0VaYXp0a1hlZTJ2eC9jbU9zOUZ4UFJjL3dHRWMwM3ZkbHhB?=
 =?utf-8?B?bHBQU2NabzcyR3ZhSUhyR3lFa1BQWnlydkRjcnpBeEhlTWNySzd2TDlvMHh2?=
 =?utf-8?B?bGlCaFJKbUpLQ0hVSmNidCtHV1JqdXF0RC9oaThGS0R3dzBnZ3R6RkY1MlNv?=
 =?utf-8?B?L0FqclM0THR4aXlHUTVyYXdzUHI4MzMwRjFKenNROTg3d2Z6S09Cc3dtM09n?=
 =?utf-8?B?Q0c1N09SS2loVVZGZGFtZTdGUzZSOE9rbmpsNjVYdzh1ckFNU3l3MUo1eGFM?=
 =?utf-8?B?a0NaTDNBRkhXUkV3Kzhxb3hmZlB5TEJoejF6elJXNWhaV29vVkR1OUxRRXV0?=
 =?utf-8?B?UWpPOWYyM0JNdGE5cTZiMzZNTDlWMDZpWGd2NGJBMVF2UzNOTHo5N2NTVjYv?=
 =?utf-8?B?S0JWNVB6cjI5REhKRW9LTGxTNXFWUGFQT2h1TmkvVE41aFhocXJvREt1OVRJ?=
 =?utf-8?B?ZlR2WFhPZkg0bG0yS2R6S1lQeVhRQ1lLL1A0QmtRaEFLeC9YWDIwUDF3M2Ix?=
 =?utf-8?B?YlFEcU9BT2EyUXAzWlF4cTBlL2toSDFKUmJ5S1hhSC9EZVZuVjNKUk10ZnNX?=
 =?utf-8?B?NWVFWmIyR0lEUGYxaW1NZ0o2QlJMMTlhdDBMTHdGbStocnlrSnNOTDl1UXJB?=
 =?utf-8?B?WFYwb2dsbHJQcFkwUlBtajVhQ21Nak5MRDQ3Y0xUVEtkZVFHYS83TXlWUi95?=
 =?utf-8?B?MzNCaVgxZ2xIUjVUN0gzUDRZdk9raTdBeXJoMzI2WjF1RjZYK2p6WlliTC9D?=
 =?utf-8?B?R0hIbWJmZGpwS05lUktXZDhETy9iZjZlNVZNZVFRdlEycE13blpndEdkVlox?=
 =?utf-8?B?b0lNTmFjajNLeGxSWWxEWVVUaDM2M0VoSEdycHdZME9hUFhnY3JXNHliTzdU?=
 =?utf-8?B?Ykd0YlZHTHRYYkFwUGExamQ2Rmx4NzFmU09GaWdVMW1XV1NCeFVoa243Ynox?=
 =?utf-8?B?emsrdGhhYmxudmxwbzhMYVBJMTBRc0pSbVZIMFh4aTNZV01OcEpteVFEeXZo?=
 =?utf-8?B?bWpOTENZN2wwVER6OWQ4YS9WZTIzV3RicHVmS2xXS0h3ODkzVUZYWWQxcFBu?=
 =?utf-8?Q?phpjvLPGEmP+5ooaGmMJY7JryD1xnw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkhEWWVrYWdscnRVRTlWRkl0djlKRmxmazh1L0MyUkV1eW5rd1M3UEFJNXJY?=
 =?utf-8?B?YUdpSWJtQXRzUjVFLzE5SFVSdlRGSnhaTlArN3F5eDlKUlBVOEFDTFJzWVN4?=
 =?utf-8?B?Y3BKeWJTUVcrS01nQVZTME5tKzFrR2JFOGM1NXFKaTNUOHlGQlVTYjNFdzNB?=
 =?utf-8?B?dCtCcmxpVytYYXgwbkk4a0hrZldXQzZjMlJINzJpL01DK29WUUJ6bExyWXo5?=
 =?utf-8?B?cmo0dHlGNGVSdFlhWUZiVDhaU2ZMQnhLZ3pWajlLRGZFcFlHa2hIWE9KL0hp?=
 =?utf-8?B?YmNGYVhra2pSd2xiVElpV1ZpT0Rld281NHEyMTBIRVM2N1pMRkRLYk5kSkM5?=
 =?utf-8?B?emFGUXZVZFQ4V3ExYzd1MG9tKzV4TDZ4bzFuQVpSWGw1WU5ZdjU0emp5Kzlo?=
 =?utf-8?B?OHFxREIzeDZLR3QvZXVZeVdxK1BvQmoxdU42ZXVxNlFpT2p1RFNIMk95VmZR?=
 =?utf-8?B?MXF5Z1JhMHNtUGR3T0ZmNkhPWHJzY09ZWUhTL2hZYnhzQm5abjFmN1VCQzVB?=
 =?utf-8?B?Mm0rTTJpcmxmeWNKRzZSVFhpVDRCSG9pbG5LOE1waWtEMmZMOXZxMzZPZmN3?=
 =?utf-8?B?NHQzaVg5NExLWmlWYkIxcGw4aXhiWkZtWjRnMVl0MGNTVFo4SVlOb0N0YVpn?=
 =?utf-8?B?OVh4dmRqd3Q4WGhFSVV5Y3FqRXFuMFlrK1ZNMzlsMW1FbUZYT0RzanhVZVJm?=
 =?utf-8?B?RUp3ckRqemxVUVhrSittYy9oODlHMTZ6N01mSW5CTi8vamx5N0JjUUE2YWpo?=
 =?utf-8?B?dDRJb3pnSldjVXJrTFlRVVVGRXc1cXBjdnYzMW5Xck8zRENMUkhQT25WajV3?=
 =?utf-8?B?VXloRW5XL2NkeTJSZFhFU1Rmc3N6bU1kcWY2MEJDYWNZNXhBYStvYWdKYXVB?=
 =?utf-8?B?ZzB2NUtxMDE4dGQrMzRoeDBPTzlwcWxRTlh1VmhTWHVURlV6N0ZSUkhGZzkv?=
 =?utf-8?B?NFBHeUhXSVQ5RHVWaWEyR2hlRXVVV2JsenhOU2tVMFhGaUw5M0MvM2Vqa2l1?=
 =?utf-8?B?dFY5eHBENy9nWEtCd1hoSDVpbDF3bXpUMy9yZXBDWlRRTEVlem90M3Mra2c2?=
 =?utf-8?B?YkhHQ3FCMlpnK01tZDZFRzZqVFB5emU3UzBsdHU5Q0lhZTZSeE5yZkpjZHZZ?=
 =?utf-8?B?S0JLOVBYQTVTcEFWWk9pb3YvcWdOelNzY2pabU9WOHhSN0xheHdEcmdUZEhq?=
 =?utf-8?B?aUdsUi85bHJxL0ZndXgwR1dERXZYYVRBRVZjMWVyOG4xOEJDZVMwSjY0QnJr?=
 =?utf-8?B?dWVQSGpXditBNWpwbi9BQ2orTlFrL3FJMENQdzRaUW5XUE13ZGlyS3lBRUJD?=
 =?utf-8?B?Q2xPeXRLSDZBQm9CQU9COEE5QTdZWlVqc2xoTjR0M1RKZEJqaGJsUjFta1Na?=
 =?utf-8?B?cW5Pa044eVg0SVVIeFpWajJpMUgrMUhpU2Qvb1JLYnZOWkEzNFdKSEdKUzJB?=
 =?utf-8?B?MTRJTzM5dmJpMVlRQzYrVkF0ZjNuWDRuUTRxRTVUb0ZUTmVDNHNTUTlIK2RW?=
 =?utf-8?B?OHNibEdFeVlUbHVDSEIyLytHZjFBYWNGM2ZOQlFRelhQWlZaaEpXcEQrZzFm?=
 =?utf-8?B?VGJjVFQyVlFtRlpCR0VMeWdIQ0Vtc0J0TFdSdjJ6WU5DelVoeDVUVDdVam5G?=
 =?utf-8?B?eDc5R21JZTR5M3ZOcElWMnBUR3N1bDA0MkhSKzZuQ0VSc0h3cVY0QjEzSW9j?=
 =?utf-8?B?SFIxTDNEa3Q0bHZjMFFmRklJTFI2WS9OcUw3SXlua0JVbXBRUG9WYzZEWmo4?=
 =?utf-8?B?Ky9EOEovSDZ2cjlvN2NIaGNCMmVybDZKYVBvUHpXc042T05yMzFWdk40ZmZu?=
 =?utf-8?B?bUJFVHpDdkJKWGIrSXhUb3lCWkpKZENnMW1hajBMK0J2SXZ4UE5LQ2EwbUVK?=
 =?utf-8?B?RUZpSUNJV1RIV2syUEhUdEU3eWRCNWpNTWlQcHJCbE14SENqY3d5WFphQ3Br?=
 =?utf-8?B?Z1JrTjlLYnh3Wk11YW9JQlZwUnF5bFY5MlJxYmZpM1cxMndNSFBnYlN6dnV3?=
 =?utf-8?B?T3VzMzZ0bm5HVmpZQWV0TUpWcEREbEZ1cVZLL0lIeHJuY0RyU2lEUEljUjQz?=
 =?utf-8?B?eG4ySEJrdFEwQUZONWJZMzZ3T21SLzllZTNXenRFUHV3VTVremNYRW8xRlRT?=
 =?utf-8?B?VzE3aDZRUUM4U1FMdVNCa0hHakpiamFreXovUFdUeEdnZHR0VzF1cFRMa2xr?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ffa6a2-34a4-42c3-f457-08dd968cb1ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 04:21:58.1936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /v4xaad0ZuswkLRCcyalu9yuBI///dUlCGxTDQhq1vG1s7vJszg94TzjzCbnQl2LYN3NK06SerXwyN8cPjwogNw3AdyRVWbkkcf2XzkzE7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
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

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMTYsIDIwMjUgOTow
OCBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLIFYgUCwg
U2F0eWFuYXJheWFuYSA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+OyBUaG9tYXMgSGVs
bHN0csO2bQ0KPiA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+OyBCcm9zdCwgTWF0
dGhldw0KPiA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJt
L3hlL2JvOiBvcHRpbWlzZSBDQ1MgY2FzZSBmb3IgV0IgcGFnZXMNCj4gDQo+IERlYWxpbmcgd2l0
aCBDQ1Mgc3RhdGUgaXMgc2lnbmlmaWNhbnQgb24gTE5MKywgd2hlcmUgd2UgZW5kIHVwIGNsZWFy
aW5nDQo+IHRoZSBjb21wcmVzc2lvbiBzdGF0ZSBvbiBldmVyeSBwYWdlIGFsbG9jIHVzaW5nIHRo
ZSBibGl0dGVyIGZvciB1c2VyDQo+IGJ1ZmZlcnMsIGluY2x1ZGluZyBhbHNvIHNhdmluZyBhbmQg
cmVzdG9yaW5nIGl0IHdoZW4gbW92aW5nIGJldHdlZW4NCj4gZG9tYWlucywgcGx1cyB3ZSBuZWVk
IHRvIGFsbG9jIGV4dHJhIHBhZ2VzIHRvIGhvbGQgdGhlIHJhdyBDQ1Mgc3RhdGUgZm9yDQo+IHRo
ZSBzYXZlIHN0ZXAuDQo+IA0KPiBIb3dldmVyIGFsbCBjb21wcmVzc2lvbiBQQVQgbW9kZXMsIG9u
IHBsYXRmb3JtcyBsaWtlIExOTCwgYWxzbyByZXF1aXJlDQo+IGNvaF9ub25lLCBtZWFuaW5nIHRo
YXQgb25seSBXQyBtZW1vcnkgY2FuIHVzZSBjb21wcmVzc2lvbiBpbiB0aGUgZmlyc3QNCj4gcGxh
Y2UuIFdpdGggdGhpcyB3ZSBjYW4gYmUgc25lYWt5IGFuZCBjb21wbGV0ZWx5IGlnbm9yZSBDQ1Mg
Zm9yIFdCDQo+IGJ1ZmZlcnMsIHdoaWNoIGlzIGxpa2VseSB0aGUgY29tbW9uIGNhc2UgYW55d2F5
LiBUaGlzIHdvdWxkIHRoZW4gc2tpcA0KPiBhbGwgYmxpdHRlciBtb3Zlcy9jbGVhcnMgYmV0d2Vl
biBzeXMgPC0+IHR0IGFuZCB0aGVuIGFsc28gbWVhbnMgd2UgY2FuDQo+IGRyb3AgdGhlIGV4dHJh
IENDUyBwYWdlcy4NCj4gDQo+IFRoaXMgc2hvdWxkIGJlIHNhZmUgc2luY2UgdGhlcmUgaXMgbm8g
d2F5IHRvIGludGVyYWN0IHdpdGggdGhlDQo+IGNvbXByZXNzaW9uIHN0YXRlIChwb3RlbnRpYWxs
eSB1bmNsZWFyZWQpIHdpdGhvdXQgdXNpbmcgYSBQQVQgZW5hYmxlZA0KPiBpbmRleCAod2hpY2gg
aXMgcmVqZWN0ZWQgYXQgYmluZCksIGluY2x1ZGluZyBpZiB0cnlpbmcgdG8gYmUgbWFsaWNpb3Vz
DQo+IGFuZCBjb3B5IHRoZSByYXcgQ0NTIHN0YXRlIGZyb20gdXNlcnBhY2UsIHdoaWNoIHNob3Vs
ZCBnaXZlIGJhY2sgYWxsDQo+IHplcm9lcyBpZiB0aGUgc3JjIHN1cmZhY2UgKGluZGlyZWN0KSBp
cyBsYWNraW5nIGNvbXByZXNzZWQgUEFUIGluZGV4Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0
dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBDYzogU2F0eWFuYXJheWFuYSBL
IFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0
csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEJy
b3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfYm8uYyAgfCA4ICsrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMg
fCAzICsrLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBpbmRleCBkOTlkOTFmZThhYTkuLjNmYWZkY2I4ZDk1
YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gQEAgLTI5ODIsNiArMjk4MiwxNCBAQCBib29sIHhl
X2JvX25lZWRzX2Njc19wYWdlcyhzdHJ1Y3QgeGVfYm8gKmJvKQ0KPiAgCWlmIChJU19ER0ZYKHhl
KSAmJiAoYm8tPmZsYWdzICYgWEVfQk9fRkxBR19TWVNURU0pKQ0KPiAgCQlyZXR1cm4gZmFsc2U7
DQo+IA0KPiArCS8qDQo+ICsJICogQ29tcHJlc3Npb24gaW1wbGllcyBjb2hfbm9uZSwgdGhlcmVm
b3JlIHdlIGtub3cgZm9yIHN1cmUgdGhhdCBXQg0KPiArCSAqIG1lbW9yeSBjYW4ndCBjdXJyZW50
bHkgdXNlIGNvbXByZXNzaW9uLCB3aGljaCBpcyBsaWtlbHkgb25lIG9mIHRoZQ0KPiArCSAqIGNv
bW1vbiBjYXNlcy4NCj4gKwkgKi8NCj4gKwlpZiAoYm8tPmNwdV9jYWNoaW5nID09IERSTV9YRV9H
RU1fQ1BVX0NBQ0hJTkdfV0IpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiAgCXJldHVybiB0
cnVlOw0KPiAgfQ0KPiANCkxHVE0uDQpSZXZpZXdlZC1ieTogU2F0eWFuYXJheWFuYSBLIFYgUCA8
c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wYXQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYXQuYw0KPiBpbmRl
eCAzMGZkYmRiOTM0MWUuLjM4YTZhNDljMWIyYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BhdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYXQuYw0KPiBA
QCAtMTAzLDcgKzEwMyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcGF0X3RhYmxlX2VudHJ5
DQo+IHhlbHBnX3BhdF90YWJsZVtdID0gew0KPiAgICoNCj4gICAqIE5vdGU6IFRoZXJlIGlzIGFu
IGltcGxpY2l0IGFzc3VtcHRpb24gaW4gdGhlIGRyaXZlciB0aGF0IGNvbXByZXNzaW9uIGFuZA0K
PiAgICogY29oXzF3YXkrIGFyZSBtdXR1YWxseSBleGNsdXNpdmUuIElmIHRoaXMgaXMgZXZlciBu
b3QgdHJ1ZSB0aGVuIHVzZXJwdHINCj4gLSAqIGFuZCBpbXBvcnRlZCBkbWEtYnVmIGZyb20gZXh0
ZXJuYWwgZGV2aWNlIHdpbGwgaGF2ZSB1bmNsZWFyZWQgY2NzIHN0YXRlLg0KPiArICogYW5kIGlt
cG9ydGVkIGRtYS1idWYgZnJvbSBleHRlcm5hbCBkZXZpY2Ugd2lsbCBoYXZlIHVuY2xlYXJlZCBj
Y3Mgc3RhdGUuDQo+IFNlZQ0KPiArICogYWxzbyB4ZV9ib19uZWVkc19jY3NfcGFnZXMoKS4NCj4g
ICAqLw0KPiAgI2RlZmluZSBYRTJfUEFUKG5vX3Byb21vdGUsIGNvbXBfZW4sIGwzY2xvcywgbDNf
cG9saWN5LCBsNF9wb2xpY3ksDQo+IF9fY29oX21vZGUpIFwNCj4gIAl7IFwNCj4gLS0NCj4gMi40
OS4wDQoNCg==
