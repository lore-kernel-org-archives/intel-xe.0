Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61003606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 23:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VzC52GmM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298E810F88A;
	Tue, 27 Oct 2026 23:05:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E486A10F88A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 23:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793142333; x=1824678333;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=PnRLVNlx4/cm0cwDaVxZDy/+WqZSHCs8nRMzWk0o4zo=;
 b=VzC52GmMYr1alSmZGD9ZWOfLOhew+hJRb7mEq4B93bDcQeB5pOG9n1OR
 UltvCssP8J843QK38T9G5XoZ6D6TfcwTzvDhP4j6uXtRGiKITakpUYF6z
 VIbGtiOWqs0uJ0bSs6B/2ekPcswSOvij3ZsK9TQOsR0jbZNhU/h1WGjf5
 kIxkL5Xe4uSnUYRsZovbWGBQvL1bBnAaqATY+diQZBoNiRlvOgi71/bY6
 GUoNC73cniBA/xUa0EG3BwAI0XRRQ5T0zs1YDvqP7zU5PWDxfa7uUdNLA
 wV+Ioo/AnyGI+K/E4czbIom1F/PQ0ouq+2SrIrBXbFzRQYbMkPeOwJXnf g==;
X-CSE-ConnectionGUID: vn93whtvQN6L2JMrMzZoeQ==
X-CSE-MsgGUID: IvYF70gqS5W2NbRE0LJFRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1754805"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1754805"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 16:05:24 -0700
X-CSE-ConnectionGUID: /sBBX7l9SmiOgp0lLIYMBw==
X-CSE-MsgGUID: b5fTbkqtRv+uG9ZIViw9Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4785456"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 16:05:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 16:05:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 16:05:22 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 16:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wROPxs+ieJ+blKNI1rnvFwkUH3G7iGo+Onk5nI9iTNpt5rD/iM2JoXH0+Zlm17mBHDJwaOF9WdtDTEjA/ZVoyj6iQwhsVqoF49H5mzaK3jzv/dtxGQI3MeTFqw5FLqYVPNRaa9IgdDVFLZmS1sGZbZOEHMeB/FV35BdHbs7PQ7tFW7FEYy6UwJ0aJ6pyyZ7E0ByAEz7NxFYLCt2W1mBDjqsKh46Zl+6YpaSpSfPb1dJEkgi1OBYUEPhoIXvtICk2/KVNpgVyOmCowJUbvCg76McRH4Rz+JunTYM4JNaBfWZJuMQUCCfyS20xLpiaGR8VoL32S2OKhpoCiEzAeob/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqDaPOwM+2xNU+GNb6PI2z4uAYO75AAnRAGCsVjel38=;
 b=P5WmUOz0d2Y0NxyCh0pBScq3pB1/QgzwCQUoJmT2VLc8XgTLVqyszj5HxjfMRA0vIC4Kh185kPtxqxhqUcNQOjxFckkZ8J7eHYcM2px7wr8Y/jBr8khtVC7GatljnZevPL3oozGcJBgZOyl4AzJhNqozu6+ZycGpl+fNP90g7PcbNp+QGLgyLqfIcDBIqssP9iMCk8MOeidkJ967nigIGxnHHIktzIJG7f87flJ9SEMBLyumX0Xjm6seGbDhDF1w6BdYXMMzrmNeorIPSXZB05jvH+An4NT55NCr0127Yg5sqyabL+g2Pu2zjjEOs79cMRNITr90t6i02OoeM+pumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by IA3PR11MB444632.namprd11.prod.outlook.com (2603:10b6:208:53e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 23:05:20 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 23:05:19 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Carl Zhang <Carl.Zhang@intel.com>, Filip Hazubski
 <filip.hazubski@intel.com>, =?utf-8?Q?Jos=C3=A9?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH v5 3/3] drm/xe: Add up-to-date implementation for
 Wa_14026539277
In-Reply-To: <8771556d-3f31-4cf8-82a6-feca9dca2d61@intel.com>
References: <20261027-wa_14026539277-v5-0-541941b1c032@intel.com>
 <20261027-wa_14026539277-v5-3-541941b1c032@intel.com>
 <8771556d-3f31-4cf8-82a6-feca9dca2d61@intel.com>
Date: Tue, 27 Oct 2026 20:05:14 -0300
Message-ID: <87fqxqkamt.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|IA3PR11MB444632:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c17fa1-4e73-4d35-6dd0-08df347ec541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|4143699003|11063799006|56012099006|261026121527099003|261021123027099003|261021121427099003|261021135927099003|261022075727099003|261009223027099003|261022105027099003|10067099003|260925021311599003|260925021911599003|260925022911599003|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: H1c4ovPtFFQrDkg/rXxztEZsuVD3txVio5GvTZRuccB0Jc3jUQLwhdliKPhG+x3rBUD65FOR6i8B8ij5YigG8gdfhHFteXahW7m2J0ob8mOHHjK+TcLzTd2D43uNVBguP+6p4lwcCLOt4nDuBLTmWIuyA7oe9REcScfzyfZJHsQX2itZoSk0VMLQbTCj3FLgG3rFdpTgGEu4jK6zGWhi5u/7OYbDNhIITLSSFpobgE59DFYi91THcCQSAD+Le1m/tkVsSJ+882quxLZU4esDMISsVoPfk/dVwCc+PhxggwKw0CtcOlCADsvsb+fsv2u+r5/R1H0GgBNqKMXyu5ls4bDidXTJ/KFPKUz52enp682Et05mKs07tX3jLaUdK21WANCd9yukrv14fDmdDmXpdT4j0WqUY+NrRp4uKL9An0zhmon3ZBYAUXQ3R+XkslzvtjfMf8xIWomPXlZxmVk5KmHba4oxW6VcSOa8z7eS+5c4fu11h+e0o7cyrBYji80jnloxIJgBm4dXR47LqtTCsJl8rOy+vNQLP6K4qR4hPyYXVHBzzv+yM6hNfmUn68OA52TQKMt205DfMiuECH2/KevqUH1741sMSeFXALGFv7j3pLUumyJ4SZNEI1rCJKPDFcD2p0I7ERyeUgvKc+9rY5Is8Td/Lvby2bq9RgcE6tU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022075727099003)(261009223027099003)(261022105027099003)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(22082099003)(18002099003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZldGpaN0pFZ2tyMmVCcTBabTcwQWtyZ1lSSzYwMEVGTi96MC9SVlBDRVZq?=
 =?utf-8?B?UHQ3ekVhQnpiZUt0RTJhSU9kbVIzKzhDeDltLzlOQU5nZUc0Ymk4R2JvQ2VF?=
 =?utf-8?B?aDZCcUFTYlRUYi9PZVJLWHlScTdJTFNjNVZscHJmNDZvVXBIUnM4OS9mZ1c1?=
 =?utf-8?B?S0FrSzk3b2lGR28ycFBrTUxCaVdMeUxnejRtRmdVckUzbVBRb2UxbXc0SGpK?=
 =?utf-8?B?VExDOEI3RWJVZmxGR1ZieUdxcmV5TTVON1VGVG9IVmRjM2UzY2tTNUptbVBJ?=
 =?utf-8?B?RmJyQ2FPR0tvekQrWllhbnlYSDVlUW84WitObXRva1NwQzRMLyt3MzJ3NlRU?=
 =?utf-8?B?a09McjlmcUtSTVJsbWpOSkNvRUpobzlwcVJoZmQ1ODkzNUlIbnlDaE8xTWZk?=
 =?utf-8?B?bVlOK09DbXk2RWpLcmVLTXF6WnhEQ1Y5ZEZ3ZXNNenRVZldXYmxYUWRUT1JP?=
 =?utf-8?B?MFl3WkJhVnk1MlgyejlCZzdtTW5iU2NYVTRISi9LUnFWdFZBWmd5NkJEVlUr?=
 =?utf-8?B?QTZXQXBKUWNKamFtaUNkTEc0ZTJXQnZ4TDB4ZzAvUjd6dTBwY3dtSnRJMnJq?=
 =?utf-8?B?Rzl3RmxpZWFPTFJzTE0xZUV6RFN6V0FqbmtZL1FwMjA0Mm5MM2hjNytwaUZv?=
 =?utf-8?B?RVFHTWpnNnNJUVV5Tk1NaHo5RWNaMGdBV2k3N0RYeStvQkV5bDQvL2pzOXhs?=
 =?utf-8?B?U3FyNDA5MUNuWGpYZWhsUkF3SDIwcFhTUEVWRzlFUElub0l3MTNUMDJwVnF6?=
 =?utf-8?B?ajVwaVZmSmNDc0IrYmZnNHlHaUZEUFFTM1dITS9NTmhhKzJvWjR6WFRtQWFp?=
 =?utf-8?B?MTIzT0NCOXltaldrczFZS0JnaHJsa0FwZU5pMTN2SGR1TEhIQk96WXFTYjds?=
 =?utf-8?B?ZDdIdmphS3FtVjFYUE82ajgyelBuM1RkMW9odzB5NGZvcWZFTWZaVUhWRksw?=
 =?utf-8?B?bnR6dU9xbGJRMVV0VHJWR1U2dmErblpyU3p0SEZVWHQzbFgzQzRuMDEwcVZU?=
 =?utf-8?B?TnVhVHlCS0NsMjkwb1A4MlJuK0d0a0R6ZE9xM3VxaUtUUktSaitBYW5hU29q?=
 =?utf-8?B?VHI3RU1hVTdFQ2pYaEpwMWIxYkNJSXVtWE1wclBjUzQ5V2JzazRxYVE0Ymwr?=
 =?utf-8?B?YWk3WjU5cWhSZmt2NXVOWTk5aUJUMW5GM0NENzljdzF2N2dWR2swTEJMVXZm?=
 =?utf-8?B?blNSZlRqT3o5Qm5TcHpIN0QzbTRpK05rbUtSeHlsRDJib0lSdkg5Qk9HUXlU?=
 =?utf-8?B?Yk1KMzB1L24vNG5IV1lHWmYxQlM1VkJCTTBMVk1idS9ReVBUVEdEQzNRYzU0?=
 =?utf-8?B?M01tR2pBVGIzZDljaW55ckpYcGdSdk9qeTlZSUkzaDJFTHFTUFZNQ2pYTTBu?=
 =?utf-8?B?RUtBaG45K2F5U2k4TjFhQVN2dUIvWVR5NVFPVHVzdDZSMnlTMDN1bmFueWxx?=
 =?utf-8?B?MzltQ0RQN2NzTXRjdUNiZzZlVDRETjFraEhJZUxsdmFQSnJNNElHVVlqR2RQ?=
 =?utf-8?B?dHZ6SXVXVkk5RWRFUE10cFpQbkJxUlZjTVNGU2dBV1NiUngyTndzOE1WMi9L?=
 =?utf-8?B?ZFNCMHpLczZBd0ZrYkZoVlVBeWt5bThiek5leTl3T0ZCNElCSWpLS1dZaXNZ?=
 =?utf-8?B?QmJqblBodjRkRVN6OCs5S1AyYXF2Q2V3VEI3enlFbGZGNnlDZ1FWenBMMDlC?=
 =?utf-8?B?aktBNmdWTXFQM2dEbFV5MXVLK04xNDN3ZVU5OVptdEFSMnMwZDViZUJPQWVh?=
 =?utf-8?B?ZmgzVFFJOGd4SnovekROY0ZsSHFZb0RWRjJKRlpTVDNvUERlaVM4dHV4UE9Z?=
 =?utf-8?B?bWNpOHYzdU9sMDhscTZZdUtZRnBkOWtSRVpYckVINXA0MWtDczlWbEFpZWp3?=
 =?utf-8?B?ai9WT0xsUS84VVpNcXBoZEEvc0JpL1RIbktsL1AzY00xM1hYbEV2M0IvT3lJ?=
 =?utf-8?B?Ti9mc3loZ3FGekN4bllSbnhGQkQvZDdGNUlpMEl3emdxc2Y5Y2lBbGhkQWJw?=
 =?utf-8?B?SVNVOHhydnRnc24rZ2ZuK1JNTDdlMlEyR0NnWlNqSlMwSkRHcCtYd05wbSsv?=
 =?utf-8?B?N1RJUTA3WVJ6eitOamJNUHVJQzZ2T2ZEbVFRVHpoWnVwK3N1MVRMdHd1K25M?=
 =?utf-8?B?QWFIbktsOXRPS0VqakN4L0VkN1FxdndpRlA3dEMwWHV3WlJrM2o3Q1pNVVUz?=
 =?utf-8?B?UEh0TjVYOWtNSFhURlRkdGpkaHRFVHlzM0RiaUFlTjdNVks2V3VaMXlrdHdP?=
 =?utf-8?B?RnRxTUFoSXNlT2ZuZlRBY3NLa0U1SEsvNkVhMmVWRkswSGU3NmRMRVd1L2d3?=
 =?utf-8?B?QWNqSFlBL1RHb2hYRUJpNmRpRUdKdW1zblE1U3ZQbFEzSWhONGRXdz09?=
X-Exchange-RoutingPolicyChecked: qcoj/ZIk2iLK3PuaOcuj2m2ujHZ14yD0U4VkQH1qV/tU/iFB4n47qVWRlXuNtZD0dvUVUwQCnZivQ69+na3Q1xLBfjQUoIUkaaLtsLY4ojl4nA1xDTE/IJs9NhWgYg+a3q8I7nfzHoxV4lB01/MILr9UCE9VfLupbddE68QEiNWht0cv42aLYMT+8wqAVeKiA0N0Es5KNbjxknJyvMlpfcgkmehzJhJg2siF16HtsflI7ruqHnx+Z55Hzkya/y3bFlsEbvJfk3M15+clgbYhF9Be+/IrQBjyIkxQjBnJYaUIy51C2us+V6dcYZ8Kw3RLY5RWRw7OwbPRpvQuOPAH/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c17fa1-4e73-4d35-6dd0-08df347ec541
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 23:05:19.6795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTjjdCOJMUVkUzOWfOZOtzd9ZycI4pEzR8A06KF7zlReQKjxzVz5+4LE7Se9P+/Mgkb+rjLk07a+9Hipc7LIAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB444632
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Matthew Auld <matthew.auld@intel.com> writes:

> On 27/10/2026 14:27, Gustavo Sousa wrote:
>> Wa_14026539277 is a temporary workaround that targets only A*
>> steppings of graphics version 35.10 and requires that we avoid using
>> 2-way coherency for device-cacheable memory accesses.  For
>> driver-internal usage, we convert those configurations to be
>> device-uncached and 1-way-coherent; on the UAPI side, we reject
>> VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to
>> userspace to select the alternative option that is most appropriate to
>> their usage.
>>=20
>> v2:
>>    - Add missing bits to convert the PAT value to device-uncacheable in
>>      wa_14026539277_fixup_pat_value(). (Sashiko)
>>    - Also validate the PAT index in the DRM_XE_VM_MADVISE
>>      ioctl. (Sashiko)
>>    - Match against the graphics IP instead of the platform.
>> v3:
>>    - Handle any 2-way-coherent PAT index irrespective of L3 cache
>>      policy, because L3 UC can be promoted to cached by MOCS. (Matt)
>> v4:
>>    - Validate coherency mode for MADVISE in the VMA-independent
>>      madvise_args_are_sane() instead of
>>      check_pat_args_are_sane(). (Sashiko)
>>=20
>> Acked-by: Carl Zhang <Carl.Zhang@intel.com>
>> Acked-by: Filip Hazubski <filip.hazubski@intel.com>
>> Acked-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v3
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Pushed to drm-xe-next. Thanks Matt for the review and Carl, Jos=C3=A9 and
Filip for the acks!

--
Gustavo Sousa

>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c     | 16 ++++++----
>>   drivers/gpu/drm/xe/xe_pat.c        | 64 ++++++++++++++++++++++++++++++=
++++----
>>   drivers/gpu/drm/xe/xe_pat.h        | 10 ++++++
>>   drivers/gpu/drm/xe/xe_vm.c         |  5 +++
>>   drivers/gpu/drm/xe/xe_vm_madvise.c |  4 +++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>>   6 files changed, 88 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devi=
ce.c
>> index 4e9598791279..d3bb42e4d0d7 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -774,14 +774,18 @@ static void override_has_cached_pt(struct xe_devic=
e *xe)
>>   	struct xe_gt *gt;
>>   	u8 id;
>>  =20
>> -	/*
>> -	 * Wa_16029380221: The affected GT will always use non-coherent
>> -	 * access to page tables, so we must do uncached writes from the
>> -	 * CPU.
>> -	 */
>> -	for_each_gt(gt, xe, id)
>> +	for_each_gt(gt, xe, id) {
>> +		/*
>> +		 * Wa_16029380221: The affected GT will always use
>> +		 * non-coherent access to page tables, so we must do
>> +		 * uncached writes from the CPU.
>> +		 */
>>   		if (XE_GT_WA(gt, 16029380221))
>>   			xe->info.has_cached_pt =3D false;
>> +
>> +		if (XE_GT_WA(gt, 14026539277))
>> +			xe->info.has_cached_pt =3D false;
>> +	}
>>   }
>>  =20
>>   static int probe_has_flat_ccs(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 53c5f4030bf8..5938fef22579 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -324,6 +324,40 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe=
, u16 pat_index)
>>   	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
>>   }
>>  =20
>> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index=
)
>> +{
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +	bool has_wa =3D false;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		if (XE_GT_WA(gt, 14026539277)) {
>> +			has_wa =3D true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * Disallow 2-way coherency for any L3 cache policy because
>> +	 * XE_L3_POLICY_UC could still be promoted to a cached policy
>> +	 * by MOCS indices.
>> +	 */
>> +	return has_wa && xe_pat_index_get_coh_mode(xe, pat_index) =3D=3D XE_CO=
H_2WAY;
>> +}
>> +
>> +static u32 wa_14026539277_fixup_pat_value(struct xe_gt *gt, u32 value)
>> +{
>> +	if (XE_GT_WA(gt, 14026539277)) {
>> +		if (REG_FIELD_GET(XE2_COH_MODE, value) =3D=3D XE_COH_2WAY) {
>> +			value &=3D ~(XE2_L3_POLICY | XE2_COH_MODE);
>> +			value |=3D REG_FIELD_PREP(XE2_L3_POLICY, XE_L3_POLICY_UC) |
>> +				 REG_FIELD_PREP(XE2_COH_MODE, XE_COH_1WAY);
>> +		}
>> +	}
>> +
>> +	return value;
>> +}
>> +
>>   static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe =3D gt_to_xe(gt);
>> @@ -384,18 +418,22 @@ static void program_pat_mcr(struct xe_gt *gt, cons=
t struct xe_pat_table_entry ta
>>  =20
>>   	for (int i =3D 0; i < n_entries; i++) {
>>   		struct xe_reg_mcr reg_mcr =3D XE_REG_MCR(_PAT_INDEX(i));
>> +		u32 pat =3D wa_14026539277_fixup_pat_value(gt, table[i].value);
>>  =20
>> -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
>> +		xe_gt_mcr_multicast_write(gt, reg_mcr, pat);
>>   	}
>>  =20
>>   	if (xe->pat.pat_ats)
>> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), xe->pat.pat_ats->=
value);
>> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS),
>> +					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));
>>  =20
>>   	if (pta_entry)
>> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value)=
;
>> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA),
>> +					  wa_14026539277_fixup_pat_value(gt, pta_entry->value));
>>  =20
>>   	if (tr_pta_entry)
>> -		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), tr_pta_entry->=
value);
>> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA),
>> +					  wa_14026539277_fixup_pat_value(gt, tr_pta_entry->value));
>>   }
>>  =20
>>   static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>> @@ -545,13 +583,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_p=
rinter *p)
>>   	drm_printf(p, "PAT table: (* =3D reserved entry)\n");
>>  =20
>>   	for (i =3D 0; i < xe->pat.n_entries; i++) {
>> +		bool rsvd =3D !xe->pat.table[i].valid ||
>> +			    xe_pat_wa_14026539277_reserved(xe, i);
>> +
>>   		if (xe_gt_is_media_type(gt))
>>   			pat =3D xe_mmio_read32(&gt->mmio, XE_REG(_PAT_INDEX(i)));
>>   		else
>>   			pat =3D xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>>  =20
>>   		xe_pat_index_label(label, sizeof(label), i);
>> -		xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
>> +		xe->pat.ops->entry_dump(p, label, pat, rsvd);
>>   	}
>>  =20
>>   	/*
>> @@ -768,9 +809,14 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct =
drm_printer *p)
>>   	for (u32 i =3D 0; i < xe->pat.n_entries; i++) {
>>   		u32 pat =3D xe->pat.table[i].value;
>>  =20
>> +		pat =3D wa_14026539277_fixup_pat_value(gt, pat);
>> +
>>   		if (GRAPHICS_VER(xe) >=3D 20) {
>> +			bool rsvd =3D !xe->pat.table[i].valid ||
>> +				    xe_pat_wa_14026539277_reserved(xe, i);
>> +
>>   			xe_pat_index_label(label, sizeof(label), i);
>> -			xe->pat.ops->entry_dump(p, label, pat, !xe->pat.table[i].valid);
>> +			xe->pat.ops->entry_dump(p, label, pat, rsvd);
>>   		} else if (xe->info.platform =3D=3D XE_METEORLAKE) {
>>   			xelpg_pat_entry_dump(p, i, pat);
>>   		} else if (xe->info.platform =3D=3D XE_PVC) {
>> @@ -785,6 +831,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct d=
rm_printer *p)
>>   	if (pta_entry) {
>>   		u32 pat =3D pta_entry->value;
>>  =20
>> +		pat =3D wa_14026539277_fixup_pat_value(gt, pat);
>> +
>>   		drm_printf(p, "Page Table Access:\n");
>>   		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>>   	}
>> @@ -792,6 +840,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct d=
rm_printer *p)
>>   	if (tr_pta_entry) {
>>   		u32 pat =3D tr_pta_entry->value;
>>  =20
>> +		pat =3D wa_14026539277_fixup_pat_value(gt, pat);
>> +
>>   		drm_printf(p, "TRTT Page Table Access:\n");
>>   		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
>>   	}
>> @@ -799,6 +849,8 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct d=
rm_printer *p)
>>   	if (xe->pat.pat_ats) {
>>   		u32 pat =3D xe->pat.pat_ats->value;
>>  =20
>> +		pat =3D wa_14026539277_fixup_pat_value(gt, pat);
>> +
>>   		drm_printf(p, "PCIe ATS/PASID:\n");
>>   		xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 16beda6db97e..2ac6ddc66587 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -95,6 +95,16 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u=
16 pat_index);
>>    */
>>   u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
>>  =20
>> +/**
>> + * xe_pat_wa_14026539277_reserved - Is this PAT index reserved from
>> + * use due to Wa_14026539277?
>> + * @xe: xe device
>> + * @pat_index: The pat_index to query
>> + *
>> + * Return: a boolean indicating whether the PAT index is reserved or no=
t.
>> + */
>> +bool xe_pat_wa_14026539277_reserved(struct xe_device *xe, u16 pat_index=
);
>> +
>>   #define xe_cache_pat_idx(xe, cache_mode) ({					\
>>   	const struct xe_device *__xedev =3D (xe);					\
>>   	enum xe_cache_level __mode =3D (cache_mode);				\
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 86c3b4fd232f..823e264319a1 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3855,6 +3855,11 @@ static int vm_bind_ioctl_check_args(struct xe_dev=
ice *xe, struct xe_vm *vm,
>>   		coh_mode =3D xe_pat_index_get_coh_mode(xe, pat_index);
>>   		comp_en =3D xe_pat_index_get_comp_en(xe, pat_index);
>>  =20
>> +		if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index))) =
{
>> +			err =3D -EINVAL;
>> +			goto free_bind_ops;
>> +		}
>> +
>>   		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
>>   		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
>>   		    XE_IOCTL_DBG(xe, obj && (is_null || is_cpu_addr_mirror)) ||
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_=
vm_madvise.c
>> index 875c00563f91..31245c6c96d4 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -407,6 +407,10 @@ static bool madvise_args_are_sane(struct xe_device =
*xe, const struct drm_xe_madv
>>  =20
>>   		if (XE_IOCTL_DBG(xe, args->pat_index.reserved))
>>   			return false;
>> +
>> +		if (XE_IOCTL_DBG(xe, xe_pat_wa_14026539277_reserved(xe, pat_index)))
>> +			return false;
>> +
>>   		break;
>>   	}
>>   	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_=
wa_oob.rules
>> index 63d695f40214..96132c6e3340 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -72,6 +72,7 @@
>>   		GRAPHICS_VERSION(3511)
>>   16029897822	MEDIA_VERSION(3500)
>>   		GRAPHICS_VERSION(3510)
>> +14026539277	GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)
>>   14027054324	GRAPHICS_VERSION(3511)
>>   14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_=
sriov_vf)
>>   		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
>>=20
