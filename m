Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF5CD6E64
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0CE10FB21;
	Wed,  3 Jun 2026 10:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khcQacfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292D710FB21
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780480870; x=1812016870;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=l37mj9AScGRw17WTVyo04JDUp249h9CmAxTlUfwIoTs=;
 b=khcQacfRQdIswRbWUWuBGMv3g3S/cF1cjLFP7dIDFJwsYb0NMXlTnRhh
 b7QYdrjLUYveEkeSFY4rUZ6p3TVKYMAnTxgCtOwBPyBNzXCayvOrTlI/N
 bYISuX1xtZgSTfHLjg30eNVId09kUhggGL2bqNndYefadFXs8V84tggL1
 60CnHGVPNkFEzMwbzYkAyRNeaMR/fnmyCT1YLIOgjBjZWoIFfc7tKk/wg
 ocHB2JFmXpoJ7dKa4bLYx/m3xYY4NcNJOcXgvLciELKpuGMf8mbAG0S7v
 GrGn7lF51oIYpC7Y4dNpHZqme0oGi3A5g59F5nInTLu/snJ9BcNDtedl5 w==;
X-CSE-ConnectionGUID: UYj+ROKER8+gBe20dB8Nng==
X-CSE-MsgGUID: t7dVJItPTyuQfEWS3uXsXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81342728"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81342728"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:01:09 -0700
X-CSE-ConnectionGUID: AY6Pjq8PQHegdOvZHzY06A==
X-CSE-MsgGUID: N7IeGvVFTLCfo9ugp14qnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="268068333"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:01:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:01:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 03:01:08 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCzEviD0IeZ5pFbvxQABDyJLRliqkdeFunw/ooWJBFmncIZYGndkDVYlVBFkp0X/3IVCA9sFKW9b70BUKLSvZGlv2FMkHLE0EefvC2d5Dy0KufhwTWXL0XoLdAOK6aI8bBmFfJP4jkKZ2J1hHpEJ7wMsGo4PmzBe9ahgD5FuGFO9WefFAikyUAZXjz4F5q6qtkNcccaLI1MYaT5Kdu94ypYYdj1Nq/MLYIEBCQZ641Tb+RS/gW3P1YmUG/ZkRh0Ep3rSuCy2VJ7oGJSzxtA1IPqx2rqoaVIn3NRLdROTSR2+OtoWbVwKjJtqGzeLlLuwJyYTU75mlOCvXRNZflCHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnVcHsPoUk59qYxdFgfGLDFaSOtK1ElvrLjvttQKUmM=;
 b=fBsOqzzBFhjTZaYgaMiR2t1Q/s19XVkGfXnDX0lZL0AhtNHKJByLVtQr3TWGk8LkOUdxbOf4LkMgBE8/73pJIKtVMJBbvXwBDwG6+ZgBqlFVgPeJoKbuWitK6QQkonZ/pNhKbmQjfB2DyOr3hqFnlwnxGvtMAmRtvIwB1RhGDLgTyYip6tpSqqS++tMBaR+r7O+XvSkIuRJqBbLygiYGXS2gXsBhrg4joEFXef1qknIyHH7OOm5m87JkRSbbsDj53rxqDZRQuyLX8onbvKRYs1uUKCNI7ZUz+KcuzqaEVL9wDMx+6V42w20aiycLAcL2uJkb9PtJDTuWR3bmte3oQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SAWPR11MB9548.namprd11.prod.outlook.com (2603:10b6:806:4e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 10:00:57 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:00:57 +0000
Date: Wed, 3 Jun 2026 15:30:49 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Message-ID: <ah_7UUYOcU1oPKbZ@bvivekan-mob1>
References: <20260602043231.3119355-1-tilak.tirumalesh.tangudu@intel.com>
 <ah_eYJpPX1_YKtHf@bvivekan-mob1>
 <SA3PR11MB762511821674A50F092E74F8C8132@SA3PR11MB7625.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <SA3PR11MB762511821674A50F092E74F8C8132@SA3PR11MB7625.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::16) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SAWPR11MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: b15a03d4-0249-474c-9446-08dec15701b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: s2420iJB4mTvokJ3CO4pMrGjx3eJpoEsRa8SRFOVYvEd7M2lPdb0BGgmVv3lpVBQOGBX/58EM7X1ozvZ1RJBRgJOUxOUTPmb/07oyamfzfoWPnVWgZLIkhISbD9GX8oziOhTsbgNyydoiGvT+6zKDv6clC2cWAcSoDlTw7fXLeldRJNMIN0VR2eEy6Pf8WZsjEtVSzvBXesw/yEZfXXWm9sob41wQns60hcs3JMLRijzjnU15S3eaDJ0s0y2lrShh0GMPrZNxdQSTd6d9Xkrmp8wqIgulzCHMMP8HBELyTFP5df48NYHSNW+ZzhYd8how0afHXa8RZ/uCLHAYkBhkvm9MIXiDNm9Yp3oRPXXFXI0mFxP5FQ+lE/pOniHg+E6IZnJ6I+UiEKuwczknVq1+nnboMwE7Hr9o8Ncg8FjWAEVtI2bkJArT3oXeqhqg3Bf5mPPYxGyf/zQh9gc5rB+Mf3taTd3QhFRebMQ5K5ahZ/pHsW9TriJfhuBgvybHeLtO1xkrzBX01LUmbGRyBhcb4YXd/dFnGmrYhoj7WmDLM3rkIFeoyd1YCTUmZX4rsRu1wYYoc5DsksLnuz9MWekgtECT28VMOF2rAQ3rJ9M2f6Hj3iKLBdNAZxsRfxw0TcWFJi0oHk/3xvJRxN+KadokxetfjorjEKt1JSGmtoaJVxCk+rlirkUDKJyPeqpRFXS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STVZL0NjK3VGZG0wWnVLMk8rdkp0c2lxcFRRODc0RjJIVi83cUVmUFJveXI0?=
 =?utf-8?B?eXhOQ002T29aSytWeG9iNm9ueitzalMycjlhTDkzNHMyQUF1UDlVRlVsaXZ2?=
 =?utf-8?B?V0hCNWdkVHRKMlZzbUoxTmplWUl4TWpEVXduTE9JcHROeHRvRWVDTzNPMVVj?=
 =?utf-8?B?N251aHR4YXpNS2hHZVRoYkpVeXFURXZJODc4RVRJNkJha0gxK2xSZXUwWDBr?=
 =?utf-8?B?TEUvTm9aSGl4Q0RsdVdmSkhMY0h4OHlVenNTQjBWKy9tQ2lzVStKRnZza0d6?=
 =?utf-8?B?K3pDYnNiZk1ZdnlHQlcwY2tGZnVkQVNzZ0NIb3g2WXcxbWRkRlJON0lRcWNx?=
 =?utf-8?B?R3ZFb09TL2NQczRuQzdRWmcwNSsxenRPUVl3SVpMMlpVNGNacUU0VmdpbjFo?=
 =?utf-8?B?YU9KbDRQOVFncXVJVDRzNHZma3F2cDVBNkRZTUFqVnRGbnVBWStJcExrN05Q?=
 =?utf-8?B?UlFvZVpyZ2pudWV0blRXbEV3THYrNWhvTnlqQ2lHaEEzUGM4N1lPb0xuWGNP?=
 =?utf-8?B?Nm42NkdiTG1CY3hhZGxjcTFaMTlEellhV1hhc25Wc3RtV092c0tBNnVFVE1j?=
 =?utf-8?B?ZWdOMjl6VmI5amhHa0U3UHJ3MEtyd3VxUWdSWllzVFBWZVc0cDBOZW9SWVlS?=
 =?utf-8?B?ejNldjQxSmp3S2QrR2xWSzRaU0dYdkpqTDdLMlh3aDZZemswUVAxVzJqcFVr?=
 =?utf-8?B?NXE5S0NJaGZua2s0RXRMQXBwV1l5RndoMGtPY3JKSWR6WERhc2hxKzlkR2Nm?=
 =?utf-8?B?MUpBTjVicDdrNG41M3RSR2ZiN1l6N2ZrOEs0V1FrOXB0RUNBbkxRZjZQMUpR?=
 =?utf-8?B?OHhzQUtsQ0wzVjBmRlJSaEY2MkU5ZXViOW1NWW55YXdHV3RZYisyRFNwYmlu?=
 =?utf-8?B?M05La2YwMWZFS2pVQ3h5ajdJZS9sMVBjOEJmNHU1eEFJcUV0ZXFMOHEydFAy?=
 =?utf-8?B?Ny9UZ3lYbTBuSkp4a2EwbGdJN1dJRXp1aERDb01qaE5PaVR2UzQreFVCaXpw?=
 =?utf-8?B?TGlNWjFhVC8zSEp5aEk0UHJFcU56bGI2TkJYM0o1TVlvejJURVJFWnA3Y2dh?=
 =?utf-8?B?dFRINUJhdmE3MFN6anlFWVZlOGNPLzFEblRkaGtwMGhrYXBkd3E3UjhUMGN4?=
 =?utf-8?B?aXBlYnZmRWlycEkxb2U5eEt5QXprbVVMMERRZUJJcXBsUlZiWEdBNWcrVHJq?=
 =?utf-8?B?N3JzaHZUQ2RxM2VXZXNMUCtjb0hmblN0TW03eStnNFVTUWliTks1Q21jMnJQ?=
 =?utf-8?B?WDl3cE9RYmNDNmQwbytyRFQ3Ty9MMUxNTlJYQThLREg0YUNtZTJhNjJQNTRV?=
 =?utf-8?B?ZTBTSFRxcElXKzBFUDEyWnNISWxpdzE3NEo2UHdMREtsWVRzRGIxTDFRbWxj?=
 =?utf-8?B?THJhN1VUUzQ2OUNscU51L0ZHTGpFWHVSTDZiaDBVT3laZ294WndJdStOaUtw?=
 =?utf-8?B?QUVwb05HaVZxUU8wZVJHSGs0Wi85U1JsS2tVckRoT3V5cDNsL0gxMHpYdTkr?=
 =?utf-8?B?WnBQTlppZEFoVE51OExHMkMycmRYdjFkakM0ZjZ5bEc4cDZTa2xBZXRpRGdQ?=
 =?utf-8?B?UmhpdGlCdG8rUmQyQU5SWmtidXdkOUFhT3ZTMjFVUC9sdmR5aWVWVFJneENQ?=
 =?utf-8?B?WGl0ZkRRKzlGd01xUUpmSEc3dnI0b1YxbmsyTHJCWWZXMzhqdEVYaVZQM25i?=
 =?utf-8?B?NGhGUXFRK0QrcXFyTXRhS3VLQnBxaWZhUi9CaUpVUjZwd0tGcUZ1MlgreTB3?=
 =?utf-8?B?VjR6eEJKYUpIMGJBV1EwSjI5QzJvcFgvbzBNblhBSHhkbmoxbUFDV0tEU25U?=
 =?utf-8?B?RFdJVGJsdUV4L3Backx4eUJEWDN5RHJoUXpGUGdYdnZ0SVNobmQrbFVMbzhJ?=
 =?utf-8?B?OXVhT09oVUVKWTM2djQwOEJXbENkaGU2cGwvdkhKTTI3QUVDYVZCZktBTWl4?=
 =?utf-8?B?NUt3RjY4OEVYK2drblczVTIwdWNEbTRGZzI2S3diK2tBQjR1QWFRK1ZPem92?=
 =?utf-8?B?UXZKb0ZiL3FzOVdJK29yUzRHTnVjdkE0RXZnZEFZVW10SVRvYU05RjVDaXNt?=
 =?utf-8?B?K3NhL2Fyc1l3emxWaXJYTVlCL25uQUhlellOdVZnMysyUnFQbkF4TTc3alAx?=
 =?utf-8?B?am1WUnN4ZmtNenJqcUxoekRGUTVXdkpoK1FwbWs3Qk5paXVWRmFmTjlvaFkw?=
 =?utf-8?B?UVJBTndJeFF3ODh6SFNGdXYxbFRROGNXL1RmTndjdDROVThmdm55Rm1USVRi?=
 =?utf-8?B?ZUtwS0svRXVxU3RKelhmWHR6djdLQklHMDl1Q0o2THJSUktuMXhnNTJJVnhL?=
 =?utf-8?B?dGZiVTJIU0VPcVdPeVVDQnl2ZkZNeGlLdWt6cXA2VlNHWHMwVldWcTBUZ2p3?=
 =?utf-8?Q?iS66215tA1sCLQnVju7aPfRUQLvrPgswixm/F?=
X-Exchange-RoutingPolicyChecked: AKlaKh4V+87A5xhuZIZo84q5rNFMyEfMZTWkTfhNmw458Y0PCLC44Ba9Q7f+sAbFc1Tocn2VH308Y1eyB7ZzIhd2WJ9ALSCEXRHD5sljy9EJxS7KkBC2qzXs0ywmInoD6J1RIHvjSm0L1gHp5SSiw/D5EHP1gDw3dxVQ75XV8LZu/EBONo52sBgldHsygcrlnZcKs0NHMwh41aNF9AAqqiMYiifbRbcy4iMaaqWK9DA4UbNLq+tuFLpOIDvJBzmSe4guvSrIhbcAmVoZBt3dYUwhE/iJtg/+ziOz53GetPWsVPwGG7qGg3PE9KLrTiV/OkN86nLZpUYwbm5yKMhzuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b15a03d4-0249-474c-9446-08dec15701b7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:00:57.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0VgxGTVPg45cUGMQy3yuAupKGGZP8+hJ29CZK6XQoG1anI52sjCfzXYNP06NWkxWmTwblkjtX2SAd/iCmPQj+/v90sQBDKLB5PLWCoIHTk0hY3ZOxWTbhOUkAebz0YG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9548
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

On 03.06.2026 13:54, Tangudu, Tilak Tirumalesh wrote:
> 
> 
> -----Original Message-----
> From: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com> 
> Sent: 03 June 2026 13:27
> To: Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
> 
> On 02.06.2026 10:02, tilak.tirumalesh.tangudu@intel.com wrote:
> > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > 
> > Avoid IDLEDLY timer programming lessthan 5 micro secs.
> > Apply wa_14025941587 to Graphics Versions 20.01 to 35.11 and Media 
> > Versions 13.01 to 35.03
> > 
> > v2: Use xe_rtp_match_not_sriov_vf, move to local variable
> >     Remove warn and other knits            - Matt R
> > 
> > v3: Add verbose comment - Tejas
> > 
> > v4: Restore IDLE_DLY register on engine reset.
> >     Add it to GUC save-restore list. -Vivek
> > 
> > v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
> > 
> > Signed-off-by: Tangudu Tilak Tirumalesh 
> > <tilak.tirumalesh.tangudu@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
> >  drivers/gpu/drm/xe/xe_hw_engine.c  | 26 +++++++++++++++++++++++---  
> > drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
> >  3 files changed, 26 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
> > b/drivers/gpu/drm/xe/xe_guc_ads.c index c98454545a85..2080e0e650eb 
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -768,7 +768,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> >  		}
> >  	}
> >  
> > -	if (XE_GT_WA(hwe->gt, 16023105232))
> > +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 
> > +14025941587))
> >  		guc_mmio_regset_write_one(ads, regset_map,
> >  					  RING_IDLEDLY(hwe->mmio_base),
> >  					  count++);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 8c66ff6f3d3c..dd8eec098bdf 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -584,8 +584,12 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >  	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
> >  	u32 maxcnt_units_ns = 640;
> >  	bool inhibit_switch = 0;
> > +	bool wa_applied = false;
> > +
> > +	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
> > +	    XE_GT_WA(gt, 14025941587)) {
> > +		u32 mincnt_idledly_ns = 5000;
> >  
> > -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
> >  		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >  		maxcnt = xe_mmio_read32(&gt->mmio, 
> > RING_PWRCTX_MAXCNT(hwe->mmio_base));
> >  
> > @@ -595,8 +599,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >  		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
> >  		maxcnt *= maxcnt_units_ns;
> >  
> > -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> > -			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
> > +		/* Wa_14025941587: applied prior to Wa_16023105232,
> > +		 * as the latter has higher priority, although conflict
> > +		 * is not expected.
> > +		 */
> > +		if (XE_GT_WA(gt, 14025941587) &&
> > +		    idledly < mincnt_idledly_ns) {
> > +			idledly = mincnt_idledly_ns;
> > +			wa_applied = true;
> 
> >If there would be a platform for which 14025941587 applies but not 16023105232, then the >above condition would silently clear the inhibit_switch (bit 31 of IDLEDLY register) though >14025941587 doesn't explicitly asks for clearing it.
> >But idle delay timeout won't apply when inhibit_switch bit is set.
> >The WARN statement below for WA 16023105232, is helping to alert us when we are clearing >inhibit_switch bit though the WA is not asking for it explicitly.
> 
> >Therefore I would suggest we add a similar WARN statement checking for idledly value and >inhibit_switch even for 14025941587.
> Thanks for the review on this, warn on inhibit_switch override is sufficient right?
> warn on Idledly value condition is not needed right ? as we intend to override as part of WA.

Yes, checking only for inhibit_switch is enough in the WARN.

Regards,
Bala

> > +		}
> > +
> > +		if (XE_GT_WA(gt, 16023105232) &&
> > +		    (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch))) {
> > +			idledly = (maxcnt - 1);
> > +			wa_applied = true;
> 
> Regards,
> Bala
> 
> > +		}
> > +
> > +		if (wa_applied) {
> > +			idledly = DIV_ROUND_CLOSEST((idledly * 1000),
> >  						    idledly_units_ps);
> >  			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index f8a185103b80..5d5041168fa8 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -65,3 +65,5 @@
> >  
> >  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> >  		GRAPHICS_VERSION_RANGE(2004, 3005)
> > +14025941587    GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
> > +	       MEDIA_VERSION_RANGE(1301, 3503), 
> > +FUNC(xe_rtp_match_not_sriov_vf)
> > --
> > 2.46.0
> > 
