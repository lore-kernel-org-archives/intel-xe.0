Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE760C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 15:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D98510E5C3;
	Tue,  1 Jul 2025 15:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mb7pCcUz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1034910E5C1
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 15:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751382327; x=1782918327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xp8E4CdvR4IQrfU426mXjcvgIts5MXy0KSnQ+dnHZmE=;
 b=mb7pCcUzLb1Gs3pWwPh7HxqLibMdP/4mlr9hHW+D4cMHrqcIo1873L97
 CZW6JHNSVbNmIHCeDf59xxz8iwIwtX3qoBS6D6QnFPOPDEedMa0xgRMqA
 dIUkAAVUfKQtuHa2TNhXp/HZ4RG8FW4RZbMdERSmp5e22tijU5ssbq+gM
 pXfLEXUU1U6EowhVqWWqXy3/cdcQ81ni1VvjrV3ztaYh31buBLlEbsh6b
 JyhUClHDkxTrl/cDiJ5g5dCn+7/jKx5TalJMGrBrB5gCAq7htfufxvc4m
 y0dU0qXcPImMUq+GuqdTVAsXQQ/DWb0S/Mt6Ls8GS3trOHDee4CZgBxbO g==;
X-CSE-ConnectionGUID: Jz6KMPkJTM2MR/eeHbtA6g==
X-CSE-MsgGUID: huNhtI+/TDisjBpt2R1pQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52885359"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="52885359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 08:05:25 -0700
X-CSE-ConnectionGUID: FdrY9cqqRfmncLo90mWMsg==
X-CSE-MsgGUID: 83pM2SwWT4Wd8ui0x4KVGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154111415"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 08:05:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 08:05:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 08:05:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 08:05:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llP1R00wQAq1TXhkN4q/D9sTR2t30gjebxrQ2g0XtDrDpmIH9Gq4E6G200UPKwuLPiF19V2J5etqx2wTsT5ZWzY+BGksUoG/TIAUAEpeK6CgMO5FI6AqModMyoEi2W3ELm0/HVi2DrY5spKJMLZgBmJV9tyzQe3sXxGYoEvaekw7H2hQNO1eNb9/81a0mIsHUeJwSoIhHlVlZAqrunnAE7i+q6N1HHjcYgof/p5ofB9R3SVstvsL9SMPdlRPCJnuiKodAqOt4BUGvr5413IZYd8WyeavOKCgOW20uMx38tU2JY0Re/tydYMQ0wxDK5Lfh1W0m//Q8GxEAfbBnyUtzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rB7GcgLorfpV8rfOtAR9yFG7YOtiInCvhS60jgeuXsg=;
 b=jDllJfoZ8CI7/AnvvU5XqZl75Y+lL4HE1n2ZeH6QXS6JVZYqyBtqCpE+XBsu3lbyYRe2OS37EydH4S6K9RCfGjjngjGn+Ihwzge7Tbcwg+8VZJVbeMHsqBPuQKeSiHlVgQe5DqkGyI7Nx3WMMSLAabIXVCZ7WIQ2YWQjpHuXnepZKfRne/j4ezK9BTMPVBMV5CaLCB6xjD8XAvX7F3rzoEBTbDhx/TFfA8PC0dKcvWx+WBfijdLGTC554xzEohLc6TNlyy2oOKcWL3Em3qi7oIN/oAuJunJZjxtZcb9IjDLuiMjx3+UY65EuFO4+s/Q1CfukAkWUizIZE6oW2d+n0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 15:05:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 1 Jul 2025
 15:05:21 +0000
Date: Tue, 1 Jul 2025 10:05:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fxi typo in Kconfig
Message-ID: <sggmjdrpyodynou6dl722pptstwmkk7xpkvse47yxle4ka7bqb@uhd6ctwevtyt>
References: <20250627074119.347826-1-dev@lankhorst.se>
 <8b8f41a4-779d-4b6c-ae5f-ad780474577f@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <8b8f41a4-779d-4b6c-ae5f-ad780474577f@intel.com>
X-ClientProxiedBy: BYAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: 821414bf-306b-48d3-97ad-08ddb8b0b2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KS0E4F8Ey/3u4h5Lo9HdYkymxiYpRIjcLx7jIJsltCNpbUQl027GbqF5RYGm?=
 =?us-ascii?Q?6eBW5gL2a/AZHU+DX7AYA2YMaXQuOf2RJtijFLxBBrjZDbGU6MrsP+ZjrPaW?=
 =?us-ascii?Q?DAN8qOeIIh6nwSWIA1/jBYzu4krOzWW6Pe+yI9x4kCCfCBzh+arf1uqCC9KW?=
 =?us-ascii?Q?WkkNry8/XvCfOyaK6LjItiQyj58HTQLs0qabyWudTnYAqs1LEJG8MZ1mQ8lX?=
 =?us-ascii?Q?2ezkFbejiqeE4h7Saelp806oD6jeSeGe4COIcVyLDD2wYHeHIA9SvBOo3bZP?=
 =?us-ascii?Q?TrkqGN76eO3/AS23Dy+nkD3DFo+fmWmC3Ksgjgs1kaR3VPbYbv0VeFBMQix4?=
 =?us-ascii?Q?lsl/W+cm92mGdn/V7UXVJAyFQsc86Ltwr7XcWJP9HBNGwFUWu632N2aMbOuM?=
 =?us-ascii?Q?VQwcnMMKcAHBLAV7lQQZ4oMt3+HEkIRrdXI9RSI+wCr81EbMoyVaNwPLg6Dd?=
 =?us-ascii?Q?32jK9TWr8rHEL39lOiKxefs/jBh+IvuVGbu1zd3LQBBFzB5WRCxXUzL6G0ae?=
 =?us-ascii?Q?gEmSeBqZtAbfUm1CUvXgw4K+id8TkDmW59hNwNqa+pQKnlc+JAWuaFdCo5OD?=
 =?us-ascii?Q?hF8FRQct++ntZM353S5GivGOVitzx1deprhfvB2P+NViG1Ur7/1nuYqIiMSn?=
 =?us-ascii?Q?sFGUNmj3zDWsA0M6mG6Fh2JZVb9LRlbRUFspPCNCJ9b3jimyq0IXrawudmGy?=
 =?us-ascii?Q?IFWUiNUEXHv9DaR/1sQwqEk1ulRl5RwA7qvHaaLjzBHXcDe8PmABUklWHS+h?=
 =?us-ascii?Q?M3vgvN9nyAwWp7d1IGQjOuSPr47mTzitLpJDD7U+tm99Am8MBDt8Jp4TSAAJ?=
 =?us-ascii?Q?WPZh5ch+Vrgs5+H6IqU9sI3SIwfpGkLdlpXvZssyIUiWW68JYnfzoIscC8wB?=
 =?us-ascii?Q?s+58WKnBCSkUIOZrNVifc8nilrvmJp+MWeKfLFmInY9Xyauw9+457Ur4Aev5?=
 =?us-ascii?Q?Erq9CS6zFs2TjUGrlNX2WoGYFRPsQco3k+cQTY24Hrr/L/fuOru8vKHOyzX9?=
 =?us-ascii?Q?jFHS0C+Zy9/H6OgNclPQb7WcGYCBDAm9moUWWNuWYwr+AYWzD9BteGLBpGdL?=
 =?us-ascii?Q?/2ZMmfdvYzIQySrVC7T0AFZM/J7B53bEzpE0t2YewO3TRqI8wG85mX181M8t?=
 =?us-ascii?Q?QO90BzETcR6/A3Fey+eaEKBkQy1FIJTwSlylCltQY4BdmXGyVO3vBaHqiRn+?=
 =?us-ascii?Q?b4xurOqe/1hDz2X36VUBCx0or6tJkMNFGWc+wIl7RWSWWlFZGxXewG6mWN1b?=
 =?us-ascii?Q?swpoG9Wn3b19Worp/3MFtYgqENIgWlgtbW0qtFRz1sNuNp9hyOznqO+fmQnt?=
 =?us-ascii?Q?NE9pwJqRh5Ovtw9vcZN/NH3AX9gYC+cfrGanc0fM/h/uFOP86snW2OByXwic?=
 =?us-ascii?Q?oQda9mNu67uGYuAEACgFGhXDIMtYRQiH+iLEds4OwUg0qx30VcSjdT/f1Ybo?=
 =?us-ascii?Q?v7qy1e4zTY8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i9kPkQZxViXxDspnF9xnyvYhC6pMygijjslOVdb/QxGLj1Uu8wkPfbDxnp0x?=
 =?us-ascii?Q?T6WYQUkT/aOZCRvz+GMaFFLBIfoYeDTDiTntZpqRj4ruoBuSKm+5L1SqBIrj?=
 =?us-ascii?Q?1pDgBXo/cpH5FIspV3lgtIb5VUU3A3JE2Lv97qEgd1bJLaKpO970jMwK/20Q?=
 =?us-ascii?Q?rHMXxi77uFOKIBxmEExdTp/cX1VDW1mD1gQOYHWC2MlJMd+JFlMvwxcuiUr1?=
 =?us-ascii?Q?1T2DQ5M4mAqNdl3iP/Timqxb0wK+XOkDivqW41iCHF6CvnKbZwtmfYerlZjW?=
 =?us-ascii?Q?B2a4hKKjQr/IBE2TIEV35wIcxFncoaVjridSKP5gbFbm+4WKZessOOL33VB1?=
 =?us-ascii?Q?togMCtzwhEq8MIx+H3bMle57Li/udhpxSFkYpg6cerWDIIvTIhiwRYNNf7Xu?=
 =?us-ascii?Q?veqV6/zsEXOcmsjBYWhdvweIk6uPxAZugPjjLw5uCLBOB/2p/ttzlu9asJBj?=
 =?us-ascii?Q?rwRmcRAIdJQpQwmjBvpL8wLwTlHw/okSp4w4ZsD31vUoV9tMmMRrKsKvKltg?=
 =?us-ascii?Q?shZ4dzV3XQK4uUCwEgPFOljNJRfD+Z6lh8kUBZwbvvqTg69nBXxSQdV88jUZ?=
 =?us-ascii?Q?eee8SE8v9ORd5gs7eDifFJ49Ti0lqfuk3HSQ7avfxg3Fs0nmJrENIlSTCfR3?=
 =?us-ascii?Q?8uZO1DZIFRAt3DaVTr76mUawbDye5IJkywEXiuivQ8yalfNjLrqr9lX4rXBb?=
 =?us-ascii?Q?HOLNuGTkLtcpeU+JnetbI7U1II45q7tCEAV3tnhFOciXU9V5xHW56/NoZhSu?=
 =?us-ascii?Q?vJWu9Bn4dLqbJPTaAnNGmzw6eVgSSdmGYmoM04QACJQ4PSzav99rAmPxpa1x?=
 =?us-ascii?Q?xjwBIpZEqalePtsQEj8w/7fHFxvjtx9bBc1HT3bGUzWi1CwXblWnssgnhpBp?=
 =?us-ascii?Q?NTj41kRifOeJ6uPF9/iWJsNbtz7lnqG3ayiyt14842bSMAKs73YzfDHfaSlH?=
 =?us-ascii?Q?d9mzcZnTXrP77rdzHLEpDCviGrX7r+Er1UrIsqfRq8Gsk7I6GNFE903eygIc?=
 =?us-ascii?Q?bhmGxGooN8wI+105+gxt7oSk4j0GNhpDjwF4ll3M7DcLN6U6Is+gHhPKDIkS?=
 =?us-ascii?Q?Za/UvesB/KtlrfSiFxJe1JV5u6xV98cWigA9OgMCPpRRcEQxfzu3gVJAXOUs?=
 =?us-ascii?Q?KFv5gBjmPjJdwVgknRhyVCwqPEjWiwwg1lw28ZpKrpatTrloTfwl97oDWstC?=
 =?us-ascii?Q?JLoVyIOEtSmpep04Lpl5nd4ucZljG2XJq+nhY0gYBG15TcZPdB3xYWWxc+YQ?=
 =?us-ascii?Q?Lwmvl6RV6IVf8DLbpwlUk+t49WMrCVbtLpTQmwxlhG7885xbWusZuZQCuqd3?=
 =?us-ascii?Q?BTfaUvFXc7XqUNOKE9THECyK9OP+Mfo/QHoi/RFUM0GD58xxjqTg5Y02vAlm?=
 =?us-ascii?Q?z5KER2N1fS3Nok12oeSEtRhIBTAOGM39CfJEADulU8kJd7ThzRDZ3sXjJh1N?=
 =?us-ascii?Q?WeUX9KRYN/UJvzDEdn3mxrGLeDRADHeinHd42LRDR3GEtQcZUh7McG/AkQdj?=
 =?us-ascii?Q?fDK4gz+9Jr8o7RfVKU11iK5FRPolFIIM1zLqQbNxT0Yjvv47xTp/rPb2kCcN?=
 =?us-ascii?Q?M5sPwjB1IpcXSSne2vmPzqdpbOstUwfbns/FDJiRQ4BHNOl4EerS8g29eE+O?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 821414bf-306b-48d3-97ad-08ddb8b0b2aa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:05:21.4180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfUqnLdDgc0dUEZsVu3ebFfm5+JiqdmU5qtcirxYyrmNSpN/ZOfZUHo2aadTNXV5fTW1WQcPixH/y9VB8aS1WaUoBa3KRJo8xE9n8tphoqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
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

On Fri, Jun 27, 2025 at 09:39:44AM +0100, Matthew Auld wrote:
>On 27/06/2025 08:41, Maarten Lankhorst wrote:
>>doubut -> doubt.
>>
>>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>
>In the commit title also s/Fxi/Fix :)

fixed the typo in the patch fixing a typo and pushed to
drm-ex-next*

[1/1] drm/xe: Fix typo in Kconfig                      
       commit: 5ac5e191973920488cc9050dd12574d33b97eba4 

thanks
Lucas De Marchi

* yes, typo here was intended :)
