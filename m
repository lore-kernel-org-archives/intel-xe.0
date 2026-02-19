Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B5E9A05E
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 19:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB3710E741;
	Thu, 19 Feb 2026 19:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAA64Gp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C8C10E741
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 19:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771529618; x=1803065618;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LauieW8nH+Q7OOy+7yNMBxJ68bExa86AjyrbX5Uz4mc=;
 b=BAA64Gp6R1HsMpYxN2QTn7GEh1BDNpCw1+ZjPuunWJybuRfhevNnX9Ps
 jc+tz6jCbXpkP9kV/voWseD7z8w7XgEPptxAkSsBhXtyIU3Es2YAttW8g
 3oUnc2A6bUtwkPrGtAHeqzZU0kcEg6W+fYYUxQbZsx58hXtrk7qR5K02H
 +GZTubHROWKGJi0nPmCnr28k1y7mh1+DsddYD6b0LvMdBYZx+wKVKj983
 uUpaiFuKhYOY+41GgkxEmJ59w/AWKOCqp/QJQkyHrYpSw/yiIG1a/5CjG
 9kE1xooaAoWROu7S876N9bY+iX6ifSBjrpA3nWr98fcoo8E/ljwfOlwX8 A==;
X-CSE-ConnectionGUID: HbsPEvqZSy6IGfc/3jwLlg==
X-CSE-MsgGUID: GultZPbfS/eW20+Yati85g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72528088"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72528088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 11:33:38 -0800
X-CSE-ConnectionGUID: VbC5dXV3R7eXGJ/E3Q1SQg==
X-CSE-MsgGUID: OqIB5D3kRAuVvnrnQaB+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="252308802"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 11:33:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 11:33:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 11:33:37 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 11:33:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwV3LdEOM7/41G74c6HeUSNxuifTl7UMVVLDnnUtezqWqbUkoJfJHoMvEdlrCKC8UAXChOFDKbzBVtXKRcuQnfXkI8o15IrlN2gy8UZaoRCCGxIqAB/bgRzwdJtVwqdyDsJPlnyKBm45V68WShlUddjW6KKxq6GqfBhQQyR6bfMoSHHtGgggFd2AiRISa6AQw4AGhLgPsrAYo5S7fnY+3QAogq5AfZqog3cw8hI0VGbog1N29Vp1rX1Yb2OJSe0EBLl4JpU1f1jyQ4JVkuBBOBQGxdPwJwQuYo1/DeUxtBjkxf53TrorrTIN6u3ByrsT9MOQsRVU4uG24F13qVCylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z+j+M1XnhMHS5bkEMipYtNGNVFYUJChcJluXi1r9i8=;
 b=lX5icru73pEEkzHawOOeBPpHuAOBMWtZjtxQyeMwe08dq7AJUKPi0m7JxZUzZt5jmc+4QRtIa5IlUTBY1F431RVhPMFLYIYYFeJXhXJYPXGcqD3gH2EwodwF20rLdboiRa7nYby22UnJrjH+th5Qu0dxpRhlJTcxXFHzSVL3mNjyTNaWzAlE6h5sg3ZKrLEdLlnDdkeRmmK8hU8bYWaAh4hm59vUyTC395ToevWxAqv/0jm3ewNNFYVPE43RUD2qyiflT/vwKW6ZmizC2NiJe+jh5gi98yroDaXr8x6Mi5FQDUZdYL4tk+jFTJs+NHKWCYbnE5c/LT3v5JXizCfdog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6712.namprd11.prod.outlook.com (2603:10b6:806:25c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 19:33:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 19:33:31 +0000
Date: Thu, 19 Feb 2026 11:33:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
CC: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
Message-ID: <aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com>
References: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
 <IA1PR11MB6266DE91973CDC2237B392E7E297A@IA1PR11MB6266.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6266DE91973CDC2237B392E7E297A@IA1PR11MB6266.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4146f8-6c66-4ca2-b776-08de6fedc380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SSPdHC+Oc4yhtaoUXMPosBmHKrhiGskf3uO93NEeT8B4IaUu94jR2ITUbfLo?=
 =?us-ascii?Q?TqMdak+5/vriTbN3i4A2dn9pTcQYp4+RgxNr1z1T4RfdN2RNXc9HUiVI20tX?=
 =?us-ascii?Q?YF4rDhMXTCgJZeSz+U7jbgLpC/IOUJQiCR59zZ2l1xZ4Gwn1OiQTrStX0u+o?=
 =?us-ascii?Q?DCCMxGDnxkaOj6YH8D8inH1n6AzGwKgkqVQaIY6Pepbsfk0C9/Ze2AcdecPF?=
 =?us-ascii?Q?FU/YMAaVehnf5IyPgf9GSZyRc2TEfiYXFOScvtTNKOFaFkt1ekj+Fn83JIJc?=
 =?us-ascii?Q?RXvtQAH5V9bjBu4ASDJyWrXuGwFv3XV0TmVzLQ/99rmMuUrpoHm3FWC2HQBA?=
 =?us-ascii?Q?wfPlX4n6Gnztwfec9QwTedaGhATWhyb+gDxIyTyq66oca57niFiW7AlnIKC4?=
 =?us-ascii?Q?bl25ChdOR1igamVq6S4u0mhpQmQvNAtwZGtvcbw1KLi92wJZErgzcDYVHRt1?=
 =?us-ascii?Q?pgsgcvC+HSNlMMC5TtL/6eIbX0fixe2DGkaQSY/dayowZ8nxIFFDExBNDUBd?=
 =?us-ascii?Q?qxfH1eL/MwnCSqWcO4qBlH3pl7f3XmOA54sqcknR7kGbS9rAYKR3q6+5lF+3?=
 =?us-ascii?Q?olpMga5JE5sraMR6ViDGUHE0ximQZHplSpCxGCPnFY12SleB+aRViqVaH8gj?=
 =?us-ascii?Q?aI9dOpEQqRk4I/pI/8dCLqoCjYERsCzB9FpRudxmF1tNiRfmdK5EtLYhIHPK?=
 =?us-ascii?Q?y3MfzdMPuZFSGMxKJaekHPL3T5y0b2JJuTass/rnHJhbB8hAVT5UPbxuUfnJ?=
 =?us-ascii?Q?Vridbzr9g4BGI99g41FT0XEl/IMAu4xlOC1LO5iSgQxi6HSST4rUx6ItVH2g?=
 =?us-ascii?Q?NOOAzSL8S1awbo1RtVF9MOLEgBNqfMmRQzcuqpVYVEl8E5XuQEls8MN8sAze?=
 =?us-ascii?Q?+KfUUql5fcowzEOyprYY2k5jiobhnWA8BBvliliQJ97sCqOnzYgXceNxx2+H?=
 =?us-ascii?Q?4P70VeOXB6Qu2QKEHkWWmPfCW+nNxmS0I2UIeHrYDvJM9RhD4qSEQaWOUXVA?=
 =?us-ascii?Q?maitZJkRFAkdJrCUiNctcW7oDGYFYzCXENZllQPo7EUnEK46FWBmqjoAjmEC?=
 =?us-ascii?Q?1JAE4xC4VmhmXOJm9tn5/mGIA+ZFz1ewfqsffQcEtLmgsKcBu5xuoTenANP6?=
 =?us-ascii?Q?Aa8+VOdxrC9OyPlBVlN5n2yoQQArcJE+1XLDb5WbOYBpME0dFXSz1nB1Qo36?=
 =?us-ascii?Q?Ux5qMTn5z4Ygl4mhv8R4t3Z/b0PJ/lAq/CS+VbzDJe9k8vk/+rd3TGPiR5P1?=
 =?us-ascii?Q?GbST84b4E+AjFbQmnJ8odGcJCE4eOg6TCJ2vjvAHhCxR2JN9LLE8xgafDYsQ?=
 =?us-ascii?Q?dWFVPIqIvxsq+SMxdfODn3lIbeVkYd+S/9iK/aCGonTvRO/E3OGKYdgl2RLS?=
 =?us-ascii?Q?gEaCqhO+RhR1HA8RBFQFeqxws2PTvBMrW2JJEEj29DkQ6eAT/bemBjzDmS4d?=
 =?us-ascii?Q?yctT3Cz3obegtuW7PugI4oo9jlAE57wFO5VyuAv/9TsPl5y4nyjSTdNjc+wq?=
 =?us-ascii?Q?PTSntKsNIsYgPmkwVbVzHyQau+bUbxcUYnpzZty3awGl7eiAzZGJUlsFBJBw?=
 =?us-ascii?Q?+sfv0xcM1ELMo0EhUAc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Fokm11Mycssee4xCpB45qXPwAmRDMYRR2sh8c/oHnva2j5cX4Xu1MnN1JgR?=
 =?us-ascii?Q?mUctwo+X8r0jp6c+Phg+i7HXEtcm86EJBVehxs6lUrOimVvCfV5mS32cWRm5?=
 =?us-ascii?Q?AAeWPfWHRX7oSNC/m2h09RXtUm4VZvhcilmc02Rz2IlAwNDaoMKNArFpbHBn?=
 =?us-ascii?Q?DHbadZuVhctU2GAqb9uuBhc4mxMmZxoPvVookg50J/oZJVCSV2Fk47OpokGt?=
 =?us-ascii?Q?gKbKIRF6MWvDEhL6WgepaMNuDRCOhAgIZh/zVB2yQWq+ZcddJDkB0NyZ86Al?=
 =?us-ascii?Q?YuePxhC6eQjek8raz0CMaD+hWKkUnXIr0rwWWMNZWJJOxMzykLOEKmBivkyn?=
 =?us-ascii?Q?E545OvIt7G3UVwReaK2JJIM28OAfQNpQEiaR28427kKPcFSjnXYIzi+vlkOt?=
 =?us-ascii?Q?Eg9WhufCsMBtKP4V/wkU7W04JbL+wGOMVr5MvPX0llNhxww3RJeewMW6U5eZ?=
 =?us-ascii?Q?mBhxrwmh1Z7lHbdzq95PyCvWLJ9HVBwjpwQPtPA2qbHwpbDN5h0bRgTPg1bY?=
 =?us-ascii?Q?DrK9ncfarQWk5q/CYZQKNSgJFFdJq1Ro3yK9168PdsNGIxlofaaN+RU5sC/w?=
 =?us-ascii?Q?UlS2plrxOGQN3URfz7I2Gan98QxYlA6YXZyrXM9pNJroGDfKjTBv8psKcHJV?=
 =?us-ascii?Q?CMzKSEvExMFrGIX0kQ0UR3mDy0XnZQu31Wv0Py/pOzW7/TxQI7tXnLf8B+w8?=
 =?us-ascii?Q?YCF9DtnK3hllCxqLw2bsGYKfhRxGlPmgx7qpjgiS7L18u1kcuNekrbzbMeE8?=
 =?us-ascii?Q?qxap9NY5isIBDng+HKPjbGMYYJjpIgSC/rr8R+2cK9AbFb4QGIZL91EswXWe?=
 =?us-ascii?Q?kwotQsObvUHDzfwckBjXMqodqP8OJ/90xZRHr8vynWCi8HsNdQ2J+Bxtdto4?=
 =?us-ascii?Q?FJ9uw5B5aMHPUayVXW3qE5s9ej4AzY8zMMZuc2BNbLKQa6mrsqbPGzXqPVpe?=
 =?us-ascii?Q?/9AeAyz2O3zdTb7CjwCpk17t+y0YWhb5snZDyPkWI5OgXYzwSL0rqOOvfiJ1?=
 =?us-ascii?Q?yBD6HRGjwNWGtc4qZNgcy4zpRe1TZOt3G7/HQNr2vrMjpyI4xguIJAUMgUOf?=
 =?us-ascii?Q?r+nShBusbVwVgO1i1NpAnOFRyVxPiaxP1HMVFVxKSyasCh2pdGSKDi6Q98Eu?=
 =?us-ascii?Q?tsNWhsDeWeHGdpIL2f0CNP/l5q87GeQuMQoIzyN/oryJvPG4qKzkTMvEsB6k?=
 =?us-ascii?Q?+zgCQlISyZkpPG0U/pNh6KKiaBrDuHHH8Xz3e6SIt0zXwMJ2wtjqC1A8+8Tw?=
 =?us-ascii?Q?7ljRuAxEaWfVMa8/lvb9dlZetOj5DknYTUrvblVk7Fhtji8895OcENlOxQlE?=
 =?us-ascii?Q?xnCM6CI5MqhRd4XlH7k5/WiGcohghHVkBwuyjn41g4vMtEG1BkL3hHJkk6Ql?=
 =?us-ascii?Q?ktNgA04BhyuIB3Krmsx3kMupRVq+o8IYwIj0LdMT01PjnMe41Bzn+USTXrpi?=
 =?us-ascii?Q?qrnGJ1eQQlk97Jvq7ZEBJ7++eNSm89MT4mgzpiD08cKSpWuLHcDR5IAsdZC/?=
 =?us-ascii?Q?PlPuSySNrGKoXvCZK1aTgyg872GxX1/8SyXFc5BfvDGPuHuOiFCPDWNSvSiH?=
 =?us-ascii?Q?ZwEDGHyuXeBXGNLp5QbRY7IjbuMrF2vyXQc+GErljeQ5P5+D1EZ1porhIlGa?=
 =?us-ascii?Q?XRCeyuRvlyVP/Q8iocCKnXqrl5NufubIITw9s64XuVdGOJinmduzxFjlMI2g?=
 =?us-ascii?Q?SxoC0E+UVaglsX3ZYGBAZI9JyEN3gofLGez1b0LQD2M6FnpGwl1DwDcZCXQL?=
 =?us-ascii?Q?CtpJWIvA0wXmEQPElB0kzripsaDonpo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4146f8-6c66-4ca2-b776-08de6fedc380
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:33:31.4003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFlHZnydksxDApOM3yjFE70C0O0uBuXZ1/QoYLfNUU6anpP7sDe1iuj2NOdyI7u2TrAl3vz9S5nRLisRpJlm9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6712
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

On Mon, May 12, 2025 at 06:42:03AM +0000, Bhadane, Dnyaneshwar wrote:
> 
> 
> > -----Original Message-----
> > From: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
> > Sent: Thursday, April 24, 2025 3:00 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>;
> > Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>;
> > Taylor, Clinton A <clinton.a.taylor@intel.com>; Atwood, Matthew S
> > <matthew.s.atwood@intel.com>; Bhadane, Dnyaneshwar
> > <dnyaneshwar.bhadane@intel.com>; Kalvala, Haridhar
> > <haridhar.kalvala@intel.com>; Chauhan, Shekhar
> > <shekhar.chauhan@intel.com>
> > Subject: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
> > 
> > In existing code for PIPE CONTROL post sync operation instructions
> > POST_SYNC prefix is not present in the name, add it so that it will represent it
> > is a post sync operation type.
> Is there a specific reason for this renaming? Is it truly necessary?
> Regardless, the terms PIPE_CONTROL_POST_SYNC_TYPE_QW_WRITE and PIPE_CONTROL_POST_SYNC_OP_TYPE_QW_WRITE would be more descriptive. 
> If renaming is indeed required, it should be applied to PIPE_CONTROL_WRITE_TIMESTAMP. 
> This refers to all the post-sync operation types defined and used in the code within the Xe/i915 context.
> 
> Renaming can clutter the Git history with unnecessary changes, making it harder to track the evolution of the code and understand the reasons behind certain modification.

I don't think we should consider git history too much in when making
choices about renaming. If this is a better name, more inline with bspec
I'd say let's use a better name. If we need to rename more operations
with post-sync prefixes, let's also do that.

Matt 

> 
> Regards,
> Dnyaneshwar
> > 
> > Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> > ---
> >  drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 2 +-
> >  drivers/gpu/drm/xe/xe_ring_ops.c                  | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > index 8cfcd3360896..75efdacc4979 100644
> > --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> > @@ -54,7 +54,7 @@
> >  #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
> >  #define	  PIPE_CONTROL_TLB_INVALIDATE
> > 	BIT(18)
> >  #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
> > -#define   PIPE_CONTROL_QW_WRITE				(1<<14)
> > +#define   PIPE_CONTROL_POST_SYNC_QW_WRITE		(1<<14)
> >  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> >  #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
> >  #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11)
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index a7582b097ae6..da50213b78c5 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -145,7 +145,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool
> > invalidate_tlb, u32 *dw,
> >  		PIPE_CONTROL_VF_CACHE_INVALIDATE |
> >  		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
> >  		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
> > -		PIPE_CONTROL_QW_WRITE |
> > +		PIPE_CONTROL_POST_SYNC_QW_WRITE |
> >  		PIPE_CONTROL_STORE_DATA_INDEX;
> > 
> >  	if (invalidate_tlb)
> > @@ -216,7 +216,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value,
> > bool stall_only, u32 *dw,
> >  			      int i)
> >  {
> >  	u32 flags = PIPE_CONTROL_CS_STALL |
> > PIPE_CONTROL_GLOBAL_GTT_IVB |
> > -		    PIPE_CONTROL_QW_WRITE;
> > +		    PIPE_CONTROL_POST_SYNC_QW_WRITE;
> > 
> >  	if (!stall_only)
> >  		flags |= PIPE_CONTROL_FLUSH_ENABLE;
> > --
> > 2.25.1
> 
