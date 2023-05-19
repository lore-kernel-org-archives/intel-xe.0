Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B293C7EE26
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 19:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015C110E47D;
	Fri, 19 May 2023 19:54:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6E310E47D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 19:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684526038; x=1716062038;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=FLt/rqIu+nVaFak2gXLD0TabutFTs22BmlhNELFDh5M=;
 b=Z7O3B8hfPMxliFh51MFklD5oa03lcgyCoa1tGlDL2Q7l5zHrCKeFMRHr
 Hezlv7oFxmQtPloL3QqoKSwIhoT3rg8Xt8QzcDb3eNxtt3jJgpPNibDPQ
 5+x8tbJXPS5kAkxzvL0LHi+ukErRV0zpcdK/tq/umtDs4BD1gXudSH9mr
 BawEhNIKI2WU8ib2NVhpUw3sFs4XUCCi0uHn9qOadgxMaA8O3rZOwgmf8
 ksHB8XcFeTMWRzOZqrrliqMy3p0X2ulYWA6opaxvEyFa0vf6IMj9Jry/O
 wLZ6gX3pgR2odq28CaXq+O+vcT0S18jU8E0uoGE5+CvYihuwdyFphLHtU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="337058475"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="337058475"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 12:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="846999962"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="846999962"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 19 May 2023 12:53:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 12:53:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 12:53:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 12:53:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 12:53:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Auo+R2uj8iYh7Xrc1G0Yrd/lpxyQL4XnzAMkJmxeLlzhevMiU76+3YjZWbPPNukgK0y+98Zn870LXgP8o3QCQms4SfHe5j5SgvdQrdYZ/5eEbw5f7WSLbqWnS4cLBKsrZRp8Xv1vICo+z5YyzjO0a+CnwudBaJ8Dz0YJkuM1jZGYr0AYrdyOLK4YvClak4adx8Vd03x/I/sGwkssm/qVnY+7uOnU7DOkT1ZK9UXtVGeiO/S3tHQCG11aWHQBnPF6WNPOFbKwUfcU+aUFGfHMo9fMF1RnDF2i8UGylEKJegKyUW7S1LO6QRjsF3llfc0aeU5PjHQvjgDXdQGVsa4pOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLt/rqIu+nVaFak2gXLD0TabutFTs22BmlhNELFDh5M=;
 b=CKCh1yKw/Xq39K31/yQIrXOFhmJFwkWWEkbqoFDBygTAu2Sxk0k1jdhRbo4jJl7kqXK6b+9K/Le1XZlwj/GqSEcVJP/5e3MmK70TWAVVp5hh4AjFHRt40Ufdmf+8n2x7medqNEh7Pq1q42E1Y4NIGdg0mBTW5bls2ZXkb1jzGbR4riU5NUDuZKg7OC04p/hhzxLDgZ0dYqXrQBLIMq0YmbLBSGntEnTh5aMn7VmfsCfsIiST6/jzgTx1b9RREviU37CMhESGl5r93m95ltrsv8hZxkbaJcsAWyGNCOMOJFgeo3uaKrvocZPSJqNA4369ZUJz08YKu61r1BJ3y43toQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 19:53:54 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 19:53:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230519194802.578182-1-gustavo.sousa@intel.com>
References: <20230519194802.578182-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 16:53:48 -0300
Message-ID: <168452602819.3171.5853851752222255031@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:334::10) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff2491c-5552-4a90-0ead-08db58a2c67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wme9hAoIoZJIVw1j6Zw1aAwzfaA81cKHxiP9OXwF827MKiA5jDEbSUiAZwc7ZHhBc0cEU/SAzp1nOcj9V8yphUuZDczCfFjXff9kQRq2SeZSCpl8aRNYN4IIeQ2DTUo2gMc5buRUhvuvGZFdYd/GGuFzhN7iotxB6Ct8QmFDd8FigSPOtLBw8wmg3GW0Fg8x9DC+L1It7sNwZw7Ni+eeXk2PI2xpBw1WlbLWDPG/4ojhRYyaQETtnN+Mzl/AwVw5846i4TqL7rzHXkmGQfGQhrVlZSUqirvIHg9uxVH+atjEvZrYHAwns1LnubRTE9f9LxwR/GBMSH0sWZDLNM58ACzsh+A1lON1dnRuFfUHT2n1jK9in4U0QjbyU3+0auRvI5izjm29cKo8nwY0RhNQfnFQ6EdwXq0bgnGfUn11ejiSqvba0vyGC1GWbGVcyn9d0/2t5qK+z39h0lRgfs8/9zWZ8Md7CqNcQhKK5ipq+d843I/ejXpUy2Mf2aJRZaEAIzfq52aUGUkEbh0YiUCzRzUt9xecKsDT8g+DsSL92/s9QdLnW62VWg8iqhuVmXdQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(6486002)(9686003)(6512007)(26005)(6506007)(6666004)(66946007)(82960400001)(66556008)(66476007)(6916009)(8936002)(8676002)(316002)(478600001)(186003)(41300700001)(44832011)(5660300002)(2906002)(38100700002)(558084003)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alZLd3VTbDR0YWJYa1FaUC9RSjBlRTdyRThHZ3hQV3hIaFpjVUt5enBPQThl?=
 =?utf-8?B?UE5BcTBtV2sybk5FZGF2VlZjS21NMWNhcFUyWHFXeHFOOTZrRlJkdmFvRGdO?=
 =?utf-8?B?NUx1d2x2TlAwL1lWUDZ3TmFVQUtmNEo2WHpjZUVSVlFjSlVNMTBBaHFldkg1?=
 =?utf-8?B?YWxjcjk3UWl4bzVYY0lZT09RVlZQVWd5TUZDTVorVmVIQWJGMzRYQzNhNmFk?=
 =?utf-8?B?T0lQZUFoQzIrVFFvdTlEa0NucFpFbUZxOG5SdEJXZTd6dWcvaDVpYlVqOCtE?=
 =?utf-8?B?Rm1yTS8yOG4zZ3lUczB6dU9rZmJBVGFMM21HVTZjVG9qeCsydU5nZmpFRGp6?=
 =?utf-8?B?UmFhSDZ2NytXUmZYUjIycVIraU1UT3FsU1RKbEZPaU1GRWRMa0JmTVhIZGFa?=
 =?utf-8?B?ZEJIL2hlZUtVM1hRODB1Qnk4Y1lpZkIwcHdOSjluZmlxVnNqc1U5N3ozOUJu?=
 =?utf-8?B?dGZOcnhKK1cwWHVKN1ppbnJoZlljaHJvTzlwc1hvVnlUZHY2bW5mWnhJdGwv?=
 =?utf-8?B?MGVEK2lmeG0xV00xSGdNTU00eU5wUjYyRTEzcFNqdDAzcjNEQVdhLzdsVlEv?=
 =?utf-8?B?RVI2bHQ1aWN6SjQwbXJReEx2VkRaVTEzTnVGS21hdlZnTFJMaHo5bHBvN1VI?=
 =?utf-8?B?cWdlMjRpUzEyZDhtVGlld1NLaXB0b0pjd1J2OGxCYnBJZ2UxYzRLUXZWSmx1?=
 =?utf-8?B?RHhOSWk2OWdQTS9kQXFkV3ZpY0d3Z0xReVRZVG9UbmZmYSt5T1ZBWVdnaWlm?=
 =?utf-8?B?OGJrakFXbVBsa2kybHlIYTlhWTdMQnZac0NzdTF3QkdaWi9hRGVPdVp5aENt?=
 =?utf-8?B?bE9rMDV5MDVzdmQ3a3NuQ1puclNYdHFzeGl3cmlGOXA2R2hhdzFCYlpKUWhv?=
 =?utf-8?B?KzVnVUZXLzNUTXJyU3pzWU5icXBYTWtNeVhpazlEOVU2NURsajdPNmtxQWx3?=
 =?utf-8?B?aTMzTXU0b1NrWEdaOTlCenQvWi9XbTJpK0VZbG01aE9DMlZ3ZUNUTXJtak11?=
 =?utf-8?B?ZlBvbzIzU2JaZXlqM1JLMjFZSlcreS8yL1NkUzRhbjk3eXhWc29YS0orZmtV?=
 =?utf-8?B?K2hRNmhVL2NhWUZZMzJKWDNYeksxNXdGQ2xiRWZLVTBBS3lUb2lVa29IZUtr?=
 =?utf-8?B?WlpDY1lERDR0aWJJMkVOOXZqQ3VEcW1vS1dreXZmeUhsRVYxZm5DM3dPU0t4?=
 =?utf-8?B?K0FEQmRncVJxNml1WXNreWx5RkxCVGI5ZldINGNHRWFYWDRscHBCb2YyYTA0?=
 =?utf-8?B?N2FYNHFJYVlJN2dTbFE0ZEhXOFBFaU90a3lxYnJqaWhCendFWUhmQzIzMkQz?=
 =?utf-8?B?eG1qcXp4bWNiMEd1NW01QkRPVkFoSkVCblg2eWh2V3RRV0ROSHJsSkhnY29F?=
 =?utf-8?B?ajZjYkNUU01iY3JtSlNXTEtkYkF2UFJZNVdHSGtNYkMrQlVHRzBHdTBSNGll?=
 =?utf-8?B?cmtYMW1XYTZGMmpoRnRPRXhIUThrd0JMUFhkczUrcVQ0dXYvRXhkcmdGSS9Z?=
 =?utf-8?B?ekxoNGhBeTRKTFphSTAyQlNqb1F4Y3Rnb2FPcVQwcmh5bm9LY21PcWZOWmt3?=
 =?utf-8?B?amhpSTBSN1pKVldIQ1MxY1lKSTlFTnY4cHdtSUV6S1pBNmJScS9tU3JnVmEy?=
 =?utf-8?B?K0dLK0lDalcyaE1GNFRwWktzWncwME9naUFMZ3c1b3hQQXN3SjgzUjJlM1J1?=
 =?utf-8?B?elN4dnQ1UWpmanR4WGVXWDJWaXVSSW9BNUgzU1hYVjdsdHdhdktjRFQrUlJ6?=
 =?utf-8?B?OGduNlVsRzl0VWJoUjAvUzlXeHI2REg2R2lmMXFyVnJoTGtyeDdCRVYrQmJO?=
 =?utf-8?B?aDQ2akF6eklGY3JGYWZOM2ZwbGsvTTVWdVM3dUdnZ1lYRU5NWjhyYVE4RFgz?=
 =?utf-8?B?VWJvRzE1c041aEw0d1VROC85M3MrV3NFVk9yL2dzOXEyeVU2STBSQUJlTURl?=
 =?utf-8?B?bHlGYkVjZTZoY2w2dXptMTdMRWVmbzI5KzBKWkxlSjdrRjBiOFQ5eFFCemJN?=
 =?utf-8?B?N291RVhKU2NrUTM0NEV3ZktHcTZTcVI4MXFkSXJYdHpEa044QVJtdWNNZ1c2?=
 =?utf-8?B?bGJ4QzUydU1YdDBVb2RuZW5DVzFmN1o3MTRWNndSYWJoQUpkSmc5NW8rWWtG?=
 =?utf-8?B?eVVRWUZyYlJIMlI4WTc1cVNCcGFJR3FpbkM0VTNEdENOU2YxL3k3QTNSTU5h?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff2491c-5552-4a90-0ead-08db58a2c67f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 19:53:54.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1qI9bHkwi2sX/RgBAo38OztmRIBab52MigSO9c3Qxrb6n88WVlE8+XCRL0hrWDliDDhv8Rp7jhkLpLGW3ak0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not forget to drm_dev_put() in
 xe_pci_probe():
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

Oops... That ":" at the end of the subject was a mistake. I'll remove when
applying if this patch gets accepted.

--
Gustavo Sousa
