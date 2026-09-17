Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F5FC982D1
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 13:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F7D10E510;
	Thu, 17 Sep 2026 13:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fljaREMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2556610E510
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789652439; x=1821188439;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=70xK0cGcbPmzgfzYFnBJyNH33ddwPPODCrwJDcqDdDI=;
 b=fljaREMmK4NpadBsomBIG6TIK0G6oAntU0o/GXAbrq09Etx2wQI++gMz
 voUV+1wKv2i6HjcJ7Vx8UKYum3UPgt+YSbxFecP2kUL4V2Fv6Wr+t8T2H
 09oaRwOJKv+aQA+xV8cb1AO3nPcjZtxUEA+Iq5yqrG3y3wUIsvMYiLnuP
 X7FT7IFGFWHtkL3vyp89jjOVpeXogQSjFYV0JOeCInpRf9An7jawBI24E
 wJbsIzdylMWr8yUhycT2mBky5W46MHOxXtKyqxOpqTft03XRkPaJtkxYn
 8Cg6cmefVtrWsQpG5/m9DZAmON3bQQcWK/8CMo6o0dW8d9d9AQHDPc1Cb g==;
X-CSE-ConnectionGUID: FVjWtQ0BRQSkCCwwRnk1cw==
X-CSE-MsgGUID: 5aQMVKZlS86eFc2jtZkJDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="584928"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="584928"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:40:38 -0700
X-CSE-ConnectionGUID: wOeFVI8cR7SP0oW0LZlhFQ==
X-CSE-MsgGUID: VMQjwKLmRoS2HbiPkflXXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269521936"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:40:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 06:40:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 06:40:37 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 06:40:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nD4P2pswcsGaYrRYK7ukppzmOAHO5O8yNiGhurII6+reAg1ANDIdeXVfGutxKsz1euk/qqhAtlFw7s5w3HvsmNq+F0A2GC+lPT6sn7KWMcb7viHNDZJkLIXyidHr8a1YLprznD94VW0a8Eivx77vjRr0UCXXn1eOHHEn9yHtcwUMJPYg40qD8ZDHprMP0hn+bjLG2vhmTuBkVQRtGyZcR2bybzNAmm2MlpTf7L7PyW6+6tZaG//jmPuEpx7Nh+8RAhCntGmgFWggrVXVQwbppNe2+Ix6mVfeVn6NkGdkXOOL0Ck/nqBmW6rHoUNhD+j4vcxjHfE5LG8xbs7jUQfUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5jsg/yeXnwL4gbEXyuNma/Ecfe/goBVDvy+oIXxnPk=;
 b=dwTldHQAAincXuIJ3hRJ688BpYOjmOWHtgnkqGSeFKb+gUvW1gOrhy0454xMBK2rxH1iV6oWwzqgj2/XoX/YLjZiLrn3Qg5CMpnZ6BIzOYY+D/KjWpEGHfi8pgMhYrRNnywI4l9E8MMq+zB/ZLy5xGRFe0UG3iCNLCwOWrtOsDnUBJtC2K7Mxws2CglgdY3SxPyAnNp2wKH5QkuJiuJsAbxHJQB7HEp+Vcfk8H+3GKIzMTPWFq/msk3Ana6PmzryNL2bMcsetRCBdPASI9S7YLf6n6tQg7IJ8j0yPQzTGjiQ9UsW4tYJPEnMlLRaCFnecxeeE+VahCvqNng4iRSwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 by SAWPR11MB9572.namprd11.prod.outlook.com (2603:10b6:806:4e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 13:40:34 +0000
Received: from MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86]) by MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 13:40:34 +0000
Date: Thu, 17 Sep 2026 15:40:30 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tests: Add kunit tests for KLV decoders
Message-ID: <aqvpAd9VJTY7_PB6@nostramo>
References: <20260916215827.13488-1-michal.wajdeczko@intel.com>
 <20260916215827.13488-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916215827.13488-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIVP296CA0123.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::19) To MN6PR11MB8148.namprd11.prod.outlook.com
 (2603:10b6:208:472::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8148:EE_|SAWPR11MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 88117c18-f226-4154-0e98-08df14c13fbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gYaZp+xGaN+34OoEnDzE1+5Yc+H+WAPE/7KbdUryitll0Eh4cu0I9xyvW5pQ4ySixSyxSFek3C0846ogeCEBzS7RkE4YkChMlQm4JxppXLYYrKceKIyIa35JN2o1K8c5Dgvs6if8xsR90Z8VA8aDoNVk5dyjAw94UyJHm4aIYnPPNCARZrnAFnkQlGTaeM3XZirrvB3XOo+4e8j/XwPxgi04ltfnxNsRczuEgSFlTFfl9ovV7jjByWL5pjLsW/9pI4+PtWRUcDMlHHa7V3KJfCXoscV+Rc9She3vxQMv5fRaTru6TcIKY7fEfY69zSEnFCeyb1mK1iozy+eyuyiaSqMw9cHLrgANUEbN1/KgcJUn93TclcyXKY1JkIvH9Zka+7ikNSoBDU2g/Du2Ko4u6W2iMeeFvXgTmuSQm0zWvYcUoR5TIedaePgUyB2RPTSpomfmRNd8mXYsJdbA8T5WjpgM7csBzo+ATYUlfvxiSUTw+gxcsG9KOUymGQn7ZT1JLrTibubV1fmUrDAdPO1a8HDARDTzZghlCfse1qjGI1bENenSh1kFkdrbYa9It6IqcOfxH+lGT6IawMfzTEOOTPBOntusgTo+FWQKQmNxNBumBbL5KZab2mYK5ieqCBAOVeqdxXwcCoE4N/xmUiNQKWXCJcBHQzLf9FexgZk+jWo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8148.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkhBemxjMDlJNHB6QXVYOTVxTnhsSFhhVEIzZ3h1VzhrL1ZOWkk5WnYvdG1P?=
 =?utf-8?B?azlYZ1pqZlhhR3FjelVYMEpNWkpkMDhlMnBPTnJLUnZMQkRTY0l6bzIwUFZy?=
 =?utf-8?B?M2tKZ3dyOUQxejVRQ2pqNmRJQWZXRTN5SC9PN3RLMDlsVFp6MzlVSmJkc1hQ?=
 =?utf-8?B?NHRvTXQrOXgzTGxzQlNKUG16NEhPdUdwTzhVdklIZ3Bwdmk2cWhGcGFkMThq?=
 =?utf-8?B?MmtGVDlDWC9SZWpKQ0Q1WnhqcUxxNU9TRFRjQ2ZCa1Jrc2VFU1JXRkJ0eFdw?=
 =?utf-8?B?YTVxb0NCdkh1ZndZUDBtVDlveEo0UGV3NDczMmNndFdvalFQY3BWWW5ERjBK?=
 =?utf-8?B?N3JRM2VpQ0drK3FwTjYvMGVkQ3BreTlLRWVMQ09vaXUwM3FxL094N0JMaUpD?=
 =?utf-8?B?NDBRNnVoMlFBRG40ditDcEQ0eVhtUm1LcFNxUmdhWDU5anFtcUZ3N1lKYmVP?=
 =?utf-8?B?NERLUzlQMWpMNUFMaWkvVnkwUDFRb0xLRVZ6N28rcGNKR3NDeFVGZzJna0p3?=
 =?utf-8?B?SUVsRWRCMTZmZ04wSVJVcEo5ckRER3I1QWp3eTFWdGtVeVJrSGoraVBvc3pW?=
 =?utf-8?B?ZFpvUUo5MjArd0x3Z0RzbWxWWWE4aFhhSVJxdnJ6ZzBIb1ByTGNhbXB1T1k0?=
 =?utf-8?B?T2dObGZoNk5GRjVRM3ZPSU5nMUpmVUxKN0JWZHErUlp2U0FjS21lWURPNE5D?=
 =?utf-8?B?Z3J4YTEzSGVoYzMxUVNrOGttbFU0OWtaendpbmdBMmFQR2JoVGdTSlNTcTRo?=
 =?utf-8?B?QXkxcHBUOVBNNEhaVjRnZURwRHVCTUhnQVJ1SmFaK1RqUEp2SExhODNsMGFt?=
 =?utf-8?B?Z0F5Yzh0NVZobGl6cFpZT0oyV0VLV2k5bU9sQnZsUHhhS0JQZVNWcTBWMitB?=
 =?utf-8?B?Y0prRkJRcHNiUzBhVG9hTzFYUStNdjNVV1NhTEhCMmMyRnRRZkxuVWZheG56?=
 =?utf-8?B?b3dlWk03eTdvRUkzNzNWMFd0N2dRMHVNaS81czB5akhaekIwSHpmaXROcyta?=
 =?utf-8?B?N3NLRW5QWHZHQ0kzUXRheXM2eDVEVDV0T3lYSldhMlMzQzZhOE5PUGk5NzJ6?=
 =?utf-8?B?RUtscVpGdVpnYi9qUy96alJjUkpmRklyRkRaVTZDSk1RcEZDekhObTFxajhO?=
 =?utf-8?B?WTVIN1V1MnRCSGsvNzdaSzJsSG5nTWY3UjJqcW9HZG5tZFZaa3NLTzNKK0Na?=
 =?utf-8?B?RHdLRS8venV5M244bXFNQlNaS1hIVHVVakZDUXc5RkxRYVhCcHlrb1pvUm9K?=
 =?utf-8?B?SlFIalFZaXZvSUpkdDZZSUNIUjhacTVMTWRPWTZaYzZiQzFEdkdFMjB3UmVD?=
 =?utf-8?B?L0lBanNrQW5mNHB4S25qWEtPemxjMzhsQVdEQWxnamZNTGpTSXd1QS9odUNz?=
 =?utf-8?B?L2RqMFo3YzVkMzl0TXBYdXF6UTYxUi8wUGtCcDVWZUl4NlVVL29wSGtOdlNN?=
 =?utf-8?B?SHM1YmdBTGROU2lFMlRFQk9iSnNBd2RBV1NQakc1SkI2Qnlxa3FvUjlxbTJl?=
 =?utf-8?B?ZmZIQzhaR2N0SHFpaXlqcVk2QVBNeCtKemJmenV2L1Zmc01wc05Na1hYNVhL?=
 =?utf-8?B?ak8rQVI5dXpCazY3MnY1SFlhOW5TVVhNaXlUYmZSdmExbGMxN29qSFE0MkpN?=
 =?utf-8?B?SGQ0aW9lNkhpSUFzbjBzKytUNTRpWDcrVWFRZnJQSW5rczdSTEdFM3lEeFdz?=
 =?utf-8?B?ZUE1SXA0L0E2VmlvTTM2am1FYkd3a2VKeS9hdkdLSytFYTQ2MHQ3QkZjOXNa?=
 =?utf-8?B?MlBhZTl0RTRUUkcvUXMrS09tK0wxN1ZsSFY2VzZxNEFlRHh4U2w0L3VoTlo0?=
 =?utf-8?B?TTBCNVhjb0Z4NER0VDV5V0c0T0Z4QU9xNjZraXlkR3J0bEhsZWhobWp0QzB1?=
 =?utf-8?B?WmxPZndDb0VGa3U3dFc3RFI3SGRIZjVIMzRrSUJkaFRIVG1Hb01EOG56Nm1n?=
 =?utf-8?B?elV0SUdvVDB4SUlJTWRQVmhSc3Q2UTloUE9WNUlkNDBSUVRsNm14bU1DRkgw?=
 =?utf-8?B?eXhFTE1aU3A2N3ArNHVxT01MVzgyNFN0YklSc0kzRG83S1krT0VWbmhQK2tw?=
 =?utf-8?B?Y3U3ai8zanFzVlhtTlpzN1k3TlNwOElTWVdXTldKREtubmxaTG9paS9QWHNw?=
 =?utf-8?B?ZlRMaytXam92UG1ZZ2pyL1VmRVZvaU9BWUlOdWxrcHJDMWdMV0hyaUNSVXhQ?=
 =?utf-8?B?aXNHMlhnQWR5ZkVqdWRDTUFxem95N3pmMUVsSnBQZGdrM29SRnZFbkd2Vy9C?=
 =?utf-8?B?aXFyZnhzNndPZWI3YUsvdWUyT3FmWkVVc3dTU3h0V1AxRUVWWDkvc3VrM2hi?=
 =?utf-8?B?N2RUeWxkL2hPZTNaSTNUNDhuNkdhT0E3OTlxYmM0b0luNC8wcjZSbWJMbFdk?=
 =?utf-8?Q?Xcy6GErVYQNIGL5M=3D?=
X-Exchange-RoutingPolicyChecked: orj+X0Oo9lG2gjogU7k9bOL1j3ZOZI4voXJzmBr5iuBsRSrH8E2TNZSXcYE2kTgv9tFuctgpLqG5u7GmcCj8ILwcQvAmYB4UtnMEK6BnB4YkxzWFFnefKCB/jHUY+/qIDlPSz1PkkLP/8cQu49BFN8Bl07B9KzshApsPsMoo+rC/CKUhIp6WHxNmR+oiu+EVfh2pA8s77zDZrjPMazcAayUGxKnBXc3ksNaOE1RH/or6UZMMrKZZPKI+HPIUJ1iq+KQq49joQZW02bku9wlTI+/nGQmpzB1MLVi1HDbmFB0ws4Pqq/Ut4VvJFwmWjt9COs+HoMxpYtto4M35GL26pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88117c18-f226-4154-0e98-08df14c13fbc
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8148.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 13:40:34.3512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbVjqk5xmUXCoCfoTy16JtGHjTa6+RtQ9y9daifhwBVRkuOg5A+kHzrAM4xA1RP8tj3CjTnwWmZ3YMQFAbE4ZeVwp6E1tCBKeiEEwa+HOi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9572
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

On Wed, Sep 16, 2026 at 11:58:26PM +0200, Michal Wajdeczko wrote:
> Make sure that recently added KLV helpers work as expected.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 303 ++++++++++++++++++
>  1 file changed, 303 insertions(+)
