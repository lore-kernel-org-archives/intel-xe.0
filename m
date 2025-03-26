Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4213C28B30
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 04:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B31610E102;
	Wed, 26 Mar 2025 04:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ie3CkeI0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD49910E102
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 04:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742962218; x=1774498218;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mCpYBuvaYNZH2DlycKqtwaNkQkhSZrzBpH2XJzMvgNg=;
 b=Ie3CkeI0qIlb8OuTS/5Zy6G7fEt3wZXFe430vLXGld+UT2KbaKtUgvJp
 yrYtr6jq7mvqhF/sG8l86rlc0IlHVXYkuYgweZ2YtTDvAB7ILcPGIVNqG
 r+5ZuveLcbW2cF4yePV2uat3SbpGgBS9ndN0evcM51xoVBSvT3a8m/jGv
 abYc11fa9wN4WGz5k3QnKCY0CwMDn3zMPKkd2WurmDqCzzzc8T6P6aK64
 yfvXIu6jEbbk4oKXW4FumzZi6i+7e6yJJhyLBF5aBjjDr+jNhVvWYkVOy
 s530JhONYngPaeeS3SsHn9CYSAiTWBMi+Fyr8/YbhjJDTzhE4R8KtKP8G g==;
X-CSE-ConnectionGUID: vp2QmCQNS1KeiN79Og8TWg==
X-CSE-MsgGUID: 6qoHPIufRjCcQh1rHTxT+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="46971239"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="46971239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:10:16 -0700
X-CSE-ConnectionGUID: CqnWMdkmQ82E3+bDRibaWg==
X-CSE-MsgGUID: AVGKHkBGSTyNevZrJCmehg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="124564734"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:10:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 21:10:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 21:10:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 21:10:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhmbnkXJtnUTCEPSA9SY5bGJyE02S8iPWJgFvIt+rukhJTT+lY8WkUVMVmQmZT2aq1KOd5KeiPh2t/o5VfPsyVnoh32B0QTTn9QDmORuY2jYT4t608DfQQ60Rxo0y9Vmktu8tcHSesmkcEACwEVvzkmC2I8HZgi7C20AGKKSubITtwYGZwalvf9yLEf0EDiW/aNRgOBRRzsiY/xUoo9ymx6HN64bxobbn5H+4rGnS46QXzeKD0b5PSx21GPjDTBoDIUcQQfvze8zIwGyy2u5PnV5T8Cf5dM4JAv0FVjLmOpUR9rtglvW7bpeDIPcRmvvjH9MjBrDhx7NQ6EJbzRowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIdewM+0Nsd36YCGoQqL8VpywbV0YHuVPjvdyKXo1vc=;
 b=ZSrmDsM8Ju62WLnY18/0zQuSSdp0oNHBft/5VErDSKN6vgTZADBDlul0Cy8ZllvvvqbiHDyud07yqvt5XGGZk25XLhIKgQ+jCujB5JiKyfQTfQhDX+Kif4+KFsfzASTI0olfHRh3Ebssp4f31kQA3BkjLlgxsJoFArztPw6JS5Dr8dk+z0za/Qol/3eVoiusFOwU4ltVONw3KcTPRK/379X+ujtXyQE64eD4mhN9exfMiN+nbUSoVlRhAqhEV032BM30y1HASZ3cK94fje5c09PAoUyYM4vge0t1PNPVOcH89bVduBtZnyFTI8+S6v0Zz18Zw6fA9ts9NY5Gu0Ptjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 04:09:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 04:09:58 +0000
Date: Tue, 25 Mar 2025 23:09:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/pmu: Add GT frequency events
Message-ID: <octnzulvdzokmojzeay2zywjaagity3sbsnry243ze3cwnbfx4@wxkgvlptg3el>
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
 <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
 <b46fbbd0-ee96-4f00-9f6f-a00115feb32d@intel.com>
 <87jz8dhw0r.wl-ashutosh.dixit@intel.com>
 <33ebfe1d-5ac5-4985-8c8d-c1996e5a6d14@intel.com>
 <87h63gixq0.wl-ashutosh.dixit@intel.com>
 <269b993d-2a22-4080-8609-66650a60ad62@intel.com>
 <87frj0ivbh.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frj0ivbh.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2ff59b-725d-4ee5-3ba4-08dd6c1c12d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vu2xO8/ebWQzP2uB2gnfNVSbkV8sxFqRdMEbtWlpeg4+8EJXJFG7HO+MnS?=
 =?iso-8859-1?Q?2HXcXzPEzL55ZofxWcoxBvZD/wNPfAuUdYcrvsmBXEy4Ayk/klIw4vNilH?=
 =?iso-8859-1?Q?gmEn7IbBGQMNM7bMo4KIZZnUC6rWvN1D8pL0IFdu9exoOd166rWI0EFoyg?=
 =?iso-8859-1?Q?oErQN3+K/QTBdpRXD+j9vQ9L5ksVjsuyo8v2HxCE365xZOY2KgdBRaakZ+?=
 =?iso-8859-1?Q?4RBvKQPwMLQCPK0tZirDmt2XkibgXtorQoZNV45AVV/NaxeGL17jlqQW0a?=
 =?iso-8859-1?Q?Y8QjuIIudJ3IWOfyh5TO9hJG1UaPJk394r0Nw8e4/WZlveRnRiSjMYao6Y?=
 =?iso-8859-1?Q?i7dgzrSXmj841Tnk48ZOGKDezgraTYqPQS7DqwwxP7iuwa28VezklbA1rb?=
 =?iso-8859-1?Q?UnuFmMgoLBF83j3DqgJtNYGG0n4HbrFp/MYw0rFwgYF81I+NYu85myTsfa?=
 =?iso-8859-1?Q?DGIPlZ0g2gFhfe6CSZQNjUwWlrmp4Q0yRl5CAY6RInbdnXLKNsvNxIvp9b?=
 =?iso-8859-1?Q?cjBX/1NGZCDHaCTcR/VD5qEps0MtXqOkERVAS2R8J2bZd+BAAWhZ6Z9SlJ?=
 =?iso-8859-1?Q?ZRDiAoDlwNoRRzhlyi3z+n2TY219NUfrdgJ3oDT45NBbaiF3trNcknT99/?=
 =?iso-8859-1?Q?oF22lnqLEg+NXric3DbEkl1sXI9a81q+DCQdb5VAa5xt82rwKyS14Ufgl1?=
 =?iso-8859-1?Q?Wpuexz1+eFuGf9J+FJiNMG7vWf5A0Ow/zaH5t4Y4rTMvxe8TxEZNpEbsI/?=
 =?iso-8859-1?Q?Bcb7XitfGESqqxMLoqhAUjYmwhY6hIYzbb86W+BxQycVmiV6l/2n26sjb1?=
 =?iso-8859-1?Q?puSuli4OycwP1MphvxsoB4knhgKc5HoW/+dpNEkI7hm457nbn8ZY+cimtO?=
 =?iso-8859-1?Q?L/iJQ2TdZsEwHzHN01YwtD2QRjHJwh6D8R9C+kaVV6GLNBRxcxB5S9SVlf?=
 =?iso-8859-1?Q?pmqfBeFSihOwJf8reV6Oo44sgEZcqq0qTYnl2aBDxFp6agQ83xH4Bx3kt3?=
 =?iso-8859-1?Q?R3VRZDGyPrAhWPrJbeq1QtZvrmKjYIQFD3XOEqKItNfSX/ijXNfgQpECne?=
 =?iso-8859-1?Q?9kNPEacxQMK8JmQt5a+k1qh3xAaUJVqsVHfoYrirGXXjqKIFwQ0JsOixIO?=
 =?iso-8859-1?Q?/MnGDjJRIgnbBSQJ0E+ID2dzsQsJGtVjT3BeW7lwq9DT5urJSD/q3oSbtB?=
 =?iso-8859-1?Q?9Sct9VI+WIhzsuGJKAA73/D8mF5z8hPLiiJswV138bBozxkJ4nw12MfAtK?=
 =?iso-8859-1?Q?xWay94juPHZPimCBOdfzgWVDmpVZouNFFV5mz8DHQzROLqb0idjlxW6Cpg?=
 =?iso-8859-1?Q?9JCvBAwWk7pvp0oZ1276rhWdSS5J1Qflpx1olvKObYSQnP93wz6xdQqNLa?=
 =?iso-8859-1?Q?9DfJt/FsST0xm1xuqk536NrSp72LqvUvH40hxwbV1++cBlHlXoRSb2cQJC?=
 =?iso-8859-1?Q?A+PFWnu1hfqcrvFs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t+ckB8oL9tXjAAmZ5lWrf8+qv4iy3Z1emWUzAeNkXHSyOtUKGsR+62/vfL?=
 =?iso-8859-1?Q?k79tyv4loceDnA/cEBxLNoiMHKNCf5Ls4+x0tiE8zg0Pxl+7m4i1Ok++mX?=
 =?iso-8859-1?Q?zVyIh6AvHlzZPDzBTu8AxKvYRklzqPpPxAPR+55t83PQLoUPNFkMLNdRty?=
 =?iso-8859-1?Q?7TqRoPFZq4DuDdd0olPvDektGS2QSzvrp57h7wBryceImc9b8Ghg2lm8js?=
 =?iso-8859-1?Q?ovszXDJoGMmqG5OmWj+pL7KYUZvnlAM5ZMq5WwnQJeCxg2LnJFQr8YO6RZ?=
 =?iso-8859-1?Q?cm3FK2doHgRHbvF9iAsOacl6EAD8r3yaojFXwY66Wr0kgLXc9gpkq+zx9V?=
 =?iso-8859-1?Q?YAYX338CfJMr5Ef6p0mjzMBJwlLSQuDU2IwYK3vn2gGIVC8q41f+R/D5Ys?=
 =?iso-8859-1?Q?xfTkH+ikXtHDFMcaOVC28aOo7dESbCsB4ETOKYgfLUXEd2xMz8Y+Gb5Oe8?=
 =?iso-8859-1?Q?ocmxP84MZrk1JAez4AfySloCPyXkUhV7of4WwLYBU2gMUFo+59nhjIq8mN?=
 =?iso-8859-1?Q?72Oa3V+2bXHuo0lLtTrXQ0g1Rr6lQBDF8SdXlQo2RtCqi9B+Ozt3x9O4KP?=
 =?iso-8859-1?Q?4y4SCKBS93WVJSoHHjuZkPAZ8sMiAfSQFXirFLm4pyp/Y6n9ImCJ6vMf5W?=
 =?iso-8859-1?Q?9BiIbg5pxwk/qzVMXOmgj4TvscmHULi0HXcHDjMYOljb3yHgQ9ZRdLMvPu?=
 =?iso-8859-1?Q?duGXDQpdyZXLoUyiAGtPDSaZMvuV6vd1ON1y0591rcHT1qYYjYdTj25K7E?=
 =?iso-8859-1?Q?uNS1w1UYgzcw7qHS060pcxmGyNTbc3WmO7YOCZD5rDgF4o6NgJP9w31boq?=
 =?iso-8859-1?Q?3iVOB0Mwnu1tQm4/0P8ZOU6ZxSH75XwdLNHdjH0Ao+Orn8ErH4jU+xjcwz?=
 =?iso-8859-1?Q?RUVGB1LSBwA8z6qFAWmeo3BNf73q9mv++fFa0B3kO6CZim+dF/jxOEczs0?=
 =?iso-8859-1?Q?8e8p5QK4agx9RUm0TcZyufZiWrZhwzoMhErAnrvP6wMUvp3lkJvr5prDMi?=
 =?iso-8859-1?Q?WgRsdQ7Em3S/W2JKXnV2Odyex0HTLjMxivBSJcKaNpbff/xu2YAJTIvwlg?=
 =?iso-8859-1?Q?yazcA1y1aPoz00dWyHtCNVbVPxb36L54RaGp27qaVhj8aFtN+5qmLNCb9S?=
 =?iso-8859-1?Q?oVI7Is1Ay5jEea0G27t3FR7ctmCgwuuBQnFTeMFiDQAFCpjlQYf0uCmja6?=
 =?iso-8859-1?Q?qRaCJjbMNzEijGi0vqugszHOuHSiLRWzidiXjy5Qo/NBsShiryG5mLnHgI?=
 =?iso-8859-1?Q?w7x/pTnuA/7BiFquxdUzcSFFXvtOzw9AKuPz/+LL4Q1IXr1ljeJ89+hbvi?=
 =?iso-8859-1?Q?EHuXj/d8wrp1ki6g3TtcmjZWnpuOaCVLKkiQ17G/iuIt+vYftp9YgVt0YK?=
 =?iso-8859-1?Q?r/0QxZ1DeE1uOaU8xp6MO6qrM1z3OR0NPkPKmWJ/+g066LyF6/CaAONrRW?=
 =?iso-8859-1?Q?Z2ainF79JQfh1KU955pbi7iB2iiGCYQ3NTZrCMQ3GpNPSCt1JoviPVy7zB?=
 =?iso-8859-1?Q?I/2xuTke8Piyqqmt5mfukg9Qv/3Irs8FxkaboVuDAwKne0ZaVIEyy1X0nr?=
 =?iso-8859-1?Q?eYblxadAZyRmWCjKJN2wLeuiFzw0I3eH0U8yCDXTcVfy11jWRfXt6M9+Nb?=
 =?iso-8859-1?Q?66vFT+CP7G9L6YxpfSLG7FOE6186PAuPtiKESf+LIHJ7rH3NknxXI62w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2ff59b-725d-4ee5-3ba4-08dd6c1c12d0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 04:09:58.8784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJfdKsLWBl2vVm+vdS6EgAXtLamKHOTCKqSeUsgEKqYDp0Bae+lMJ033UMzg/XoJqBVLzeW3e8GD5z+oR+f1RXPzJlKZzWtHfPenLDT7XAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
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

On Tue, Mar 25, 2025 at 03:45:06PM -0700, Ashutosh Dixit wrote:
>On Tue, 25 Mar 2025 15:01:47 -0700, Belgaumkar, Vinay wrote:
>>
>>
>> On 3/25/2025 2:53 PM, Dixit, Ashutosh wrote:
>> > On Tue, 25 Mar 2025 13:33:43 -0700, Belgaumkar, Vinay wrote:
>> >> On 3/25/2025 10:15 AM, Dixit, Ashutosh wrote:
>> >>> On Mon, 24 Mar 2025 19:37:32 -0700, Belgaumkar, Vinay wrote:
>> >>> Hi Vinay,
>> >>>
>> >>>> On 3/24/2025 5:18 PM, Dixit, Ashutosh wrote:
>> >>>>> On Mon, 24 Mar 2025 16:24:02 -0700, Vinay Belgaumkar wrote:
>> >>>>>> @@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>> >>>>>>	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>> >>>>>>	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>> >>>>>>		return read_engine_events(gt, event);
>> >>>>>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> >>>>>> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> >>>>>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> >>>>>> +		if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_gt_freq))
>> >>>>> This is unconditionally taking the forcewake and waking the card up just to
>> >>>>> get the sample. Do we really want to do that?
>> >>>>>
>> >>>>> So if we don't do that, both the actual and requested freq will be 0 if gt
>> >>>>> is in C6.
>> >>>> For actual frequency, the register(0xc60) does not belong to any fw domain -
>> >>>>
>> >>>> GEN_FW_RANGE(0xc00, 0xfff, 0),
>> >>>>
>> >>>> HW will report 0 when GT is in C6.
>> >>> Yes, no issue about act_freq, see commit 22009b6dad66. I was referring only
>> >>> to requested freq.
>> >>>
>> >>>> The requested freq register is a
>> >>>> shadowed register (0xa008), so that will not accrue fwake either.
>> >>>>
>> >>>> static const struct i915_range mtl_shadowed_regs[] = {
>> >>>>           { .start =   0x2030, .end =   0x2030 },
>> >>>>           { .start =   0x2510, .end =   0x2550 },
>> >>>>           { .start =   0xA008, .end =   0xA00C },
>> >>> So this still doesn't make sense because:
>> >>>
>> >>>     1. The fact is that xe_guc_pc_get_cur_freq() *is* taking forcewake
>> >>>     2. And that is in accord with the following comment in i915/intel_uncore.c
>> >>>
>> >>>        * Shadowing only applies to writes; forcewake
>> >>>        * must still be acquired when reading from registers in these ranges.
>> >>>
>> >>> Also see intel_rps_read_punit_req() which is called from i915 PMU
>> >>> (frequency_sample()) and uses with_intel_runtime_pm_if_in_use(), so we'd
>> >>> need to do use the equivalent in xe.
>> >> Hi Ashutosh,
>> >>
>> >>    As part of a previous decision, in the Xe PMU implementation, we are
>> >> doing a runtime_get() during pmu_init for all PMU sessions. So, device is
>> >> going to be awake anyways. In this case, it does not make sense to just
>> >> read the register without a fwake.
>> >
>> > Even if that is ok... Let us take a completely idle device. What should the
>> > actual and requested freq's be for this case? Both should be zero, correct?
>> > Now, what are we going to show if we are taking fwake? At least the
>> > requested freq will be non-zero? Is that ok? Or the requested freq will
>> > show zero even if we take fwake? Thanks.
>>
>> If we take fwake before reading, requested frequency will not be zero even
>> if GT is idle. HW always retains the last requested frequency in that
>> register, never zeroes it like it does for actual_freq. So, showing the
>> non-zero value is the correct thing to do instead of artifically zeroing
>> it.
>
>So now, this I disagree with. For an idle device, hopefully in C6, there
>should be no reason to request a non-zero freq. So the requested freq
>should show 0. As i915 does (using gt parked and unparked states and using
>with_intel_runtime_pm_if_in_use()).

wrt locking and interaction with runtime_pm and forcewake, the perf
implementation in i915 is completely broken. You can't take a runtime_pm
or forcewake when you are in an atomic context. And when you have a
raw_spin_lock taken like is the case with perf, you can't even look at
it (if it involves taking a spin_lock, which it does).

perf is holding a raw_spin_lock at that time. The only reason why the
CI isn't on fire over there is because we are papering it over with this
commit in topic/core-for-CI:

dc17a830ffb5 ("Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING."")

>
>If we are already "doing a runtime_get() during pmu_init" (as mentioned
>above) we need to devise some other way of making this happen (maybe by
>looking at xe_force_wake_domain ref field?).

you can't do that safely.

Lucas De Marchi

>
>Let us wait for a second opinion on this. Thanks.
