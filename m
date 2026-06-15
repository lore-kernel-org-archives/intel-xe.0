Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54706CD98DE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 08:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70910E286;
	Mon, 15 Jun 2026 08:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbHEB9au";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC81C10E286
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781511716; x=1813047716;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xR5lkBNxSWwdlG7hUO6vw/46F2CvKE7V/3kHCeaqm8o=;
 b=KbHEB9auwRE3zCLCnfOXRRVzo1vwbi58q+1sQ57taezF33pkgeUpMHIp
 VAmWt6myL48Z+Jbxz6WVdTLsrIHcBRXi1Vfm8h5QI01bhSDTkI9ukjNc8
 2dnFBGerwJDhb4q/NXiD/VKXvSJWqSgM68q43cxgdTwLDKmuUonsdCtOi
 24awdXVIxWhr6joLiONb9ij0VZeYppRN73KzJbyrS4SQJnf+W1cuTsKz/
 fWCm4L75Zc9NH1/ypjaNxwTDoIdx9VbYImhnAQ3XtD3xQx7e2vXaJPtRG
 WMMEMeNEtEeuiqONCXbKa22dUh6nUdU3eb5nexlL8oONDirB9M+Qe4el/ w==;
X-CSE-ConnectionGUID: KWcFzQCPTbW5mSWVB9A2WA==
X-CSE-MsgGUID: Ek8oG2rrTtqdrdHmxK1EpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82230114"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82230114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 01:21:55 -0700
X-CSE-ConnectionGUID: 44ZXaG8ITiygCJBwyTg25A==
X-CSE-MsgGUID: NZGdqiI+RBKrw6YXfMtyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="252362863"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 01:21:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 01:21:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 01:21:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 01:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzn1PaZt38WPwacp9c7ckEFd4k7PC1bXs9naSuMP+f0KrtUqu6lLEsoSp531eQ84h6tuGPZL1NbSo2jrR/g/wfZOdEqsWvHsSGp3PmRRXl29AoB5XU6T5WNxKIkB0o1FOztiZWZazIVHIgDUBapyElturHSMs/N6fyVYq+pZsZjEV/5vfh+9a2fOxcZ/OGby/HUUOUJ8OK+NulMqjVKnqYzQdoslJU9IXVNz9CluxmiyRzLz74v35vLg/qly7UbGsGzB6cLgNIPJc6jlzTX+5WmQvXOGJCUDEBEi+SWw/jslSk8AvIGX/jLWVR+r5MMEmg5R1rOtAcBR1AzyL0c+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3jVTITNqlFokLk+4i+cdl7I0w+nYKortZfTB1/vnyM=;
 b=gVgnDuzxMEPD6cftmuXDjUKefF/PYhyhi/brfzC699UY6cIMoZNEZueRVnneIQizI7lRMvWrK0XBY8O5ya1nSchpapuknfY1GibIr9MeH6zyIOKdOpPGwONOHFl5iq5bXu4CM/NMLs5QmwDBOR83CYurgavlRduXLA4CDzXmX0N1GHF4hqlTjcPl0nOddO6JHqqNhw6+Ys46xzB3+OPoK5GlByAbjBahtxZzYDnZtp05PpBfiKVODNLG++ytEJo3z5HMjjdWBj3ySfmxkCE5lAvj3GfZ9Q4HojzGGb+EBOSid6Fmqxs+irpHc5JzqGlvoMbzc5hbpORg0bTdP6A9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:21:51 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0092.011; Mon, 15 Jun 2026
 08:21:51 +0000
Date: Mon, 15 Jun 2026 10:21:47 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Disable display in admin only PF mode
Message-ID: <20260615082147.hikfrzt3c7tpgqtt@intel.com>
References: <20260611124206.3742717-1-satyanarayana.k.v.p@intel.com>
 <20260611142127.v2ehvhyrpjtlpwyo@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611142127.v2ehvhyrpjtlpwyo@intel.com>
X-ClientProxiedBy: DUZPR01CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b3286f-c0d3-4168-ad5c-08decab72700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Aqe2c5mfQKE349MJM7OO2Q1V6AgZ1dFPc8NWmpHoTKvn5oTqK/CyUqKBYa3+OLQTINb3C6snopaDmkWemOBxDRRrV/tyyd0eqqM3QUjWM7akwxWIgvQL+eeuANi2jeQTIS7ALHud5OntU0kM0gPyLvJc+aJLPmvofIF9mOYsNOy/nV8i+AtQo+wg9t9eBF27TnNAaXOPZq+RndWOLZMu5AhJjyWGfN6WBy1FcJ0ReuMxkvHH1SSIo6WXwuUcGjkNOkzud1u4r1Ma/lo0NkYa1Tu4Zc231cdMeORZQxdEfHhcKVG2ntcU68XGryTKTBSdL/Wil+UvZPYKQefg3szhQW8PZH+sCr9bzGz+VrVEQl5Op2jKeLsNycKqRvKZH20C1G6DLPJcYdQUP6kFC9l5SJGMfGE04S3IQGbPdh68nKlKvlilLA/blDCBXj0izxPDWnML4B969FAwixoJlzMm+JX4UrQVd9jYPiz7naS2O+V+ASas7rUHbYR9JPLNsFNafrSAGQwsiqHZ/6FaGxvxUjl8cIWz3QqCl3q6HSnOkrwAtc2Mz7CTLoEI+44uJHZ4Ur4d/f6an0lNryMsKfyTMjZkUS55/1S9QugQTgXxcUgVqxAlJBQWvldvaA2sxzLmJES1ekpahvGasjqLrCX3YdcQ8+5+2oq3gmOvzpJcQrTKAVPEYSEUeXF6XW6/+KqC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXNIU1VPM1g2ZlFvUy8wYnJOcmNTaXp6YTBIb21MQnJNRXZ3SWpTWmFoVUpt?=
 =?utf-8?B?bU9RbUdMYlA1amx1eWF1N2ViUkowWDdRblJSbThvWG5GK3BMRythd042MnZR?=
 =?utf-8?B?ZHM5NFp3dDFscC9NZncrWVhjVWRuRTRDZlUwdmlnd0RhWHJOMS92dXVTUDFY?=
 =?utf-8?B?UmNheXNNdldkUWJiREFQTXVtZC9VNFFkZEhzMXlsOFMxamo0VmJkWG5pSUNQ?=
 =?utf-8?B?SnhFN0RDNWdYbDhQS0RaNmcvV2hRTXNUMm9kVU5pUmdUMW5JTVNGU2VPNGtx?=
 =?utf-8?B?bVc5RjNHaFNXN1UrM3Y2d0QyakJhQkJzbTlNUDJPK1d5aUZDSVhoK2pOWFZM?=
 =?utf-8?B?Nk10dDIvWjlSZlJTOFdjQ09jaWNuNWRSbzBQMG9paU5ESUt2WDRWRkJDZVh4?=
 =?utf-8?B?dDVZVk1EZ1V5dFI3MlUrdk83TXZtSHJnMHRwSmNiZUoxYitIaDlLeWtTd1A4?=
 =?utf-8?B?aFdya0FHOTM2V1BiZVdCME9qdkFLNSt6dTFBRVFkVHNpRUcwY2FUMzNPUHZj?=
 =?utf-8?B?eGtYc3hQalh3ZVI1YW1MSDRxOTJBbjJUeFc1dE5rZUJkNGJpckkydFRJdkRK?=
 =?utf-8?B?eUx6QS9TME9oSDVPeEtPQTdmeWZuTmFzTjhHazM0cGpPRzc5TXBpWUpXbFdy?=
 =?utf-8?B?cDVlRUg1ZHJxdkQ1SHRiY3FmWTJNSFRLWnJGSENndXRFaE8wTm5jcmd1TWhi?=
 =?utf-8?B?RlN1QzBmQ1ZHZnVka2VRQ2E5Zm1JSUJrT3dZUFZtYUp1UFVjV1RkclhLWXdn?=
 =?utf-8?B?clJ1dUJ4cjI1dHFFZmN4MFZhbC9UNzgvcmt2eW8wc0Rnc1BudyswMm4rck05?=
 =?utf-8?B?cnp5NUZ4c1hMN3ZkazdyR2dSbHVyYnhzSzJYWTFPWWJ3Y2lvVlFtdjBhS3RC?=
 =?utf-8?B?STVaYWl6bGlUbkxNQ0Z1b3Ard2FLdU5SRVArdG1YTGFiMmU4L21vU0Z0dGw0?=
 =?utf-8?B?MkRxbzBKd2xBSDJFVGYxWnlzZkFnS2UzL0NnaHovdVk3QS9YMGkzakJOQzdG?=
 =?utf-8?B?dHdaemVDQ1ZPaU5IaGtKNnFmVW1JV0hBR21yL1FxVmcrbmpXbjNmNlB0Ujli?=
 =?utf-8?B?aFZDK0w1UGRQSk1STXJDemwzREtHcDlJZDZXQVNhVEtuZlQvOGN0bmJheUx6?=
 =?utf-8?B?UUZQeW5odDMrM1VzUVRxMUJQN1JSKzRNMjJTNS8zQ0UxUkt3bEh6NW9rVWlx?=
 =?utf-8?B?ZWQydnpSSDJ2eUZEeWtBUkUxU2ZreGIrR281ckRRTWlCaFBhVC9jbnRjYXUr?=
 =?utf-8?B?Nzl5a3B3RDcyQVI5MGhjd2FGd0FFK2tiTC85T1Z1eFdIbmRqU3VMSEtSVXhn?=
 =?utf-8?B?MlZPbUs3V01xZTg0VEpGcjA4YUQ4NE5VbW1KSUNPMVlMczY3Qnk1MVY0Wkdx?=
 =?utf-8?B?TkZHdmtVUnJ4ZVdObjNxZWZEY2tZL0d0aUpTK3hHOEZNTXYxbmtOWTl0KzVi?=
 =?utf-8?B?Q3JkWHFhL2VJdVR1YnZBVXFPODk5UzFoNDE1NEM4ZWpBc1c1TElpRkFzVWZl?=
 =?utf-8?B?ZDQ1cWZJcHVaSFRMTWhuZXRSTTRBUzJlZTdIUkg1TmZVanpPY25EdUpDdXNo?=
 =?utf-8?B?U3lIK0p2aCs3M3E3eXc5cDZET205SURQVlF0eWtCdUNvOHBKcFhwSW1xc2ly?=
 =?utf-8?B?T0JBajllR1B1RlpndkJHSTRRQTdNZ1BsZXQwQTRINFFwMkVPR2ZIUDRpWnpi?=
 =?utf-8?B?d2FOQkUwaSs2aHdyWWxFbmk1KzdEZzdzS1phQVUxcEtaZ2FaamxMVGx0UDJI?=
 =?utf-8?B?WWhFMXVkNytUd2MzaHdiYlpkSGE0NHM5VHBQYkZxY3pIRG1IaHdSUTV0NXpB?=
 =?utf-8?B?SkJyT0hzWm5QK0dvN3ZxVmxMK2JZcmNsbXNQNDQ2T1RTckZDMEV1bmV0Vzdy?=
 =?utf-8?B?aHBhbjFybkpmZVNxR05BeFlzNmYyV205Yy9JUEp4TWxJcDZKNks5UkpOQ29a?=
 =?utf-8?B?TVkvaVM0SzRBUmVKcWFDV1hlc3F5aTNJdmRwVUlmSHJZYTducW0xMW1hdnk0?=
 =?utf-8?B?a0NBYktPWGs2WTNncTMrbFp5Z2Y0NUxYWFFtMDFweitrWTdabll0M05LUS9R?=
 =?utf-8?B?WlhRcnU2QlBIenVDVk1CMmd1SndpU1Y1NHEyc3JhNzQyeUxkUnRoM2grKzVj?=
 =?utf-8?B?RjNwWXgyUzBYdWswcjV6YjgyQ3crZlY4cjEvME1zaVU3Rjg5WnVyZjdGckp1?=
 =?utf-8?B?L0RCRjlRMHVhM0tzY1FZTktyQ3ptMS9TSUtNRGhZSDhPbENKNmk5QkdXOFF1?=
 =?utf-8?B?TkxpdFlTc2w2Q2NaR1RCaWJnRm1JWHlmdU53NksrT2lrdzI1dU9xTUs1d0Zr?=
 =?utf-8?B?eFZORFBjeWJRN05BUTFzb1FPc1VUUUFOSXhlNC8vSmRGNk1MOWJRMVlTQUx1?=
 =?utf-8?Q?Pr9/3Rdx3s1tkE/8=3D?=
X-Exchange-RoutingPolicyChecked: S4cHxBndRl043sKB5jyNHVraZVm4Gw1HQCsFDNwwdlnOvaHaHKVHjkLwuq+hgAbDEo1VmIFMPWM9UMN/ZT3AbsH17b/ciFRwktFk4imsHDl0N2744AlCHmLJ4I//We0XUhC1HCwV5w+Gr7aDSndXp+ggAwMOJynj+LK0s8/WnldLFVuGUGy/v7ZXtHIejTi7Vf+TFQ216SYUJUotV5C7KMlK5A/rmR7xbTvV9/Ucg60f2UH3g01jP0C7CiPp2GRj8Hsobdsfy/HcTeD+raEZeQz89MI+M2G6Fw8gxfVSWW4JpRjLkqo/zOO+uOhh5YrfQokQxmDjT6fJJ23R60uT8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b3286f-c0d3-4168-ad5c-08decab72700
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:21:51.6683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8YLrnh7jU37s0zquk8UuVNPX2CmQhh8QlX77VKOYTNgduUyCY2X9LLN0NYE0KWYQeY6xZ2w7wpJwdlkJ0u3ND8kCGRHrwRnkY4CSVwnhSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
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

Piotr Piórkowski <piotr.piorkowski@intel.com> wrote on czw [2026-cze-11 16:21:27 +0200]:
> Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on czw [2026-cze-11 12:42:06 +0000]:
> > Admin-only PF mode does not expose media or 3D execution capabilities
> > to userspace, so display pipelines cannot receive rendered content.
> > 
> > Fixes: d88c4bac8c2a ("drm/xe/pf: Restrict device query responses in admin-only PF mode")
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 2 --
> >  drivers/gpu/drm/xe/xe_pci.c    | 4 +++-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 51e3a2dd7b22..9c02e0e314c7 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -426,7 +426,6 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
> >  
> >  static const struct drm_driver admin_only_driver = {
> >  	.driver_features =
> > -	    XE_DISPLAY_DRIVER_FEATURES |
> >  	    DRIVER_GEM | DRIVER_RENDER,
> >  	.open = xe_file_open,
> >  	.postclose = xe_file_close,
> > @@ -438,7 +437,6 @@ static const struct drm_driver admin_only_driver = {
> >  	.major = DRIVER_MAJOR,
> >  	.minor = DRIVER_MINOR,
> >  	.patchlevel = DRIVER_PATCHLEVEL,
> > -	XE_DISPLAY_DRIVER_OPS,
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 78fc2e4dcfc6..6fd882443fa5 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -789,7 +789,9 @@ static int xe_info_init_early(struct xe_device *xe,
> >  
> >  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >  				 xe_modparam.probe_display &&
> > -				 desc->has_display;
> > +				 desc->has_display &&
> > +				 !xe_device_is_admin_only(xe);
> > +
> >  	xe->info.force_execlist = xe_modparam.force_execlist;
> >  
> >  	xe_assert(xe, desc->max_gt_per_tile > 0);
> > -- 
> > 2.43.0
> > 
> 
> LGTM: Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

To make patchwork happy:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> 
> 
> -- 

-- 
