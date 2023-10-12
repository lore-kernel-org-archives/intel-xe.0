Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A1CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 19:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB62610E546;
	Thu, 12 Oct 2023 19:59:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CE110E546
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697140746; x=1728676746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t04i8ePd6pInCwxF3S4UGovWtRzrMV8poBdqd4bBK4I=;
 b=MdblZEvUtdW3qY7+6Y4OvX+67vUap6e9fHWaB2ufO3NVXzB376WxtWo9
 KXnreA5qamRAQZOYKOtKE42qSVLwvGZ5NtAZooDms/t7uBwmZKd1GwJTw
 CvQ04SSfW6AD2wL/SW/icibGV5Yye/2uVgXMfp+Br5BZgAX/Tb3EaxD3y
 qjJTgQ/W5jQ9dKH9csFUprID4ErY77rS6OjT8q05otKeIZjktzmKQxtey
 sTWIuE/CF+ffRfbWaOxVtFA+910tFL6qf9jYOUiThB2Uou3lhti7xEqau
 2AnvGG5GvvGzoyfoemyy0EkVdoQJEUhyqDig037BbiPau5If6ycQzkZyq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364394227"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="364394227"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783838926"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="783838926"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 12:59:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:59:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:59:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 12:59:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 12:59:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlOY5g6K/hjBHgVxvFOA33m4vs2M2WNryaXTxa6gQ3Rk4+sp0+kgIjbkrwH4XO3yHOcBrDArEEveTn75mBkx/Yxt03N11kDwJw+ZXP6Fz20IW2925QfVTNXL17qT83n6f965VO60hNTvs3J9o+xxstLHyFuTj2IaDrTc1FhnoM8OIOHMIJPvzVv2pfB4hjK3R6V0+mEPKzMjBLg+chDXyEBKwbrbsGpmIZtuLJ6ytbGMXxXEo4oKNxp4mo6nEA1MEG5Sv4Pu5DcMkCFwKL0DrBi86vCbHI0+hoIcj5MyEc4P7jwnMY4YCXpg2BgB6iLzjbQoJGlxangbxkxFTDlDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksiZEGHjz6iY126UVm10phIvff3YqrZeLy03PtNQkDY=;
 b=oD7z0K5gnoEgpGJ+KHkYJmDRchE9eHDbozUyOCOF+h4bHmWcGGiEMs5v34Ew+AbpOpE1M2Zsgbjy6Rr4WzhzfmfcQzrz7OAFhCw6/xsdyJukaZly9ol0XlP/Lsi/1ZUsxrL8mdPl4nxQ46XD4Rr9p51f06xeU8FbVRQOukWYUkN0lNSL9JMdDRoa0agrFSfIv4i2+uSRDTrEHdrqz3VIUDCu9UL7QO6Yw52JAWs215p4ab1khOCBfGEWZGwoPldT7tess0303XHSk7v285+QSveIOVaauRRqvQjzEedyvoHF+wqGnxeV5yHWld0vT2v9oRjEesjMEE49kEkGxssyyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 19:59:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Thu, 12 Oct 2023
 19:59:02 +0000
Date: Thu, 12 Oct 2023 15:58:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luca@coelho.fi>
Message-ID: <ZShQAX9tkhSKGeQq@intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
 <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
 <20230523163849.GD6250@mdroper-desk1.amr.corp.intel.com>
 <ZG1Rwd2k6oDdiHHT@DUT025-TGLU.fm.intel.com>
 <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
 <ZSRtavVCM2lqbV5y@intel.com>
 <f8c1a6a39300f01b6affc5ecee7b4486dbcb6baa.camel@coelho.fi>
 <e2259843c400c683bf5e958bbf4f7d3abf4e0571.camel@coelho.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2259843c400c683bf5e958bbf4f7d3abf4e0571.camel@coelho.fi>
X-ClientProxiedBy: BYAPR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 08266da3-2503-4ab3-995d-08dbcb5dae7e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GbIsaOM/WAYTeuptx6pHX5FEcXT/vCFBJSzkoNez9WDn2yerYEc/Sad5Bsm1UgMol6jcAFO6718jhBhVnxTWRwWzA5ssaZ2eNNtMEmJmrtnIaOXhrWB9a70qJ+nUvY5UTcYt+2Rd7zdgIBJR/X7f6w3WQxSuGCgmlpDAqhAMKXvOfO1z8oK/R0kbxsgE+QnbLyYaRv9+0Cy/vaQInthRb9Yemu87nURlhoFBe4YHIBSYMgxCTheHO+ZJt1b8BZ19Y2EHnkQA8KAVkdbihQEyPgwqWMcFUpIFw57rdFhauVJuzEnN/ZeHnZGNWbBJMR+NmiwgI7VOIrMy2bhEFtyOHkHcvkqnj4KdrSrWgabeCydCILluaU0AoXzC3VBS+tokIgETutcdmOljuKT+YtMGMvEXRJWTaZ1YKhk3hr/u61C/87iiWUbQIsX3EXV6spkw1xZsGrH7Wa71llRPMTx8m/dFl4UGeP1pDJbUDV4HA6XWZCcpDPWV9yxSg/xaHJnYZdQ9EQFHJI5e7KeP53zhXCJGig3TPhpKBLcvyX/067DvvkZLmZmKAAXZ9QL1pHG+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(376002)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(2616005)(478600001)(6486002)(86362001)(6506007)(6666004)(36756003)(41300700001)(4326008)(8936002)(8676002)(54906003)(6916009)(316002)(66556008)(66476007)(66946007)(4744005)(6512007)(2906002)(4001150100001)(44832011)(5660300002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LAnk6wiM0Ol0R/uCIRRHhadOnoXk8o2FqPPrICbz2z9vOzC6GkRzHRsXeaqJ?=
 =?us-ascii?Q?U2uCQ34irDIV1UWyUnIcxUrnHGICpmxcSLmA+5NfzifKuTUFZdRHQDpU5+aA?=
 =?us-ascii?Q?coRoixgvtjVP1DdtgtT5XBTMqlDd+zIzlZBsQ+dWwEsPGjiU4koPQzTezDM+?=
 =?us-ascii?Q?ls9SVSINZO2xlCqHiHduu/N0Ga+0OuBPc9BvMSyN5q1uvjuLHluTEm1eUD+l?=
 =?us-ascii?Q?tTxkPUeXKBPFSoeTXPBdRXSBtzTk/jL0ZdfxDTyVUxPkWNIxIeFVq9ji+ZoT?=
 =?us-ascii?Q?RJi/6Cn8/8snxk56GQp1GOggX2DVi0TPlyfitmwWL6QDQXSVE5J/bY76f0at?=
 =?us-ascii?Q?db8Bw00AffiDPF3ykUrb4L4nblxVNFpDKv3rFM+q6yts6ESnzZTGUz/8v8Mr?=
 =?us-ascii?Q?Xa8KrlzbB2+zdQbqwLOw+JKrzhjuvgXYLS90h//L/16MSbra2m6+3mdU7RGx?=
 =?us-ascii?Q?UxDGefEl2p6iMQiAGE4MLNI6qciin4GBBCfgDwSywBXrKzPkl+THH1Hi1PeG?=
 =?us-ascii?Q?taz0QNt7lVgLn8BJkrAROnI67E1Qgel0HAoodIhWsCabv7j/RraXT0GTfIGp?=
 =?us-ascii?Q?uXsahzxOzwMlgvrh1DkFYAChFzhlVXx+XOLMsqTWfQHEdVZfyq2MTyrRRiQV?=
 =?us-ascii?Q?IaPhfKOeuWFDzhcqD1Q5SoLlvALdN+wcaIRlS5+okly+jdZUiqZ/DiEPb1kY?=
 =?us-ascii?Q?p8hYx8f6sYdutEAl0wAuhPzXqkuleFMLzYUncuCNGb5pBq6we9q8optto3Hf?=
 =?us-ascii?Q?ThPmswSPHVExouFNy5emXDeqGD/QomwUIc39zTfn2dNcLOPicjvTp8AZQHR0?=
 =?us-ascii?Q?+heeEAgHY6VsTQ6NpolzTCDHKhBWa44CcbVNECJNKiiuEGOvWgrXrspgGpH1?=
 =?us-ascii?Q?xUZMj7k59dZuSjQsgVouzFO37/CosfyoTf3vedk+jKdYKImunBBlH0EV8/af?=
 =?us-ascii?Q?QN0I4biI7ytOzx/E0R7nSqErdABdh1jHOb3EaJB63KtJtCoU6YWjBW0ravlR?=
 =?us-ascii?Q?W6JB7pGpVBT7OO+gjLLjUksQ9P5Oi5H1DURZSS7/3DUCj+g90+p+iAnDRXwp?=
 =?us-ascii?Q?daUTjx4ddLkL23frceGToYBvDW4gnLQfSF0ChopuRXCmKkA0ug05vnvm9+BK?=
 =?us-ascii?Q?N9sUohiJjWBBkeZ949c5n3wTTg9Sud4sYW8ze6TD4Uw7xsuBasxKlZAN/oeb?=
 =?us-ascii?Q?GodbMSPgRqOsFpkQVX33Tz7tasJKpZ+xxwGpIviOoCRXjsYwwSpRXJRayuo5?=
 =?us-ascii?Q?CB0CdDmSGdwttvy2qSt9zOD4KN7UYjMdtEPsoLfoYQknXekriyfZe+/N7xva?=
 =?us-ascii?Q?o9YKyHl2bGtUZP8w2N4Hjjhm9SkmIIzXsdraoxNOwHsPipvSMtduv6iW2ZFU?=
 =?us-ascii?Q?w3w659A1oAbu4B9X5zHNLGzPalsKryEYqe9O77XGhugHGh1ip44CvLqTEkoh?=
 =?us-ascii?Q?oDfmHZ2xd2a+fbczhCrbM5IEovGg07kDlFzNz7eZPK60Vi1xw0J4sh/wT0n+?=
 =?us-ascii?Q?O3kedh+9Kg2PYxfengelH+Tk5QwAwW4AMjSkoFtrjoJgEH0rNesAZV5J/otR?=
 =?us-ascii?Q?2ADf0HCwJ2Iqm8KeQpdWqQlswsAVQ+I8GmcHW6nJqVVbVQqhfizjXXPApjMj?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08266da3-2503-4ab3-995d-08dbcb5dae7e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 19:59:02.6115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtfgilVJ4ckNRhmN4oNO0ncy+xlm/hGeQgOTEqSbwZYPphMXKoZ7tEfbMIZQYIXsy0AVNBb2yzL6fvPVXWYkpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 10:26:30AM +0300, Luca Coelho wrote:
> On Tue, 2023-10-10 at 10:00 +0300, Luca Coelho wrote:
> > On Mon, 2023-10-09 at 17:15 -0400, Rodrigo Vivi wrote:
> > > On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> > > > Any thoughts?
> > > 
> > > Hi Luca, thanks for raising this again here.
> > 
> > Hi Lucas! Thanks for your comments.
> 
> Sorry, I meant "Rodrigo", of course.  My brain probably somehow thought
> that the plural version of my name was more aesthetically pleasing. :D

hehe no worries! I thought it was some "writing accent" that had confused you :)

> 
> --
> Cheers,
> Luca.
