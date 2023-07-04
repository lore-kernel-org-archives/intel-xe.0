Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81557EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 17:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DF310E16B;
	Tue,  4 Jul 2023 17:22:17 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72B110E16B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688491335; x=1720027335;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JS4QtUTxbO6TQNJ4t3srkq7rE/STZSPGz84Ul//zlO4=;
 b=loJQkYfUsDvvyDZJutCbQAaOyyHlwNAYmkmBlDhZdWWQIqZuSZ5sdpT6
 8tBiHPnmj+hQn2eFxEfDxx/XbEpbu8yaLkt4tYCmTkNWFlYjmuFLDM++X
 WoMX08xuoPOPif1fI2gvM2eZwhaPGRD+CHWC/h9xlR2VkBim+97bPTSCf
 2xSh+NIN6BdVBLtWGzm75cVPgcPwrTJ/5m4t8GcKxuMNeWqOTwDLLvdCr
 mMZFa8j2canDf3Ekhe5uUUi3/1YOZzD0zcOulZY0l5nuo7Mz48Wm7fsh/
 R1SYh3HLkN4vJ2t30pOIgWwgt0bSEVjt3WweN6wk9Xu1abZf11G6DeKuz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="429203854"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="429203854"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 10:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="784283409"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="784283409"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jul 2023 10:22:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 10:22:13 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 10:22:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 10:22:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 10:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpVDdpkbo1xYMNQliS5GU2BGg5oJOue7P3RPs/9wJzlnSQjCiNFMMAIOBx6UIi9SrujuBbrtMWAKCfmla/GuCcxTmYe1Nq3Qe4NL6j7RZ6NOYVcxHREJzC7s9GQa/jcryzoaFTsSRwblpujYBtczTFB16F1r5tB0wz/w24cGx+yYoHeiVhbLih37f6l5/GdS9eA9I0H1lDazG5u8cZUVmTG6Ph12ji9RuxHu4rn/85FLVYzHmLiQSI2s30rc3O9CgA/Sunyk2hSjkMgVHlAJVVP5k5g0WW80t8Vgjx5FFsIL27i66KCOqBH/qlTaK0l3l1GLa5YrnjaA6keJc+IR1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE5J47Lei47OojuModd4nCHoxHowqZo69F2ad6IIjms=;
 b=oUPuF4qd12li/mg55r4PsgEqu5mFKxWQYnA/0HybYAYPzKU0GfCSi3m3+CcDh0q/a3cGDTnTa0RU6ik/ygfU8GADeLH7Qcq8y2GB/tjgnXTTOUy7HRH5PuPem1C6FsZDgnn/82P5q6C8UQ6p+H3Kd26+0Mxt5iJ6UfD3Jdcd+wi0V1w9UXwF989AMfTwTUNDiw49lh8LpTVnQMsDojaaOgEXwoGsiSazRLCbUvaiQuafWyMlX9iCAFWMwyzqKeQrFII87UstujUDsHr0KeVI/WmFFWFJoZA6I6J/lvsbIdxPdgRvysmSTd54BYK/rhVtuhAHNK5GHA5syT2scTW9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Tue, 4 Jul 2023 17:22:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::bc0:ef1e:892a:e49f]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::bc0:ef1e:892a:e49f%5]) with mapi id 15.20.6565.016; Tue, 4 Jul 2023
 17:22:11 +0000
Date: Tue, 4 Jul 2023 14:22:07 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <6lllhy4olgheda53igtmb7kg2fg7kgn4lroleldkixvq5xhl2c@zz2bxk5ivbp2>
X-Patchwork-Hint: comment
References: <20230704150231.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230704150231.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c8f3cf-13d5-49a9-8b53-08db7cb33393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mXV8V86RahXE45FPWu4QN6zW8zY36oi5Yl0BS7thOmLxb1KVCcN9s48vHayU1x6aTdp4w0CTOMtjCIhGnw3XODKLnDc7uGg3yXhoWyvhp0bTsnQ3zOXSeuH9EI2x3LZHrWd1D5Vvv2hQJZj4YBpC8mvx3RYHWJi+Gd8K0mlf9xRFAhmKrOSpzR6MeAdsrFtnhjSpXAB/phhevkzGOqTBIsYegWruiy47xKuS7Ka/IIC1iQn9mxSu8SVFnUaaX3b1jhCJgg10NZfKv+JQJN089R18viUgaIb2oG7QFtsT2kiDWRtjJhP+MRwjq9bldvVWhaSzciGVEE0/kwVJySlqoW3Zd4mfwJ8+9AQaFofjxIoxsv4aRxQ8UNfdqqMqSdRmZrYUDhBAtzEyaAEBwYFrGUJNyY2XtkbWUfpSQtBq5nXvOxDtryG+jhpfXPgaokcEpHS4H7jJfl3AUnGOvdltuQQanXGLHfQh0G0VmcxMLWnKjlhTIx9gK96PcTNR2aVsTxYtxmIbteJ+/SAXUz+U/zf8Oz3upyxzPMPqCwNXPAokltZGKx5SXKZOirj4RRNo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(41300700001)(86362001)(38100700002)(4744005)(6486002)(6666004)(33716001)(82960400001)(83380400001)(186003)(6506007)(26005)(6512007)(9686003)(2906002)(478600001)(316002)(66476007)(4326008)(66556008)(66946007)(6636002)(8936002)(8676002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sLKUlhMLNyNt5o9hPXs5GnkAd4R9ZfU8LPtNcmrfw3EM1RgHLCZXT0Js3Yyn?=
 =?us-ascii?Q?/rQka4yHCEb7LvW8nnen8+Q1EUhn2OPc/t7ogH3EUWBzoVrq7IWeO0LxMJcT?=
 =?us-ascii?Q?mmDyDn+1QsQfxF2t5T6nOKGId7RvArUN4PNAJu2kOjmE4wBjbqKDcwLwJe7H?=
 =?us-ascii?Q?jEzvXz9CPvG+Xw04eOEmVT2ypmtBFFUFh11jN4jMUijJ+wAzgmxdisnpl0MS?=
 =?us-ascii?Q?MFtOnFh1CAGWEKfKCmloQ1CEN/D+UC16ULCZG8Tn/sDdHDvnXnx/v0NY5yt6?=
 =?us-ascii?Q?g2mQ6zL4vYzwItsNI1BquUrGDzfJlIgq036Go/AJnf9ARxqyfOUfM55uxr3Y?=
 =?us-ascii?Q?YqElp7v+ljMIZB47cP93jABHukClNS6SuPzbU/lvhcF3aI0so4c3KGfQ1V8p?=
 =?us-ascii?Q?vHrmQ6dS0mxKw6Z30nWHpXZvhKn9HyN0aDoVtS//oIvujrnxbRdQz6mkSijF?=
 =?us-ascii?Q?DjRroq7gTLUZfqMsK9aptcE9AVLveROhq5/W39vJ5AUTCOHgdokUvCst2i41?=
 =?us-ascii?Q?mOyZAzfz1h3QnEG+6lswNH4ReeId1KCOJKy5aAjIV52vcz/X0jKBeVaSR5z4?=
 =?us-ascii?Q?TJ3BHflp35xNRsMUOmc6FfbTc+fbvl7TIP8r5xbBL4KBu93SHW+/5yHPFMzu?=
 =?us-ascii?Q?VTl81ejrqglfpXUWup3MObRM3n5TDgmkWfyWvfnjwRlKUqnVms8gB74GX0C5?=
 =?us-ascii?Q?xBXKYtT1IjetyeBSwFTydjwd1I6/3lR98hvcF6k+X+sk7j2yGj+PMSoJwqvN?=
 =?us-ascii?Q?8GkXEsY5v26Tn3C7cVXm/e4ZvSt8dYvjg2vAaI3Yikj6HPvrQM1VtUT0vWab?=
 =?us-ascii?Q?gxfXogUQJ6HhOUSFfNnkVrhLAJusLFRHaS5/9P56zxgEAMLCWdpUjqpUqKSw?=
 =?us-ascii?Q?7ji/aa/cKIF7JVwqrOOpcGZnX2hgPasghZfGfM3s27QQ+ZzSbw/+KsLqADj9?=
 =?us-ascii?Q?mGMePNlBn3FlJCzJQ9tPA12XYg84HeMXkIeE56UMOY9yyzM6iSYPKzPS7kMx?=
 =?us-ascii?Q?fUYwQV6GAPrVQZGE8lHqWuuhT2F5cL9ZCrA5TqvbBabuhOc9GzuDoaCPM06Y?=
 =?us-ascii?Q?ddsGs9/8hT6e/Z4MIr/x1hxBE2zJgo04Yep3ptBJ0QaI0Z1eCwJf1STLyFY9?=
 =?us-ascii?Q?sOHx1XDas4cscj2EvHSANQEECd1ZkKMEEtPh+HtDua7A4mb1RiaiF6lX4B5X?=
 =?us-ascii?Q?XxyrFd0v8qkM4mORj1YU2mCmDr3ySSqxfF6F3IUk10CJCElm21dXRRoV3/dV?=
 =?us-ascii?Q?yFUND8p+kPVd5CV1soGEASyjon36K6lNB48K8HMTrb7MY3OBBnhecFT8Gd+g?=
 =?us-ascii?Q?rLTlkrqfF/zkfDYh0eeQN9Ct6vhmeX6n2RyqvDKmpowdzDCEyCsvJ7kSnbIz?=
 =?us-ascii?Q?BDxtqtPRwgiy0EpNOXg+nNetdor+pB+6U+tIX9K158xOn7Rhcp9G1EwlqoIn?=
 =?us-ascii?Q?E7zPBbhcVDTo1yh+wF61Ag4jkY+YtdKK0YkUUGJEcnqBeMr0UiHZ08/I955A?=
 =?us-ascii?Q?4zWIPRvtVvC0D1dniWGV2B97oqKWSVe4n/LJVDK/ti5oUAsi+b6EZZfYO+iM?=
 =?us-ascii?Q?Cullqlqe6QIpXTdhC40ka79CROHJxseBf49cFnoB7829cO+Ob5NbX8ELtsTo?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c8f3cf-13d5-49a9-8b53-08db7cb33393
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 17:22:11.4409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MhDhokNtKOblId0F/DNN5SRJd9vSaCDFMugr0YEykgXLEwAMlvWlcJt8p2BK62IAqIwjXWazo7BwedTi3GtjpCH+sa37+okd6h3/JwtQhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 03:02:31PM +0000, Francois Dugast wrote:
>Ensure the license is correctly identified using SPDX license
>identifiers in compat header files.

See checkpatch warning for proper SPDX use on headers.
With that fixed,
	
	Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
