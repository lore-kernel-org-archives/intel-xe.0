Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBFBE7E379
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 11:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE75910E0B6;
	Fri,  3 Apr 2026 11:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PG7kj3T+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106B510E0B6
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775216283; x=1806752283;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UvMQp8XEihnb63M+nozzjyYV8Y8Bvx9QnnqKFA4NH9c=;
 b=PG7kj3T+kgX7CMC2UJAtU/czOEW6w2wPiLFBRH+JB3SqZJcBdiFue3E2
 3WbLn1gpIQVsygs86JqQgqdMsZQ6R8r+TSzbRGIXX8T6JueMf3XzwWuSv
 Vb/7wBpMwsESBSgdxCvt9VdVMH8MzVUfLcVvwaIXuE4tbkU2Nb3efXSaw
 qi/qcgq0Rv3ma8RgAzPQSSeaCC6pFC9ZoPlvazrPtUANFV86XR8U6RAG6
 AqsUslZrpJT6Rp+svsWrmqHt75OB9ouYvzF+JBtdqPEF2VF8540T3uRom
 hPd0cfjFRIW6pJNNkp0Tf7r0smNiE3FD5vFE06EC9sg1kFZub/Grey/op A==;
X-CSE-ConnectionGUID: vMHJNyH+RNOkm5c57stoNA==
X-CSE-MsgGUID: EYOeadaKSrWBRnJF9qmzNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76170866"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="76170866"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 04:38:02 -0700
X-CSE-ConnectionGUID: vdFxZkysQyaWnQChwJ5+OQ==
X-CSE-MsgGUID: 5TCkUGomSNCIBIa0OhKLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="226227978"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 04:38:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 04:38:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 3 Apr 2026 04:38:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 04:37:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjnNqaBJsI6CkX4WipXrJpxZuIQ7HXriEEhPrLCc0DOFz3XncClb1i9hYzj4t9KEc9HcChJbJCIFIzEZPg9M4SRshKXpijgNbd8j1AaVbQPQQ6qNbyZsliTkxTm5cvgxH3owo7HvxiTw69o/mQOQjYxZPUl7HSs5s8waBcphSan2UZK8AH4SlE1GML5OO1BbvB185oeQ3DBIN1G0ys53BefYG4G7pgDD5CqKYL7KnXeH29zlzMf0KKA46sbDs6kt/UmrjekoAqZp8vLDd9oWGUATYkJR58YTXB+tuE/suG6girnDxCqV5DzXfNgcWqHTjPs9HRwf4/zXx+lVAR3fWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq1w4Mwwvpe+MDBo8cf3n2tep3H1qiinxACYz+qrBNA=;
 b=kkz39Ymr9pMxEpTSm/Hh793+uC846Qf1cNciQkiV1QF+V+8nkoGhwECWd0LpLjxZYI6t+GVf4C+F1IT43QpJfSveLJjruBirMD/euoERYDQgtxTmyVMxCS484ppUGs8KK0s4+W16jCnSLoECvpg1DfXZXFxlOerPI/PrvwTbcmDLaZ9sxrWeTle5zxZ8U7Tu9kh7yeIR9eELY5w3DHg962BM9J2CgvCnGaSJMiijZ0hSarKGwIQp5LqXp9L4Mtkm2I+dKHNwuhhBvQ8egPNmmd6oH488Y1JlLqIgWJpZI1C5DxVX7ILs7YxrcHACvLpoQ7rShcF+5y302h9E9vPmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by DM6PR11MB4658.namprd11.prod.outlook.com (2603:10b6:5:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 11:37:57 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 11:37:56 +0000
Date: Fri, 3 Apr 2026 13:37:52 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 13/13] drm/xe/pf: Perform fair scheduling
 auto-provisioning
Message-ID: <ac-iEOsjky05Pw4F@nostramo>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
 <20260402191726.4932-14-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402191726.4932-14-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI4PEPF00000156.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::877) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|DM6PR11MB4658:EE_
X-MS-Office365-Filtering-Correlation-Id: 6442eec4-4153-4f37-d83a-08de91757339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: WpDa1/CzRbcNtRLSwqvo5smyG8OZSF11G7O7mVNuZjElNn/jjhVqVvOzdYzoqyoD0/mZw2pjAjhSOzb4LNq3Qdv4rbe3xcHknoTxMNua9kyUEEYpsWrcONVRSon0XnbCUXU6DaGYs8nJmCrl3ybo0MwPu19CxC7rP6tv65et3lfvBmGv7rSRwEp3eWKXtErfMScutOsLbDqRw7M40XbsvFNOFVTJkzAdG8C/htZPkeoZaMSP7aMzt9M7zHPUQMzS46A0ElGplJPhKBPAeJ0XozrHzarmBr/kferOaTybnvknSKu15PDg5PbEvl1xsSUN2tEHy+knZkPnMfc9S0R2iUKRCPNM4TcIf8YwK63LXZ8gmxi5nQPDvtCyOBjOCYb4+wmj9rJw5LtXEUGE8x0FYu8MLuW7UJNpxdSiKsUR93E+iD1q++f33RC+CGpiaGtJXj5mUBB6xbkorGmpHucqihOb5TGD0C8mgLXBSZfLY2VWCBpwnMwkjV6Dluk3amqwzKbjDvvoDIYCrHrPSCbH2AMba5CR+zGL9SmkAgmqXhjXA/m1rL7r1VnfXvhJWtJ0C1RXQf5uMN8jywAkE2OEktI2c/FGEenqds2pssaXp9yG2Vp0lEBqkdkYPKE4tkM1Ilk9Rk3sGEvIwBsCRWuXas3GFADhrs0pyelHJG9zaEyxvCgTVb2ja6Pq4EwN7XxkQ/BP5iwiE7HP7mMyPlnY3RzkG0Va82tt+bJ1BF6ir6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGhlQzVOdU0vUkN2U1pSbm1BcXR0L1dmeGtKOGpNajdxSnZCdVlLTjhtWEJV?=
 =?utf-8?B?Rjh6MHB2YlZiMERrdmJxam9vOGtxZko5OVVIWG9OLzM4STlxNmNoUzNnMUNs?=
 =?utf-8?B?Y1lBN2RoNG9hL2RaeVYxVVRpenpCV20rVVpXSVlmVC8yVExwanBrdmM5L1pB?=
 =?utf-8?B?a3N1UWQ0OFdxRHdRM1Y1OXBUWGJaNXU5bWhXbzExMU4xNUdmanFwcW40ZlBm?=
 =?utf-8?B?WW5zK3c1L2hqK1Yzd2E0TWJkNEx3MFRvcUgvcW52TlRZZ05NbkNDQ3k5T0Qr?=
 =?utf-8?B?WkVBd2dtMjgxNDRKTHJrQVBxVXpEUnZhTlM0bVd4NG01SkpEKzFZcXhtU1Z1?=
 =?utf-8?B?ZisycjUrVnhldW1kSjhEVGMzMXZLdm1VRHNZK2xxMFJKMHBLUE81TU1JNHZu?=
 =?utf-8?B?K0dqQXdsZjFyZDZLZFdSR1ZJU1gzVlE5ZVZ6SEVBWlNzemo4SnZMM1puQzRt?=
 =?utf-8?B?WTNCQzl5bGZKdUxJcklUOGJaZjAxUkFibkpibmpCaWtqcVloR0gvbXVIMkw1?=
 =?utf-8?B?M0ZGTE5BMzl0QjZMYmdkVzlFU1NYZUJvWEpmeWQ2YnJHb1ljdkhESXd6QTh3?=
 =?utf-8?B?RUQvUTFNcjRoQmNaM0swODJ4Y0w2YVZCQXZSeUxkN0dkWFFOK2JGZEovelRH?=
 =?utf-8?B?UnMweXhDNVR0M3B5b05ZYmo5ZUd4QWhYSWRZdEdsbUZWbnhEbWlGeHA5elBo?=
 =?utf-8?B?UXRCbEo1a0tOVkVlOFZEeHBKQ2NORmdQcVVuaU5kZk81RTRuN0FWbTdSSW1p?=
 =?utf-8?B?c2hBeTJpbnpTT2pkdU84ajdJQnNvUExNbHBwc1J0ZldtcytDM2pVR1RyeGFQ?=
 =?utf-8?B?K2U5eUI3U09EMXRkZEh1cVQ1NXZ1eG8xcktBc0o3bk8xd044UWFpNE9HL3Vo?=
 =?utf-8?B?clBoaGxpeEsvYzlQeGZ4ZXdKL2FrQm51LzBCeHA3c0c0YTR6Nyt4cTQ4YklV?=
 =?utf-8?B?VW1tbml1QVV0a3hoSmlCRTlTRUtzMVZxSXlMRHdzQkJ3eVR1bnBLa3Q1QnJN?=
 =?utf-8?B?RGU4c05CYnRxQlZ0cU9yYTNyV1RVZnVrRnFURUR6NDhhblBSeUJ0emZlTEZT?=
 =?utf-8?B?MnZYMDNoRCtva3Vjd3B3V05uUGZyU3JxRTBuM1hBamVZLzZBc0IybFljd2lp?=
 =?utf-8?B?YlRWakVtd0ZkSEFyYTVRblQwZlZJN3hRdUtaNStGa1NYeUZzSTQ4THJTdkxM?=
 =?utf-8?B?cktyQnAwZmU4d0lucTBxQllLeXd4SWFCdWNCOWxuZE1WMGlZMDEwOWRjZWwy?=
 =?utf-8?B?TFZJMjRoN0dUQ0NoRU9KSHZiSmJxUGVOSVJkb2taMGsvMUl1MUozdG9mRXpU?=
 =?utf-8?B?eWRhOWs4S0ZhUUZMMWsyZjZLaUhZNWZadHFzN2E2YnIvTGFKdEtTNk1tVlNK?=
 =?utf-8?B?emdZcFhId1Q3VlJNU0l2SUtiWGFvbi9yRUs1Ym9JTmdIeFlCNWFHdzEwc1F0?=
 =?utf-8?B?bWRtVU9SQXEyTlp4TGZzMEdIT1ZPTmZvWjEvMDFkR01zdjU5ei9FcWVDWWVp?=
 =?utf-8?B?SGFGMDRSQW9RYTZvNXpNeVpWOXA1cmtqRHIwUW95cVNrTmNQMFVNRE9jcXlT?=
 =?utf-8?B?OUNWSWFvM3Y2VjBneTFVN0JwVmszSkhGVU1oUnpqYlpuVkcrc3VqN25vVyts?=
 =?utf-8?B?em5vSGxnNTVReVlDcnNnbExxRzJ2UmNxUEpORDVVZ21hVUlEWlZxWFREUDJr?=
 =?utf-8?B?Q2pqbjNueEZPUkVEL0xjK2pWaGg4aXpUL1ZwQnFGNGMvYTRiM3Y1dk5qUjgy?=
 =?utf-8?B?c0lSczg0TmlBWUY0N3JEY1hRVU4rQnRHY0k1bkgxQ0hzUWtkRzFmQk9YcHU5?=
 =?utf-8?B?NXA4WUdLdXI5dHRPVTdNZ1dkODdEQ1pscEtVRWlPZU5hS3JOaUlxWWYzVkxt?=
 =?utf-8?B?aWdsc1daOVV1bkorWlVUaGdkdlVxelVYTlB1alovS3BOc3BVK29ocWJzZ3Rl?=
 =?utf-8?B?OEJ6NGRBUG9KSVVLTWo4VDB6ck9aeDBLcnpVWWc0TE1YanVnakFSdUJ1RnBl?=
 =?utf-8?B?WVdKSkZjWU1QNGdNNWJZbTZTWUtCT1hrcURpZDJLdkVzd25GaGdDUFpCTXRG?=
 =?utf-8?B?UTNUN250MDR4UHlCTVg3K2hWbUdzNERuRDZNazNmL0lYWmVVTWRyN21palMx?=
 =?utf-8?B?TmtrelIrbTM4V2d0Q0FVN0ZZNWNHNVB1V2FKckJRZUhtakhqRlZHQW1STFdE?=
 =?utf-8?B?V0d4SFpKeXVrV2JFMkFnNmpCL2puSThoWEgxcEpxSHBRK29Od0Vnb2lXeE9D?=
 =?utf-8?B?cVNxaGZBbVlVcDlIWlRCZVp1OW5rRjJYaG9xblBQZ2ZyNklQT1dRTjF4VDls?=
 =?utf-8?B?Z2FDZzFLRUlSdHMvMHBDQVB5dTdSeUxsaG1DcFhETUNUSU5RclZKMVV0OGxs?=
 =?utf-8?Q?3goTa8tM2+MaTSDo=3D?=
X-Exchange-RoutingPolicyChecked: cFayk1J0Y5zM/+oExz34ziunB5q9/WLrH4eTH/JzEqxYZ+ZomRIh//LS65z0kb+NpfgziL9VdofZfkUVLoVXAMPktzvma1uzOfFpr7aOpXucFv0QoVf6MEPefmbNXV0FFogEonl44Qbo/XX+dwl7WCAfA42vAch1/u03osyKspxNX46UmwaboX+4Uo4y2K4sHHe0jo28yu8EkQr0+LzjK/E0W6dvFePew5e/xs8DnY8iZ+aZE47B2XrmS7sxO8AHdjiT2hMd8V0w2rbrBrV4t+iZuHcf3+UbBL3d7Gg51wEMYaA5k/47IaJAvzn/0HZ/9kaBE5xt2uC/jEjhUbfysg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6442eec4-4153-4f37-d83a-08de91757339
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 11:37:56.6085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2j1kz3dEXQ+B8Q7gxjxzpRCUzyid4JLhaeX6XgGEzQ6/vdI7nuwrfGtdqrg6jtljWhle93Y+fu82o3dvkntZDYIFJ4BF/uqVFIDkBf9HjEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4658
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

On Thu, Apr 02, 2026 at 09:17:26PM +0200, Michal Wajdeczko wrote:
> Default VF scheduling configuration is the same as for the PF and
> includes unlimited execution quantum (EQ) and unlimited preemption
> timeout (PT). While this setup gives the most flexibility it does
> not protect the PF or VFs from other VF that could constantly submit
> workloads without any gaps that would let GuC do a VF-switch.
> 
> To avoid that, do some trivial auto-provisioning and configure PF
> and all VFs with 16ms EQ and PT. This setup should allow GuC to
> perform a full round-robin with up to 63 VFs within 2s, which in
> turn should match expectations from most of the VMs using VFs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com> #v1

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
> v2: don't miss to check last VF sched-provisioning (Michal)
>     and explicitly check sched_if_idle (Michal)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 91 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  2 +
>  3 files changed, 94 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index d02c96d3041a..e112aa148dab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2662,6 +2662,97 @@ static bool pf_non_default_sched(struct xe_gt *gt, unsigned int vfid)
>  	       custom_sched_priority(gt, pf_get_sched_priority(gt, vfid));
>  }
>  
> +static void __pf_show_provisioned_sched(struct xe_gt *gt, unsigned int first_vf,
> +					unsigned int num_vfs, bool provisioned)
> +{
> +	__pf_show_provisioned(gt, first_vf, num_vfs, provisioned,
> +			      pf_get_exec_quantum, NULL, "EQ");
> +	__pf_show_provisioned(gt, first_vf, num_vfs, provisioned,
> +			      pf_get_preempt_timeout, NULL, "PT");
> +
> +	/* we only care about non-default priorities */
> +	if (provisioned)
> +		__pf_show_provisioned(gt, first_vf, num_vfs, true,
> +				      pf_get_sched_priority, NULL, "PRIORITY");
> +}
> +
> +static void pf_show_all_provisioned_sched(struct xe_gt *gt)
> +{
> +	__pf_show_provisioned_sched(gt, PFID, 1 + xe_gt_sriov_pf_get_totalvfs(gt), true);
> +}
> +
> +static void pf_show_unprovisioned_sched(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	__pf_show_provisioned_sched(gt, PFID, 1 + num_vfs, false);
> +}
> +
> +static bool pf_needs_provision_sched(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	unsigned int vfid;
> +
> +	for (vfid = PFID; vfid <= PFID + num_vfs; vfid++) {
> +		if (pf_non_default_sched(gt, vfid)) {
> +			pf_show_all_provisioned_sched(gt);
> +			pf_show_unprovisioned_sched(gt, num_vfs);
> +			return false;
> +		}
> +	}
> +
> +	if (xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt)) {
> +		pf_show_all_provisioned_sched(gt);
> +		pf_show_unprovisioned_sched(gt, num_vfs);
> +		return false;
> +	}
> +
> +	pf_show_all_provisioned_sched(gt);
> +	return true;
> +}
> +
> +/* With 16ms EQ/PT GuC should be able to handle up to 63 VFs within 2s */
> +#define XE_FAIR_EXEC_QUANTUM_MS		16
> +#define XE_FAIR_PREEMPT_TIMEOUT_US	16000
> +#define XE_FAIR_SCHED_PRIORITY		GUC_SCHED_PRIORITY_LOW
> +#define XE_ADMIN_PF_SCHED_PRIORITY	GUC_SCHED_PRIORITY_HIGH
> +
> +/**
> + * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
> + * @gt: the &xe_gt
> + * @num_vfs: number of VFs to provision (can't be 0)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	int result = 0;
> +	int err;
> +
> +	xe_gt_assert(gt, num_vfs);
> +	xe_gt_assert(gt, XE_FAIR_EXEC_QUANTUM_MS);
> +	xe_gt_assert(gt, XE_FAIR_PREEMPT_TIMEOUT_US);
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!pf_needs_provision_sched(gt, num_vfs))
> +		return 0;
> +
> +	err = pf_bulk_set_exec_quantum(gt, XE_FAIR_EXEC_QUANTUM_MS, PFID, 1 + num_vfs);
> +	result = result ?: err;
> +	err = pf_bulk_set_preempt_timeout(gt, XE_FAIR_PREEMPT_TIMEOUT_US, PFID, 1 + num_vfs);
> +	result = result ?: err;
> +
> +	xe_gt_assert(gt, XE_FAIR_SCHED_PRIORITY == GUC_SCHED_PRIORITY_LOW);
> +	xe_gt_assert(gt, !xe_gt_sriov_pf_policy_get_sched_if_idle_locked(gt));
> +
> +	if (xe_sriov_pf_admin_only(gt_to_xe(gt))) {
> +		err = pf_provision_sched_priority(gt, PFID, XE_ADMIN_PF_SCHED_PRIORITY);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
>  static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
>  				  enum xe_guc_klv_threshold_index index, u32 value)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index e9314f0a9b4e..2ec62c12ad5c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -78,6 +78,7 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
>  int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
>  					enum xe_guc_klv_threshold_index index, u32 value);
>  
> +int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
>  int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index e11874d689fa..0ec7ea83f12a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -41,6 +41,8 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  	int err;
>  
>  	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_fair_sched(gt, num_vfs);
> +		result = result ?: err;
>  		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>  		result = result ?: err;
>  	}
> -- 
> 2.47.1
> 
