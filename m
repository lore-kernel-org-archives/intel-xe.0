Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140A5C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 16:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE49010E0D0;
	Fri,  2 May 2025 16:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtjpfZUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFDA10E0D0
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746202573; x=1777738573;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8zDYhtianRDnsLjJDgMuJeHEDrfOiy2/y+l2VJJD6zI=;
 b=mtjpfZUoYm14690nA27yZundMxz7JJfbYrJNpgtdrFAdUoigAcHfek/x
 KjgYp7+kG2+hdCRagx/0VNpdGQVHaCHYRUdlCkLKsGnvs5y5DSi3//6eZ
 hh5nOWMtD/qXDTXO08pZNDl1+wH9l9N/RPI0rgnTBfTMAZTPd82w9ADkL
 eQH6TGxuE0r3dcp+zD/AcrKEDm/eFAPp5PqToFPeA39nxrNCQ9yK/I7wE
 07Je3lDj33Q7s9JhLjrukk3msl93mornJBZTzvp6hGEhepkMa7IxCY9TX
 3VknvGsG92fs1jOaZwcc1e42WqsISsBe7kE0w8Dco5mwZCXIW9T2bWWGn Q==;
X-CSE-ConnectionGUID: XvNNCzcSSLyr3dlt3YWMew==
X-CSE-MsgGUID: WXN2uHJ+Q427dTO7W8yjgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47776310"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="47776310"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:16:09 -0700
X-CSE-ConnectionGUID: dhv6Zyv6RlOb7Y6KdyOvgw==
X-CSE-MsgGUID: JONkGMj4QDaWTWD6xLYLgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="135625849"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:16:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 09:16:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 09:16:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 09:16:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKJD+8rZ/YRk0aqFC73egHRqpzUAM3xh4vAMkdrUtB63h3vDwTv5OTkruEfJaFR17Z2Yc2anDrouMOiPiwlkkh31KWib8OLuEMcPebqUKLQrk7hyHJkAOypeWNm6y8Fh0Yazm/NJIcGlq/fDYP8V3mXsS2pACCUi81gV7MYnhWoA32eoLN7w3TlqiHOmAuyNmJ94t03s2Nl79TzrzVgWci44DWeshZqhlVtESG3f83nS1KawRJHEIw8YM9Nf/ngI6DQUswaKx9/xdZbVv2sF1N8z2iANSUTsGlBjDQ/WVNKGHtBYIi2g6p598HVjpk8RP/y9HKSNu1+kL2VXgONDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abPBXyDFetEqJYxnC9k7dHwqntAvthC2LwJrFbe/2XA=;
 b=AQUFyA890o0LOFdJGoGfxlcO1Oe87fjKXU27A9pJe4FCiLmYqGwoTxJxE9SltDj7c5kC6L3ti3gmoFgxiaifjpxzXsoKWzXi7KfRS8FNJCA8RtqbVxq+A2vajEHW5AQXNHQv6Rx8lu0AOvrKu9/Foac7OCpcP+AeRe15BdRMuW6rncj3Tx+8r1H4P/neapcesN/NLQ2FA/YHkF37f9GnMQ/76n+c2KWrwv+sc8dnbHNyiQTeuC7OOToyoPr1jtFg/FpWAQJTDPhTdOlsVGVnrzD8SyKJVnX8+Oji5g7wHCRO0KGGPfxkxdX9WUK7jGZziO04gglCZD6N0e2/W2N7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6902.namprd11.prod.outlook.com (2603:10b6:510:229::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 16:16:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Fri, 2 May 2025
 16:16:05 +0000
Date: Fri, 2 May 2025 11:16:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, 
 "Tauro, Riana" <riana.tauro@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Message-ID: <sh6cpgadw6gk2jufhaoqpmz3mteegl2gnfpqxg7zgwmbm6vu76@kksxyzna74yc>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
 <aA9UlvQfo5-6-CtB@black.fi.intel.com> <aA_ebBh6mxsEJi1w@intel.com>
 <aA_gYVCQe1JEY_xB@intel.com> <aBBl4ukmZJ0b72dN@black.fi.intel.com>
 <8b0ca59b5c5ed0cf5fb3efb844afa84fe3c39570.camel@intel.com>
 <aBLaJAEj5tKG_Asp@black.fi.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBLaJAEj5tKG_Asp@black.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 95699157-9959-4581-c2bd-08dd8994a37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BkWc/HG7AmVe6AK4gldoh8e+0hQ0UN5XLe8u0pkkSgCZCCyM3ZzDOoyffA?=
 =?iso-8859-1?Q?PwnVEJtSm/aYGSHSVf0Spm3atJuKGuDHm3z0wumWTJxTjDWfNRQgcTZ/Be?=
 =?iso-8859-1?Q?BAPKg/TbqKtXsvxApdRIYOB2yIusZ/MYzsp0mgBKRJ5bW2FXF2Op96JELe?=
 =?iso-8859-1?Q?CbE65+aq9erFfRiqmcKaKNlkrSKPpo3pWOT4RaL0lB1hMOndhoLC35IZ0V?=
 =?iso-8859-1?Q?OMOd2BI0T3nvTd+7nErHBionbGS/BxKuX3fKtDXPr95xNZJxleX9GImXtG?=
 =?iso-8859-1?Q?PxQkF0QqzV3bk09zfv3hUErEssjWcz6c9bkemX6CvIX1hW3FhdfZF1fGRX?=
 =?iso-8859-1?Q?LqiJ775frSeIGVewXsZQxI7p3vn3qF2YXQulEihZzpMe5fLu0ybv/Ln/kP?=
 =?iso-8859-1?Q?5Y2dbFZamNiM/BXmhG4lemvGiymQZfupT90bRwjz/kTgqkgV2rkyxUkkk1?=
 =?iso-8859-1?Q?FVeTdfzioNWBCvxNheomnekuRQLa2AP4dR5gd25HjTcaVEclsEgqZjDxZh?=
 =?iso-8859-1?Q?Uwi4+oMqTEjg4XWgjkpY8JsDcAUlSH1cgpox69mbrgTDmK0BSOB0t2UnIm?=
 =?iso-8859-1?Q?zOwwUMA+77Gwsfh2Fc+HRaa4ZWvCM/1TT7A+scv/9EmZ9iIUysE0erYH25?=
 =?iso-8859-1?Q?IireCJ9uCy0hUeTj5/uYqbynwwjow4tTKGyIqCe5Q4aqJKgt8qFd/f0df5?=
 =?iso-8859-1?Q?WLgL+fky5rOEMx9eBPUwfo2dI2t68P1GSt1/0ABikLOW1/E4Kvqx7eJupa?=
 =?iso-8859-1?Q?14vDBB06J+MV392+lqXFSuZnS+8NQMdCWu9F7dIRseK2eoNQq4rTe5cvqn?=
 =?iso-8859-1?Q?7NoZW1EnwCsPx/ugEAhdP6EUO+19IqGKP82TmwB0nhSfL+F7Gnp2/dbNkm?=
 =?iso-8859-1?Q?GwjiWuKetVtPRzQIwvzGMRYJmqRXpl4GLQyl55ULO3O6QxP84dxfRtdV8a?=
 =?iso-8859-1?Q?XEGkp49OhwePInSwGeP9cdG9rXsge04SYPCmlaQ/e18sulAFLhTshwyfNL?=
 =?iso-8859-1?Q?yAqI75iMmD7GxwNwCPWIXvevIBGEBLzjPuT1J1wscoyhc0yPAhH4/y/ht+?=
 =?iso-8859-1?Q?tx5riBOE7wsEmzuDMCRv/5e4Qx2K3b7mNkvjmJnWRXWNPLwf+f4XJCVUDt?=
 =?iso-8859-1?Q?NwPdwbNcjjDj/shJ77cAf3+ZIRe/NsECgoZVssmOWlTS3WSBlNE4lQcilo?=
 =?iso-8859-1?Q?oV4DY6X34K8npwdMC4hPZWFjj9hcMnxNNKBOpcz85rWSeGxwnBD5QaTDsr?=
 =?iso-8859-1?Q?GYLMWnx6020sfnKbdbvsIw0sOTmc4Ev3+gLSXFYl0Y0i+AXqFx6SEFx55I?=
 =?iso-8859-1?Q?CU0RyIfZDWzenLpDnFjbrJhuf6Q5DO/mUUVaUlGrKKDLxBJSbwKdboYjvm?=
 =?iso-8859-1?Q?mSmoFli2zQptYKt++3WfoSByKD2VJaMtkDchASKXQelx3WoZOCBQyWlGFE?=
 =?iso-8859-1?Q?EQ0uhRxSoPyU8xsfs+zlW7YhZEfohBbWPVrj8EBYa0IFKISAzEA5STPfM3?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZXWENNlNdWnUBpD4kZELj4KIHnpOzLCRm3cjU2thULYpn1pZU2ohlNoZNV?=
 =?iso-8859-1?Q?5TDDT9jdAw71tv4vSN59xRECdY/A6pmMcoGKLDlxEnSKH38pQXF8oqi3zw?=
 =?iso-8859-1?Q?OmIP2qLNGU6OOUPw8yaCL6eG4a5ZmzCnNGQMg8ueVG1aWPSF51QvknypFJ?=
 =?iso-8859-1?Q?NADdDRmzAk5b17XQs90mycacVuT4fK9H/a7aztQ9+eyX2xGMiem6ImqsSN?=
 =?iso-8859-1?Q?DgVWulcAzNXtqLVCdObEPnfEbqGyrtgy8MYLPPVq/oVMg3fa9cCsTMSear?=
 =?iso-8859-1?Q?6G25m1ezldYbjvq2kdlVQCB9vkYrfAOsV5YuZxw2mV3gGzXYffbFMTYQ60?=
 =?iso-8859-1?Q?U0sgQ4BUodpBGU9CT8c7JQZZJUApnpTpZHtXAh0bIocPmas4KV6kV6hAlH?=
 =?iso-8859-1?Q?hvB3EXtDofwMppjnvPZUJu/LqegnwHYsDyz2XtILyIYHsNq/q+aaYzgels?=
 =?iso-8859-1?Q?+NgcXkRqnVpw1rnQkR1CKpDMQg941mHJDoEij68Ya+ppb3OZJIXEFl162N?=
 =?iso-8859-1?Q?sfFe2AOFeTh6y1TaklNvWr+TBsftARHGSzqlV31cGLao6Vvyg7BRilAIYN?=
 =?iso-8859-1?Q?Z3ePSRv76fW9lP1MYltiI+F9UNP+BV4I4rrfrgyy+Z3u0dUs4aBxLbVVcv?=
 =?iso-8859-1?Q?rEzpDUpv80VtFsb8hijf3RANRwXR2qxVfjaeEVfiKosf6XFVSgmqsFbtbD?=
 =?iso-8859-1?Q?OraEnWDYIMNSIFUd9RGWRKxgNl6Ao7EszMkDWS1QKjTNx5MXdyxHvtJNMt?=
 =?iso-8859-1?Q?xRyOZ6I3lvcq28w90UFWH+YPB3NyB/5cfl4VSV5BXwvzaDmpc4qd6sXvMw?=
 =?iso-8859-1?Q?za+jNFcMifahMHfmJhlx5tOoLPX3drsVulF6yTxkOdAQ6+X/BdE+kmWUlI?=
 =?iso-8859-1?Q?dDPZDCZfrsK3dPlJnRT/Jqq3ogbObPoH+RXrcXjCYlsM8JYjtaY/JAC4nI?=
 =?iso-8859-1?Q?d5z0NFPJ9v3w8CtylMh2AsVSnVBEfeid5Vk34ttNrTF8jo85mQRGIRhLUQ?=
 =?iso-8859-1?Q?7p3UCMJrpKSQKqPD2EJkHpPNQllHSJNICAfSSrP4Y41av7Q8WdIsZ+ojrs?=
 =?iso-8859-1?Q?+J43qERmME2cS6u/ACo5w3V9cfwuqqZaDiyITMJRt9Z6wE1v/NLUrgjCxQ?=
 =?iso-8859-1?Q?kV/bborjH539dCuIuW9vdVtXPEs8NoKJUiAYYZz33thZjAMUe7bcv9tZMv?=
 =?iso-8859-1?Q?bS3s7P9nDR/wP5uMO/saxxPjHK9B+3989HGkOW1Iml+Tf02npy19o1brE7?=
 =?iso-8859-1?Q?GYHZAdQq3HpZN8KI3kpsVZZgxNDqIiXVEQm1Vdmrh7HlSu6fPqg8XxaCnr?=
 =?iso-8859-1?Q?33ogF3fzHVisx4HhG3s6oHHncJPZXEHTUcyJQTwQJ7CQeNZ88H2K1VWAbR?=
 =?iso-8859-1?Q?gj3DA6W0VVcowlY+wu0i9LNFlec+xcQpyQ7aUJ3bMFgKqD+uY2ZnxQWmnG?=
 =?iso-8859-1?Q?1c+eHo+XGpyF9k4OYsCMldPUIWWfu4ji5E9+8sP4bcy+nM9k8tRYsQTHkw?=
 =?iso-8859-1?Q?+jBhlEBoiZ9fIG2uIxsSpP87G2uM6I/V6uNdU/n0zmZF0h8u/tQohSJcuV?=
 =?iso-8859-1?Q?BMfOH4I6Guzr/IbxxMrIUmOFVkNI1Wpk5OCFIOO6BZ6UVsP+WThJDMB7+O?=
 =?iso-8859-1?Q?9iJkQBE/iswm/5pAwHokJ5/1jijxDrOSLPTwmW+P5JD4RO+s2DSV+0kg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95699157-9959-4581-c2bd-08dd8994a37c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:16:04.9418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SS4CSsp9ylgPE95yxH7ABRyJ6MuiduVRDNqE+tFuETIxy7NQgjf4qoyPfxugRQusAjBe4JePKQFHzn8t5XYxfOdZyKhYYRtAsB1ORYLPLr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6902
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

On Thu, May 01, 2025 at 05:19:16AM +0300, Raag Jadav wrote:
>On Thu, May 01, 2025 at 01:10:49AM +0530, Vivi, Rodrigo wrote:
>> On Tue, 2025-04-29 at 08:38 +0300, Raag Jadav wrote:
>> > On Mon, Apr 28, 2025 at 04:09:05PM -0400, Rodrigo Vivi wrote:
>> > > On Mon, Apr 28, 2025 at 04:00:44PM -0400, Rodrigo Vivi wrote:
>> > > > On Mon, Apr 28, 2025 at 01:12:38PM +0300, Raag Jadav wrote:
>> > > > > On Fri, Apr 25, 2025 at 07:36:23PM +0530, Raag Jadav wrote:
>> > > > > > This series exposes sysfs attributes for BMG PCIe Gen5
>> > > > > > downgrade and
>> > > > > > documents their usage.
>> > > > >
>> > > > > Anything I can do to move this forward?
>> > > >
>> > > > I almost push it here, but then I noticed that it is
>> > > > gen5_downgrade.
>> > > > Hadn't we agreed to follow what spec says so?
>> > > >
>> > > > "to then automatically persist the Gen4 downgrade flag in Flash"
>> > > > "Write Gen4 Downgrade bit to MRC Flash File"
>> > > >
>> > > > == Applying  PCIe Gen4 Downgrade ==
>> > > >
>> > > > Although I see that there are some mentions calling "Gen5
>> > > > downgrade", "Gen4 downgrade" seems to be the most used term in
>> > > > the specs, specially when calling bits and
>> > > > sections names...
>> >
>> > Which is what I followed until we had a change of preference over gen
>> > definition.
>> > https://lore.kernel.org/intel-xe/34b33d3135fc24302db2764ce86a641e7c49054f.camel@intel.com/
>> >
>> > > Because of the inconsistencies and our back and forth here and to
>> > > get prepared
>> > > for future cases where we might need to downgrade from gen6 to
>> > > gen5, the current
>> > > Architecture recommendation is to simply go with
>> > >
>> > > so /sys/bus/pci/devices/<bdf>/pcie_gen_downgrade_{status,capable}
>> >
>> > I really like Lucas' proposal, which is also consistent with similar
>> > existing
>> > attributes.
>> >
>> > /sys/bus/pci/devices/<bdf>/auto_link_downgrade_capable
>>
>> I'm sorry for the delay in the response, it took a while to get
>> confirmation. We can go with this one. or with the one you sent
>> already. Your call. Just let me know that I push the version you tell
>> and tell the architects to update the spec.
>
>I'm okay with either one. But since it was Lucas' idea, let's hear his
>thoughts.
>
>Lucas, can we move forward with auto_link_downgrade_capable?

yes, I'm ok with that.

Lucas De Marchi

>
>Raag
