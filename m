Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F821CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 20:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D88910E5D5;
	Mon,  6 Oct 2025 20:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPXjrOKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315C310E5D5
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 20:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759783784; x=1791319784;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NZw3p/AAiup2kOoaFYZtKd5vg+JfTNk7gVBFrO5BbS4=;
 b=iPXjrOKQm+5XMg2U8cUTeSarcb+UIZJrDeoibwBh6rUZ9bUBebWJ6l4R
 f0ar6ru7Hr8ikgqNwXsjEizh8ZBO2cB6MToidViF6W0X6GVkHxmpT3rXB
 O8RPv0JK1qDxCKYa4iNKl6sspBXYd2wdoLJTpxSo6YfGS6RkWzYnMus+P
 b92MpUfCUXx5CUvsb9X2zEOcVJarBiIE2bJLYpQdwwHu6PXHRXKtvV77o
 6mHOecbq2UCST/RmmpcajHVaQ4bam4NkvntN9fkA4E6DLhF8WfEDVT2tV
 byd0lrnvnqZIO99pbqZoTN3zROOrrG2imW6ongffqL9KdxW0A3We6JeA6 A==;
X-CSE-ConnectionGUID: 7T8r7WZrRYWeNg6aTjzEog==
X-CSE-MsgGUID: OuSXrKtgTDm2UgmPwM2TnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61917268"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61917268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 13:49:43 -0700
X-CSE-ConnectionGUID: C1v1Nra4ThS6ky2I2dzu2w==
X-CSE-MsgGUID: xVk+dWv9Qmm2gDc1T1NsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179782695"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 13:49:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 13:49:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 13:49:42 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 13:49:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHuRQebPDA62r52Wd/IM3XVcJllpPJHHQPtuGbwmfwZA9EIZIpPglbpEEkIhuy+N71pi8cEhg5Xf3+K+RaleJmrgoPuEM80FnzaXIAUk+fUBR2LhwruGe2UUVS8scWgeWTvGeimTtIQRkNbRbnE6e2J9VJycTZdfYdckRnBIo7/u6lvNngn2Nj8jJetAYXzYm/XkCvSx2YUo0njH0Adq6gLCBuYEcAaFfFeYL0vlw10+41sNpOVCiYenBUWy+EZKiOjSKv9Livknucyp3aEvVbqGDUq+BjgBtbY1UAqhxHj56jPELL4t3dVDsjvJWJ7fcGsa1IzD4zynSgO+HnVOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGChcZ3q6booIMOcGtHsebQ1gK9Zau5ox4dIKUxwHrM=;
 b=N7hogXZrPSs2ASeCFS3jsOxo1LgxdZGVMcyyOof6f562roY1e3af0BdoRIaqLpVqn7rFYFcNbdK5iMZ7UF28B/0bF6iz9xP3zbWqgCWXzp/STZvn18y9dYoNmbtgsTc3sHjb/0+NdkcERC3fU9Nk4Oovfe+OrtJJ1j2j3djp6HxuTJo5GyRPkmPz1Et6IV5B3b8swpXf9lfqkvEc1HTMhSviluqX+OZFKRNid656tAxDegElORw8sj85ksRz9+yeT8QN2ZfZveOfkocdtYt8sFR4YJikI5ZZzKAZaT74GSSHIgye33oUeSOYrHQM+rSqtf/k6iaV0COTdK3jKdKJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Mon, 6 Oct
 2025 20:49:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 20:49:34 +0000
Date: Mon, 6 Oct 2025 13:49:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <rodrigo.vivi@intel.com>, <carlos.santa@intel.com>, <matthew.auld@intel.com>, 
 <jani.nikula@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v5 4/8] drm/xe: Handle xe_user creation and removal
Message-ID: <aOQrXGKw30BJiL+8@lstrano-desk.jf.intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
 <20251006142034.674435-5-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006142034.674435-5-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: dd31fc46-e4bc-4c13-0d45-08de0519db5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?C6B3fwSfIRd7JGn7idGiUBrEsopk4xwl1Sv7VCiZ4TLGn2peBqOMJmnvVd?=
 =?iso-8859-1?Q?bzZNOMZSUnMMmw9QoQR4cZDSZFqfbaWATPK3zEzRIGG7Bl8TAppiICMNxt?=
 =?iso-8859-1?Q?uRoIObAGZA53JKg8SonZcQv7HMSe+KsoLjkrzeY7NKMSj9RFaAF3Zlp0W9?=
 =?iso-8859-1?Q?cakInLbtpkV1sWciy5zeHnTo0hlBcSf/BSsHfLRcYf4mDPcOQTo62c6eCM?=
 =?iso-8859-1?Q?HzEGOX7Jw1BC5atRnb8XJ14YkxkagBGZW0VJaEh7ShgkUHUmdXSw0v2VUJ?=
 =?iso-8859-1?Q?Og50gmm/QNHK5GAaqUUSSDui8z13o1I0ki8FxvLWicVh7WxHxCcgoeNWy4?=
 =?iso-8859-1?Q?q9efTL9THEpIIwA+6SajAKmo+C+wzTe3DCIpChFkFQmlHHmU69QXvB4n1P?=
 =?iso-8859-1?Q?sFhgKiWQ9jlqEs47l/tHHxyXkXXbkRXfU1T2aVkKj106v8hRUobgyj/np6?=
 =?iso-8859-1?Q?z28PKbBcJTlJFaQs8fUL8yQNBrrGSVyTXe61X+RjFvirJFZpF1UaELoDak?=
 =?iso-8859-1?Q?4Mj+elLyL+KgdJFO6vtLRsUlp2q8Dl7IitcTlACI9AKM7qg+E8p+iUHj13?=
 =?iso-8859-1?Q?IDFHORfROcLMksFhMO5hRCVTSWyExppQBrYtvlrj9rbxVI//T1wiCAh5gK?=
 =?iso-8859-1?Q?otMNoIQN1FpC3ceY2NwwtlXLmHNfQdjnYmJIhV4QRKaM9TBuJgNytLepsu?=
 =?iso-8859-1?Q?gw3eF/1NTlpxF4jjaqBZPPE45QUeEfjhUO+bSuERAOa4dQNmlp4glJwzE/?=
 =?iso-8859-1?Q?D+eVguMO91rmqBekb0eoKNKI8Y15SGUKxuIsJSCyoGcQjXJYgt3NgfL81T?=
 =?iso-8859-1?Q?obVQmcDqVi7z1efQAtz4/iteqdDnME8LzECmNf+o6pGrgxN25/zhzP4f3k?=
 =?iso-8859-1?Q?25ZVponTcHkbZ6m8zyuX+Nfqtd933ypfYE6KaBKnZVqdZVlomW8/fnIREV?=
 =?iso-8859-1?Q?mFoK9XVNtTej/euEiCo67IbCsPl/OsZl+wrPUF9Zv2aJaeaK3/DC5pvtFd?=
 =?iso-8859-1?Q?GGmE6a0anTSb3qF75seLmTa0c7bvJFMjc8M72p6aRBajgZSOsxutXPTuTN?=
 =?iso-8859-1?Q?jvGk0POGBWD9KS3Tp6SoEbE3KX9QEdjXbQtwgKjjNlvlSpPLRF9Oz0beP7?=
 =?iso-8859-1?Q?kJ5Q9DDesY8QN7mZKZ7yYLrPFszdvEVRJyrl4evP/LvOii560L3o7GCX6O?=
 =?iso-8859-1?Q?3tojpjzwoWxyPKaA56o3+JWcSasX1f65/zKwqSKe9ixnLVi/TAy36o/0+u?=
 =?iso-8859-1?Q?Emg5KlF7czfx4mTVQfi/4ouQA+9UEjgun7t50BfX+o4VtEu6q8AjC5YA1K?=
 =?iso-8859-1?Q?afO5RT4aUNwU5UV82G2Fwfx693WQMyTuFC/gYnRpoxgVOzo5TvVN9K8Gkf?=
 =?iso-8859-1?Q?SN4nvugrFc4CavaNhA+c+Rbx0uhNAEF94ov9YRlTgGyAoeFHJcGqr0njA2?=
 =?iso-8859-1?Q?rDz6GqTlxeB6yHpKEKGBL0633k1jj2ByNVeh1J1hY/0pwFI00ApEgw194D?=
 =?iso-8859-1?Q?VCjkWRtAHVdgZMf+/Za3co?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tgCdfaYDZJqAc2bCidoeQ4dPJnDJytHgq9fmggUmhw6kPpkw0XCiGVbw/B?=
 =?iso-8859-1?Q?FDz+RNmwysunJKmTwaeN0oY4azH1kiVqkBDMvvEE4Ep1kJi5TUvj0Op+s3?=
 =?iso-8859-1?Q?JcMDnBz+w7GnDS4RgC2Hc62nVfzlp7zJez3hF2ZkVtrue+rspxo3q2C6iI?=
 =?iso-8859-1?Q?bbRNanYmc5f0PMy9w2Ewouf+XDS1Fdft2z3w8+ccSn5nlIeasAllz6pkMD?=
 =?iso-8859-1?Q?PE/hPth+o/+CVHYcrsRCVc40uRArCqdV0IZFPPBRhILtT8G7fd5M1Nr8vz?=
 =?iso-8859-1?Q?atnJ7k2mve1KCnrkzWvptnfWPb1n4qkH+FOj91pC78ISsqxMkAT4X+xUIT?=
 =?iso-8859-1?Q?q369cIhoabJEPddPmg155SJXhed9Az/WRTy6RzEPuiFofeL9tW8IFNuDrN?=
 =?iso-8859-1?Q?fpZl1aV3rHy8sTe97ojoT6txQOA5pSeu8tw6H9yky/n93H2n+wyiGoo4Pd?=
 =?iso-8859-1?Q?4qpyzO4rHAW6vPFfXLtjq0BP7tckWeDN8LbRtlp5SFxEnnxhE88vGU12xY?=
 =?iso-8859-1?Q?kwOl1fOgNLgKQqWPz7j0/w/gGlyc0a7kaIHbhZ36Sre8ov5vkbE5bWqC4R?=
 =?iso-8859-1?Q?pe2fQ5MMXjL0hImCpp2ADpXAamSbLoHrD8NzUP4NwVtJtbBUKn6+uyPLvd?=
 =?iso-8859-1?Q?HFxufZcbzG4AcoqNZQjXFDw8r5Mj6phdg+ZCYyYb562B3yopJqfq7BDBgN?=
 =?iso-8859-1?Q?SEz+iSBdyoBGLyLzWxFLbG5Hj5t5dOK20Uj0zf/EU82dLxTiQM0l/+WLgL?=
 =?iso-8859-1?Q?tAPa2lh4l4TwBs3kO107FKCIVgyEdzT9gz02FQu0feNScSU6xENmzSo/By?=
 =?iso-8859-1?Q?AfsqDw4fyFtVuUds1pQ7+/aMSytmWI27aMs8kv79ZZr+bUQ4sO93M1GHk9?=
 =?iso-8859-1?Q?4y76C0/N/86wHcEjTLb0Bb6/ZnMHLCmvw5e5ujmerrrW0VqV3Z+3Urzt+O?=
 =?iso-8859-1?Q?ibjlgeSy0DH0CNW11T/InEG9l2xnK1astE4fh7Z+Xs4yoVgwXVApInjnRy?=
 =?iso-8859-1?Q?KqphJZTUwAFHRnVluiaJKW5qL0kTFv8ZKYdSx3J/ZoDcTuwCdUUAyIzrUF?=
 =?iso-8859-1?Q?EJ8IjOaWCFNkvimvY+WmgQnVFCXAtafDCA0gpCpKoigtSYpwI5jq7gAoZd?=
 =?iso-8859-1?Q?IM8jNJKFYNFLdxg1+WOI9YJPmtT6Oy4UNqUyy6Z7HaPkld6MgpjE2uHLFR?=
 =?iso-8859-1?Q?ArjxVO1lRHLc2abNz02Hl/hc+rpMKAjdWjZf4oDf1kgHlvGWtNsnXFo/vr?=
 =?iso-8859-1?Q?NX+Lo4dYo1Ad6XWd7GVkp+JKKjPvzWrmGERf1rY14Ft/yYiSgQgAIGaJzW?=
 =?iso-8859-1?Q?EOkm9ayQG96yqzhNxgSagrEac5lLmXWJ1RiUqVfwoZK9yds8g9ovgUDzva?=
 =?iso-8859-1?Q?Kv6WA0K2E7UkjVP4hTp5LAOAZfBXZWS6isPQMXhpcmly7AtkweXKnH1jxe?=
 =?iso-8859-1?Q?kKkj0ggPEguDZx8cDoE6VGPJ5z/QwkTXX7HsWcxmq9OIeMuy6gtds2nI+x?=
 =?iso-8859-1?Q?5XeCxBTvBhDFFyw1DYm2VGxUZbmUIWfjg307t7Fe19jTyfKAiS8I92IpOC?=
 =?iso-8859-1?Q?4bIEDpAEF38lQC/X8znMh3Dxj8Jd/WPq1d1YZkUWUqUJeQ5jUHd5W4HUhE?=
 =?iso-8859-1?Q?JPbRXlQ0C25H9CBVl+w9OSPdNQQLhgHUDtWjuS7nOE68xX2EH6GWt6pg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd31fc46-e4bc-4c13-0d45-08de0519db5a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 20:49:34.7957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCzSBer1D1hfCm632p7C9pC4PcupFf1vrZmtJdRhBt4aOXVhcqb3Tch+S/scgm+BToOGYqTzJAo3jjr8RxoAGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
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

On Mon, Oct 06, 2025 at 02:20:25PM +0000, Aakash Deep Sarkar wrote:
> We want our xe user structure to be created when a new
> user id opens the xe device node and to be destroyed
> when the final xe file with this uid is closed. In other
> words the xe_user structure for a uid should remain in
> scope as long as any process with this uid has an open
> xe file descriptor.
> 
> To implement this we maintain an xarray of xe user
> structures inside our xe device instance. Whenever a new
> xe file is created via an open call, we check if the
> calling process' uid is already present in our xarray.
> If so, we increment the refcount for the associated
> xe user and add this xe file to the list of xe files
> belonging to this xe user. Otherwise, we allocate a
> new xe user structure for this uid and initialize its
> file list with this xe file.
> 
> Whenever an xe file is destroyed, we decrement the
> refcount of the associated xe user. When the last
> xe file in the xe user's file list is destroyed,
> the xe user refcount should drop to zero and the
> xe user should be cleaned up. During the cleanup path
> we remove the xarray entry for this xe user in our
> xe device and free up its memory.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 21 ++++++++
>  drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++
>  drivers/gpu/drm/xe/xe_user.c         | 77 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_user.h         | 11 +++-
>  4 files changed, 123 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 386940323630..5a084fd39876 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -65,6 +65,7 @@
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> +#include "xe_user.h"
>  #include "xe_vm.h"
>  #include "xe_vm_madvise.h"
>  #include "xe_vram.h"
> @@ -82,7 +83,9 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	struct xe_drm_client *client;
>  	struct xe_file *xef;
>  	int ret = -ENOMEM;
> +	int uid = -EINVAL;
>  	struct task_struct *task = NULL;
> +	const struct cred *cred = NULL;
>  
>  	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
>  	if (!xef)
> @@ -107,8 +110,16 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	file->driver_priv = xef;
>  	kref_init(&xef->refcount);
>  
> +	INIT_LIST_HEAD(&xef->user_link);
> +
>  	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
>  	if (task) {
> +		cred = get_task_cred(task);
> +		if (cred) {
> +			uid = (unsigned int) cred->euid.val;
> +			xe_user_init(xe, xef, uid);
> +			put_cred(cred);
> +		}
>  		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
>  		xef->pid = task->pid;
>  		put_task_struct(task);
> @@ -128,6 +139,12 @@ static void xe_file_destroy(struct kref *ref)
>  
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
> +
> +	mutex_lock(&xef->user->filelist_lock);
> +	list_del(&xef->user_link);
> +	mutex_unlock(&xef->user->filelist_lock);
> +
> +	xe_user_put(xef->user);
>  	kfree(xef);
>  }
>  
> @@ -467,6 +484,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>  
> +	xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
> +
> +	mutex_init(&xe->work_period.lock);
> +
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>  		/* Trigger a large asid and an early asid wrap. */
>  		u32 asid;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 54a612787289..4d4e9a63b3fd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -613,6 +613,16 @@ struct xe_device {
>  	atomic_t g2g_test_count;
>  #endif
>  
> +	/**
> +	 * @xe_work_period: Support for GPU work period tracepoint
> +	 */
> +	struct xe_work_period {
> +		/** @users: list of users that have opened this xe device */
> +		struct xarray users;
> +		/** @lock: lock protecting this structure */
> +		struct mutex lock;
> +	} work_period;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> @@ -684,6 +694,12 @@ struct xe_file {
>  	/** @active_duration_ns: total run time in ns for this xe file */
>  	u64 active_duration_ns;
>  
> +	/** @user: pointer to struct xe_user associated with this xe file */
> +	struct xe_user *user;
> +
> +	/** @user_link: link into xe_user::filelist */
> +	struct list_head user_link;
> +
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
>  
> diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> index f35e18776300..cb3de75aa497 100644
> --- a/drivers/gpu/drm/xe/xe_user.c
> +++ b/drivers/gpu/drm/xe/xe_user.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_drv.h>
> +
>  #include "xe_user.h"
>  
>  
> @@ -60,7 +62,7 @@
>   *
>   * Return: pointer to user struct or NULL if can't allocate
>   */
> -struct xe_user *xe_user_alloc(void)
> +static struct xe_user *xe_user_alloc(void)
>  {
>  	struct xe_user *user;
>  
> @@ -71,6 +73,7 @@ struct xe_user *xe_user_alloc(void)
>  	kref_init(&user->refcount);
>  	mutex_init(&user->filelist_lock);
>  	INIT_LIST_HEAD(&user->filelist);
> +	INIT_WORK(&user->work, work_period_worker);
>  	return user;
>  }
>  
> @@ -84,6 +87,78 @@ void __xe_user_free(struct kref *kref)
>  {
>  	struct xe_user *user =
>  		container_of(kref, struct xe_user, refcount);
> +	struct xe_device *xe = user->xe;
> +	void *lookup;
> +
> +	mutex_lock(&xe->work_period.lock);

You don't need to take work_period.lock look here. Xa have there own
locking. work_period.lock should protect the reference upon lookup,
that's it.

> +	lookup = xa_erase(&xe->work_period.users, user->id);
> +	xe_assert(xe, lookup == user);
> +	mutex_unlock(&xe->work_period.lock);
>  
> +	drm_dev_put(&user->xe->drm);
>  	kfree(user);
>  }
> +
> +static struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid)
> +{
> +	struct xe_user *user = NULL;
> +	unsigned long i;
> +
> +	mutex_lock(&xe->work_period.lock);

guard(mutex)(&xe->work_period.lock) will work better here.

> +	xa_for_each(&xe->work_period.users, i, user) {
> +		if (user->uid == uid) {
> +			xe_user_get(user);
> +			mutex_unlock(&xe->work_period.lock);
> +			return user;
> +		}
> +	}
> +	mutex_unlock(&xe->work_period.lock);
> +
> +	return NULL;
> +}
> +
> +int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid)
> +{
> +	struct xe_user *user = NULL;
> +	int ret;
> +	u32 idx;
> +	/*
> +	 * Check if the calling process/uid has already been registered
> +	 * with the xe device during a previous open call. If so then
> +	 * take a reference to this xe user and add this xe file to the
> +	 * filelist belonging to this xe user
> +	 */
> +	user = xe_user_lookup(xe, uid);
> +	if (!user) {
> +		/*
> +		 * We couldn't find an existing xe user for the calling process.
> +		 * Allocate a new struct xe_user and register it with this xe
> +		 * device
> +		 */
> +		user = xe_user_alloc();
> +		if (!user)
> +			return -ENOMEM;
> +
> +
> +		user->uid = uid;
> +		user->last_timestamp_ns = ktime_get_raw_ns();
> +		user->xe = xe;
> +
> +		mutex_lock(&xe->work_period.lock);
> +		ret = xa_alloc(&xe->work_period.users, &idx, user, xa_limit_32b, GFP_KERNEL);

You don't lock here either.

Matt

> +		mutex_unlock(&xe->work_period.lock);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		user->id = idx;
> +		drm_dev_get(&xe->drm);
> +	}
> +
> +	mutex_lock(&user->filelist_lock);
> +	list_add(&xef->user_link, &user->filelist);
> +	mutex_unlock(&user->filelist_lock);
> +	xef->user = user;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> index 9628cc628a37..341200c55509 100644
> --- a/drivers/gpu/drm/xe/xe_user.h
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -6,6 +6,9 @@
>  #ifndef _XE_USER_H_
>  #define _XE_USER_H_
>  
> +#include "xe_device.h"
> +
> +
>  /**
>   * struct xe_user - xe user structure
>   *
> @@ -40,6 +43,11 @@ struct xe_user {
>  	 */
>  	struct work_struct work;
>  
> +	/**
> +	 * @id: index of this user into the xe device::users xarray
> +	 */
> +	u32 id;
> +
>  	/**
>  	 * @uid: UID of this xe_user
>  	 */
> @@ -58,7 +66,8 @@ struct xe_user {
>  	u64 last_timestamp_ns;
>  };
>  
> -struct xe_user *xe_user_alloc(void);
> +int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
> +
>  
>  static inline struct xe_user *
>  xe_user_get(struct xe_user *user)
> -- 
> 2.49.0
> 
