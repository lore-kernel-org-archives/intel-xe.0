Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF28E99058
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 05:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C670F10E18C;
	Sat, 11 Apr 2026 05:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECZNXhm3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B0D10E18C
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 05:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775886492; x=1807422492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xv+Jo4ZUkcX+E5BSS53IiQNTfdctmhYmYUKMzIkYROQ=;
 b=ECZNXhm3Q8BNzew7lfEY1Mo1UDDv6uF9CfCiby1T/BaQqxTZB0CXEidy
 uVez7HVMCoBwhEC/BdBN/QHDViURp4Gi8iGie4+OXpSwXlKIqRRF9X4RR
 GgwBHGKAYXB+EMZtTXI++k8Omc0EvaqzyYPCv2k4frgEqhKrXNsA8ttJx
 iu1OvDPzrbT4uDkUuiBclMfZjRoSnpfR7ztF0eeh619Y42hTjjYXdSBRA
 cCSO7RiOOphi8lB5i5UnXfgFAOGCDZjbNR9vPhXxreXLcAsHk5IxQe5aC
 s/yFY6ujq0Dg8hnGhHtpTFHGTygDCC7Oll0IZ3QWztruYJB5kmaY9gVON Q==;
X-CSE-ConnectionGUID: R/BtDNkbTLSY1yNWHAgN+A==
X-CSE-MsgGUID: /xnB4/PzS4KirREmyuTd6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79489585"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="79489585"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 22:48:11 -0700
X-CSE-ConnectionGUID: WlI9rmipQZCZGTq+kvG4Mg==
X-CSE-MsgGUID: j8SBX+MfQD2B2I9+Rjnwgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="229171578"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 22:48:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 22:48:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 22:48:09 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 22:48:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fwua2Ab5p+I2onxe+SiKSdOgn7JqNYRVet5kCwe6/PZOZ7WPgVXHsY/9VVWmvCoLh+0SHolzrheiD0gcA+AiE3RPCGqDlT6NvvdKYGbgYmHkt2lkYhVjEz8bXEEFQnKKPHPLnvMfINF00+J3iRjrclTM3Em7PfpgTi37SvRzPR5CNJKQWV7YS448092n8JKYLRccqdjso5SJY9X5qx/VnP+M0GGQvmD9IzQjqbbkkcIDBWB+/v8xYfKkjBI9dVnikLeWZ6xvT7S/LasjGomIAQrYon/5RW8kifTjME/NquWe6ngmB/hs6GpW9q32QWfSDvWyPFfqYjXAn/Cs8QTD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAP4Uq18mWjr42BBAx4VVH20X1UzND0gA3oUKWrDD9I=;
 b=guqjH4q2XB8hZGWIokTAPNwCrW3bDbJB688b4DXsXlebpPI+pso5L4pAVAfWFz5K1+DrQsJZr+dNHtvoD6xngvI1sE0Da71Y0MnUcPltXqB1yd5/etDJ1iaQQpDmqF82uo8VjyFlty4sLTm+jzETgcZaXZ6OT3SNoINsHSxFJ57lP1/bAD50dqAYJPRMGRAA62R7A7D8xq6baorYRr8VxTGMvnp0L4kt/q7uBrRFkarRmQYFTKeyy9gps6PXVYcjdlROBQh7iq2mekNTOSGV9AR08Rj+KW/HvwSuOQj4s/bV4o9guQg0KA84utm0lx0lFqQKFZCcrkaAcQyPe23Vsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Sat, 11 Apr
 2026 05:48:01 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9791.032; Sat, 11 Apr 2026
 05:48:00 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH v2 4/4] drm/xe: Fix type and parameter name mismatches in
 kernel-doc references
Thread-Topic: [PATCH v2 4/4] drm/xe: Fix type and parameter name mismatches in
 kernel-doc references
Thread-Index: AQHcxgTuk6IXSUi8o02lCrNqs9KwJLXZXolQ
Date: Sat, 11 Apr 2026 05:48:00 +0000
Message-ID: <SA1PR11MB88397146474A1480881FABE4AA262@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260406203122.3392365-1-shuicheng.lin@intel.com>
 <20260406203122.3392365-5-shuicheng.lin@intel.com>
In-Reply-To: <20260406203122.3392365-5-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SJ0PR11MB4896:EE_
x-ms-office365-filtering-correlation-id: c8d3a384-1090-4edf-9473-08de978de42c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: W75gIhRfUm70GzODfBrW/rzFj1oSfunsqw0+FdCwHyUMZVuLnzQaxHfJDBTfroDQ1no/kO+u0PHmajUQtI07u5vt7tlsck+ofAToBU4HfTE8SQGiztBN28ThKO1DC00iNLQN7M6HqubPmfYlNVe4y3+KeCxsvWvQgwUL4FgbgPr0idvBwf70Vs0qF290e6jFMsmpR994XpNAgXc3F+6EG47mvfUtSRSaJFPuVbjf6yJgD4ET8W6f/VuLPE4O84tNsuLbfle4dIUshTfZYk8I/sfRBrp1MfkxP+XnsB8GWHi/by70PZXOT50qk0BdZK+zQDTBgxgGG4Xf9y1iD8Pb5WGaZ7v6O9lgZmtsaEMOxoqRbFwgoTwjmTxYoc/rF32tbj5XRfHrV1OVO2D6pY8ShoJhLvJKDzwuWPfQQvTY0YmZiBxgiNI91MOQI1lS4t3rVe9ont1jRWiSG+daKUUF7LHW6ozLeNjxiMay7M7k++HVrvsT1wXZ1/tKasAQWu7RH8rEgKH2XDnkXC6hxqsZZE5cUr+IQi3Rj5NjGw4nX2liNyL/VlKK58WZ90hv6z01uyv5DPMzMDgqJsubwuOUkfGIvI24YG8YypQbpypramHe92ah0YSsareUxxt7F/W74BroSIape9RDi72zhhVrqf8NqcnP6O3EKzC7NJy1QrsS76PiwmA7jLeSQPTmlOX+CWrUn3JvIvBoodvivSZ1I+frnSObD1UIIDqVXDu3dWbK3hLUKx9nliVvrXzOaBZuWfWo/K6bAWEIomvo+P7bcOf79sLfhhF/4V0SKlNzscM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PHWKVvLM4QWy7H6W3d6L+HJFSbxeXknbg5JB/aWR3zbw2gnRVUbkDbMHk/J6?=
 =?us-ascii?Q?tfnw99SsIHyccVsQfdVTBtNfVn59treC14YH2oIqWJMNbSWqCX1q4hQ54TML?=
 =?us-ascii?Q?wSQcto7OGLOKtE5POoqwiwbgE55y767G8s9Z9yuMxPZdZ8pt55GgYKEzL5PU?=
 =?us-ascii?Q?9ETS+VYIojWul+GgGIq24xSZcdsnLs4yZgLNcVfX6R8NieYGOTTlCD+cMH+L?=
 =?us-ascii?Q?M2RqdLlw2f2MXZx3+STPnxaMD5C3cIr8w5IzA4c4/K7xvr1MknU2wp519PP3?=
 =?us-ascii?Q?pW4AlbqH4T3wZRcJ7DD7b7ijuhxKz1D64mRcHYN9vWQwrTPXdWEVVACl0/jI?=
 =?us-ascii?Q?lI/boxwEtcW/SGbm4UF2KlMYGqWG+0haFD5AX95vmAljTncr7HyFMVfW8biD?=
 =?us-ascii?Q?udWxpEveYwCXSCgQLsN5AhinhA1BTETSC3XwvodQ5ALgg6Llrk//FgAYb5pf?=
 =?us-ascii?Q?I8wHl3OEJpCQt0y0oAEVxbwoSYSA4+It7k0BzvwXl8/MFLZIFDLgDIqoqJ4j?=
 =?us-ascii?Q?YDrAQ3mG5du28H5+MB2p+M5pQDn9ckmeq/3iwg6ptu/qvjYfEWiHiOwxZJ/Q?=
 =?us-ascii?Q?YmskxDQ2JOIF4Ow/NY2e/42wrPUcThecAUp3RaRWdLiOmJUd6AZpx/N5zo+r?=
 =?us-ascii?Q?sCe/K5S9SQjpNxTust9CZWVcLPvVfgKsQTsTT/tWP9Yks8b03Kiif1iJY5Xf?=
 =?us-ascii?Q?7zA7/I2jS1ytAM0GjzZDmIUFygIYgtVXllirPoF4AuvcpH+YjNdVvnQP3aiD?=
 =?us-ascii?Q?W/ky6zq4d00YaLCRFmDUZfU7UIT0jTKU1n5Zxv4aSnLTdJqS+6HCbmrhCU4n?=
 =?us-ascii?Q?7oYLVaJgr8YPTXpZ0pclrOVHj8zONzPXVbqNJchD134N57KkZdn7HcE+CoUY?=
 =?us-ascii?Q?g2RWL1WTGDmyJ6c0yFaIKGQMsR+ajU1JrC3I2kqLICplcHFdrYAMv/7rkr6U?=
 =?us-ascii?Q?c6rpBmVquzWKgl9O7QAapy2IVJxeGV9hY7Eag4J/ofll8oYEfVAyZdEUMw3F?=
 =?us-ascii?Q?6U/uto6TNnJh8s24Qm4VNwRzTsYSeDXsRTvHnBmVEl+nkcdwHoCmhirSs8Ph?=
 =?us-ascii?Q?fiGHTMdczUk26ib1klIfU+E/T1GvnoRWoaam8MCe/ueSAigY9x1bD/PrSwPP?=
 =?us-ascii?Q?Ty0eJ86FREgn+b8dPJBaFlGkA2vqM7EWF1N0+Re5NuhA8vAsRFM9CURKi1+T?=
 =?us-ascii?Q?RFLxJU37dD5/nZfY4vmAiiPKATmiH9K2/KvFQ4mb3TWHQGpD5f+E3iXO6lq+?=
 =?us-ascii?Q?pKt3CA7/H+FYU6K1yjyEwr+EkDQkXwQjf3bzclAPtY0oA63YMQATPHwum5IS?=
 =?us-ascii?Q?NZIM3vlcygceS1R6IZ87v0CHtBphP7AJ0DZZ9OyRJ0QhV+2umn78Zkpz26fV?=
 =?us-ascii?Q?8AihsTrsQiBnmLEtbLL4PgJEwTdPsU9+iET6sAIwfBmaIkTQkNAGMW4jLQjs?=
 =?us-ascii?Q?HyEiCMG1hN0LK6dSlVgG8VSshJ5aD5nBOWy/JKZZdOSwhTqf3dlIjOlXs0RO?=
 =?us-ascii?Q?/gC36hoQnIOonSkerMJC/LaSo/muNqUzHPU8YR7LMRTj/WJCGR5q/+djt5r4?=
 =?us-ascii?Q?9Pwg9WimKYT1cN1eyUEbEOpkLC1Z/Ou58SFaN2ahsfcjHZDwsKIRF5TCWA1I?=
 =?us-ascii?Q?v9gcLxZU4QQyfHUExCXBppyuluc+rY3Q5Thjs1NMyKm5ofk/BPQ/9EeoPCBq?=
 =?us-ascii?Q?kXptn2cjK5mxz44YoCGekEYIdLZRJeL5eugEaEg8RjNUKTuExQ0BjKvRedab?=
 =?us-ascii?Q?Hj7wwNb2eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BwjYtvTxld7vZQ4F3xZuAsnO8lX0hyisFrtUz6zEdvA7K37tgwclB5mEf7CCqyt3LRayEk8eLWELqHe8XkSuXb8oi+7YW/KKa3WHFmlpFF9QCkI1gzmwJurYyjmQS1F5YeGM4bjyzsCdx2e5Y116i9kIDzuUMPq6JYd7zb0PvHmXoCZcp7s2zYpyLe3plC552ze0hU1qPt9ZyB+94zLRr4rTAfJrjJKFx/ccdHhQcg4G30Y2o2nt3SHNfS6vdKB4g4v/nyaPLgb94ZI47JnUvmgu0xRMqSPQTwhm1wfDDoLlxye1RmYnewsspvlrgumxZ096pQky8+GDbzdNZgw2mQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d3a384-1090-4edf-9473-08de978de42c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 05:48:00.7410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGa6MuYPM+O4yBvRiviELYi9KumywyKtE+GUD0noLxjOqqdxHtMTon3UK+cwIp5smhK3SY3B29JrrBP8s94hTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
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

On Monday, April 6, 2026 1:31 PM, Shuicheng Lin wrote:
> Fix kernel-doc references that point to wrong type or parameter names:
>=20
> - xe_guc_capture_types.h: register_data_type ->
>   capture_register_data_type to match actual enum name
> - xe_oa_types.h: enum @drm_xe_oa_format_type ->
>   enum drm_xe_oa_format_type (spurious '@' before type name)
> - xe_pt_walk.h: @sizes -> @shifts to match actual struct member,
>   @start -> @addr to match actual parameter name,
>   page.table. -> page table. (typo)
>=20
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_capture_types.h | 2 +-
>  drivers/gpu/drm/xe/xe_oa_types.h          | 2 +-
>  drivers/gpu/drm/xe/xe_pt_walk.h           | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/=
xe/xe_guc_capture_types.h
> index af7e21777b06..058a3f2eadce 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
> @@ -32,7 +32,7 @@ struct __guc_mmio_reg_descr {
>  	/**
>  	 * @data_type: data type of the register
>  	 * Could be 32 bit, low or hi dword of a 64 bit, see enum
> -	 * register_data_type
> +	 * capture_register_data_type
>  	 */
>  	enum capture_register_data_type data_type;
>  	/** @flags: Flags for the register */
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_=
types.h
> index 0c48c1e0c2c6..8906c3084b5f 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -67,7 +67,7 @@ struct xe_oa_format {
>  	u32 counter_select;
>  	/** @size: record size as written by HW (multiple of 64 byte cachelines=
) */
>  	int size;
> -	/** @type: of enum @drm_xe_oa_format_type */
> +	/** @type: of enum drm_xe_oa_format_type */
>  	int type;
>  	/** @header: 32 or 64 bit report headers */
>  	enum xe_oa_report_header header;
> diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_w=
alk.h
> index dcedfc9a28df..e91995fa703b 100644
> --- a/drivers/gpu/drm/xe/xe_pt_walk.h
> +++ b/drivers/gpu/drm/xe/xe_pt_walk.h
> @@ -34,7 +34,7 @@ struct xe_pt_walk {
>  	 * changed during the walk.
>  	 */
>  	const u64 *shifts;
> -	/** @max_level: Highest populated level in @sizes */
> +	/** @max_level: Highest populated level in @shifts */
>  	unsigned int max_level;
>  	/**
>  	 * @shared_pt_mode: Whether to skip all entries that are private
> @@ -49,7 +49,7 @@ struct xe_pt_walk {
>=20
>  /**
>   * typedef xe_pt_entry_fn - gpu page-table-walk callback-function
> - * @parent: The parent page.table.
> + * @parent: The parent page table.
>   * @offset: The offset (number of entries) into the page table.
>   * @level: The level of @parent.
>   * @addr: The virtual address.
> @@ -118,7 +118,7 @@ static inline bool xe_pt_covers(u64 addr, u64 end, un=
signed int level,
>   * @level: Page table level.
>   * @walk: Walk info.
>   *
> - * Return: The number of page table entries at this level between @start=
 and
> + * Return: The number of page table entries at this level between @addr =
and
>   * @end.
>   */
>  static inline pgoff_t
> --
> 2.43.0

