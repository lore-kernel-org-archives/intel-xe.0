Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC0BC6FA8E
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 01:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B5F10E5B3;
	Fri,  3 Mar 2023 01:22:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5782810E5B3
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 01:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677806576; x=1709342576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1MVjPnvYFO0JOugnJR8OftCECDV9ceEWpk3kHp6dHc0=;
 b=AWfwjP/U5p+f57ZKvo7r2uuAdNzv2KBzWkZQ5N39bd016AFb4JCETWkj
 ltxKG6r9vQlfiheU8gwKaKzLVKdeiyrxpdCKT6oAOzStrR52UgWLM26G+
 Ubs28qhPOiBgWUjWeAwgjG6t4siLLBxJaFyPX8/nf3GcjSNr11X5fDKqR
 Sh/aM/S8uktO2UjsyGPOnGtSqx1wIjxL0Ll4JutqUeHh2VIuaIcw9bt83
 KQnHIjeSVGdb/1cCnZHzP7p2lFcNiwfRuclACfLYEb0yoqIBhG+HnxYvm
 qmzv+IIoMDuE2+1NRw8LbigKN0SVvpsZzCEq0FUpEU4l2fSCu6S4ZESI+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318739241"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="318739241"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 17:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="799058188"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="799058188"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 17:22:55 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 17:22:54 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 17:22:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 17:22:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Mar 2023 17:22:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKLkPoZjxK1ZmP2HpYfrl9F2PPvQfjLPa9j3razHRWYJiiyXrD4emPxdFd3zrunyPVs83ZZkMTmInASHREfPB7MhqrHb4Mcuqn2ZlS2qErN2uH/xNmEpKZQK49YBO+8gJvXkEjgOeD97QItkFly6kpEvpHrVifaVcwzQbUswOjAbgplbN+x+8eoPnn4MidFcgJiu9mi6uelByjmKLH3ccmbBScROnQJZJ/mR9MtD6p0Iv8JoAc3HuEuddFheRinm4HaNb7Q4r6lvhgkuzqiSsGGLVTvVCe25W2I7mQziE/nK+b3NO5EezhINqK4etm5XPjAiekFFHzSEyJc8GHGO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MVjPnvYFO0JOugnJR8OftCECDV9ceEWpk3kHp6dHc0=;
 b=beZ4QHvGBvLVpjojWO/4XTNGwCNcdxLgpxZGn3TLTprFcbWmxy/AC3HsmmzRUbFNa9RZG/tlb+qT46eSRQcSAk4VxpRQcP4B0/Iv7IjwVSadWrUE+CCL+OVY/rSS97Pb7+TcQ3y1n7jiFtxdIlzUAkyf6+LcXVi/6fhKz6uN566MHdhmlRO13+aCzFWRkq9Hhc/L1P5PsEruakOM9JIxgTB94cxxIYzRYJ/OW+Fhhbsz8zQIudGxl8t+JO//nylVdRxul+8aK5GUxz7ZqfTN7NV7vLpBtidsQObtsXZs92quIsIRmnaCQW7rpLCdtg9oQt0tgtWLPcLCmeB2vuFZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 01:22:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 01:22:52 +0000
Date: Thu, 2 Mar 2023 17:22:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@intel.com>
Message-ID: <20230303012247.kif744ik37j5xjxu@ldmartin-desk2.lan>
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
 <20230302013411.3262608-8-lucas.demarchi@intel.com>
 <bf9c5689-faa7-61c6-e903-02cedaa08331@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <bf9c5689-faa7-61c6-e903-02cedaa08331@intel.com>
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a652c79-8fc6-41b0-803f-08db1b85cebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PkwgrGcTBKgaSNJyB8HK09YHvmuJ/yPOHByqHX6Hb4QwkR7xi3NfMDM7mufreK9ZhCgS+3QPvv4Nn8QIdXFPQR6czO/NmBHhM2xeEZMtF56G8naHvzgZnVB90uirExemUexqwyAUTE5qUhf4/S+VjAuRbqOlZhoh67s8CaliqOZT+nq6xiBcGsLjXMZj0jNZdVoaCgxTsZczO2T3x/dxU3CaKPZ8Wsn+49DLaZMOVND2X80+gCqUG+RG/didNifKXC5ELCOUouYj5tq+8DG6iEJgPfUk1oexYt/1N+a7UOvVFhNPWmqV106MnmhvwgLYdn6r8YT/+SP0PUKBhPh6NSRG7kMLXVUocXT+cBvhR3vGTjEQ8IeyR/LyEebaZSRQxJGhwkIAb1s43ZH/pe+nXhmhMVyfuSnRM+v7lJfFYU0C29u3MFb38gdVju416E84vqMdhDnqZwx+tiV/6kG4e/gxldvLsBlGIa+bhOLVDOgPfBglyyf6kuHR3kualDFrAxf5PJ3HlwRR7tCG5Ww4nE60Wi4JTqmWZp+s84JlXsPr65p+RRw3YOA84WDPgNMhdOj/VcNGPLw+Ksb4eDGsP26KgJVLDlVYCjLj96qpDrRzlYcIzUy1X3iE/AHbJ450oHuXVXyjtDeW/jTyjSDp+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199018)(36756003)(6666004)(107886003)(186003)(6506007)(6486002)(9686003)(1076003)(6512007)(316002)(41300700001)(26005)(6636002)(54906003)(8676002)(2906002)(4326008)(66946007)(8936002)(6862004)(478600001)(5660300002)(82960400001)(38100700002)(86362001)(558084003)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HoNM9p/68yvNh0tiK74y+52FUS60Cue0Xax6rYxLiRRTe6LFN04vIClXxoRu?=
 =?us-ascii?Q?00ZUwbIWWT+aXnub2zyhs89S6kK5+ZxKW14v+0C6IzThFtG/FKJ9Tf7w9/19?=
 =?us-ascii?Q?3D2fisxLwa2r6MW03iG8hlKlkcqPQfV7OSlmKHEKHofwqegoS1annZSAKb4B?=
 =?us-ascii?Q?Xw4AofBWfOnCwrzzx2MiXUmwfbowFktG5aDbkal6Tms6p93s5OmSCMuO0cwR?=
 =?us-ascii?Q?oUwPwNwchdJz7LKZ7c6dyJTGt2jqam3eaEWCvNRdPc+yhOfUABfgmX2RGDPj?=
 =?us-ascii?Q?IhM5kzSoJLS7nZM+ZmePPyWaZ98wYCvba3TyoRhxSN2tKWO6OdzgoKijwbo1?=
 =?us-ascii?Q?dzfrTYmKnyrnO4aOgGvxnkEkywYKhycuHHmxza1bifIhBktPuNyCLvD8dxSj?=
 =?us-ascii?Q?L6eKtR3C1iPX5RhxgEBMtmVQ36bfJltzkuzh1StlAeEnoKo8jWT1gT3f5ROh?=
 =?us-ascii?Q?xyS+nZoO1FTMGqj6/ShVL9XoO3L8DQD9KKn+wJlOJEzJp5lSWW82LnG/VAn9?=
 =?us-ascii?Q?OWVDILlqsPSyme8Ph9F2/bNg8kpPh1UfXzzPKW9dDcV24S2xOtL+YQkA2L65?=
 =?us-ascii?Q?tl0bU6/uWSqNUVKn7QiWiQS4c8anc5hzFrzWKfCs9jk6up3Ug/quL1HCpj2t?=
 =?us-ascii?Q?dOs3et/rpgetj33+EgzhMfEWzHWhyg9WcXH+6LxYJZU9oCq0DveAIoxBM08G?=
 =?us-ascii?Q?PMiH1V7A/juuUvAgogw5cH9+Fu7CAWcczlYqfWZRUE8nAUJGo/wcoHM+Exr9?=
 =?us-ascii?Q?ZvGsqFdx22emK9AGZR0kCxB0PEvUHX3lDmH5Il5CcXVYz0TIJlXuE8cVQXWI?=
 =?us-ascii?Q?517bDcb5Mo/M7zZC5gr5zTBbToc3tlsDJdfY+8/nSZS0tNgTXaypAJYmzBjQ?=
 =?us-ascii?Q?qOnn8uHbXoI5E3Cy/6VWJbniPIS6Rufklklg1D4JivTlA/cRcuPmSNZITemX?=
 =?us-ascii?Q?JlkD4K1HjBmUbljXcyU/36Ii2RFK848DnzISHgVsUrw7i0h+QbDTkWODCntj?=
 =?us-ascii?Q?xKhfsDRMv1BhZfaoJJ/NrqWmhkiRu6naDgJ+OcaoOxgKiPs26CRza2LloY17?=
 =?us-ascii?Q?ISE9KWMIxihSY70FVOrV82L6xHJTAqriLpwElKp2alFT8LAi6/kn8M6vIJjv?=
 =?us-ascii?Q?FFw84CdjIcMM6xWLuBbIY1HJQSAFCkLPDq6sLT2iySVbgTJI/BriVOIvFZIO?=
 =?us-ascii?Q?zo/Nh0s03r67jwGpXqbIL4QT7wD4Ln21RzTG2WAHAMzUg9cIghLe9+e0EbkQ?=
 =?us-ascii?Q?Dicg5ucKvBPfB2os+xTIg/yOzBHB4bMgJLsL9MUpT0rO0wqbMIUbKKr4y1Si?=
 =?us-ascii?Q?Jxt0SoShz3RQexnAV3nCaGBkN9o5yQ95HtEl6AJSzsyrPNf2H+2IpriGUX1A?=
 =?us-ascii?Q?HgowM2J6nPJAYAaecAHG7+YC0NnuLr5UGRHAc41Pem4IbO17MHddwHnGefnC?=
 =?us-ascii?Q?GK3LglWpJlUhMGJSrwhpI0x7Xbm0ZQjpNWX2g71k9320LKZ9O27i3Zu5orcq?=
 =?us-ascii?Q?pW/akPggOj3Ty+iXq9w+Y2uhpLxy3vlyUp0SrxvFmmWHH4lCR+4zv3kQjHum?=
 =?us-ascii?Q?h0zRA1xXSrOIBm9K9h4cJ0ePQAxmtdO6P8ht7Nkg4iX2TRHyIjoR7nO0cZ/b?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a652c79-8fc6-41b0-803f-08db1b85cebf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 01:22:51.8501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeo128cCcdow5VbJ2wh8tFoprSbRezsJd7IeUf4hwZejNPis45pdHnrSQ4KL/UrSAmc4P/0xbRAjb0JgOZH2ynJW3thJ8mKylvJQI6LOXZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6985
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe: Remove i915 header dependency
 when building without display
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 12:56:04PM +0100, Maarten Lankhorst wrote:
>Series looks good.
>
>Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

thanks, applied.

Lucas De Marchi
