Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FBEC83F01
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 15:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D843510E0BB;
	Thu, 31 Aug 2023 15:45:25 +0000 (UTC)
Received: from ts201-smtpout74.ddc.teliasonera.net
 (ts201-smtpout74.ddc.teliasonera.net [81.236.60.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84AE110E089;
 Thu, 31 Aug 2023 15:45:23 +0000 (UTC)
X-RG-Rigid: 64171A3C0704EB92
X-Originating-IP: [81.229.73.173]
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedviedrudegtddgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvffgnffktefuhgdpggftfghnshhusghstghrihgsvgdpqfgfvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpefvhhhomhgrshcujfgvlhhlshhtrhpnmhcuoehthhhomhgrshesshhhihhpmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeeutdegheffffefjeffhfevlefgffdugeevfeegteejueevjeelffevgfehhfelhfenucfkphepkedurddvvdelrdejfedrudejfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehmrghilhdurdhshhhiphhmrghilhdrohhrghdpihhnvghtpeekuddrvddvledrjeefrddujeefpdhmrghilhhfrhhomhepthhhohhmrghssehshhhiphhmrghilhdrohhrghdpnhgspghrtghpthhtohepgedprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegurghkrhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mail1.shipmail.org (81.229.73.173) by
 ts201-smtpout74.ddc.teliasonera.net (5.8.716)
 id 64171A3C0704EB92; Thu, 31 Aug 2023 17:45:18 +0200
Received: from [192.168.0.121] (81-229-73-173-no17.tbcn.telia.com
 [81.229.73.173])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DEE123631E2;
 Thu, 31 Aug 2023 17:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1693496717; bh=e+vpXZ6TfxDtkc83RYyyzZjdDljLU95++Hh6dgUpmCc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HMCEr0xkPmL+5Ne78hASKygiyszrDVf7vyuxi1dc0bKpEhOJXd5zwdgf29lb8SUvD
 bvRCki/PBXnr1OKzUvaAGZ54Rpz5KZkHkXkLE6dwLVwDawH499FVtdkYMfIkXYnMmd
 Im1JlQ41EAD7vC4trKdIZ2KRigHMNlM7ghw733bs=
Message-ID: <a4666777-4d28-49a2-3114-e97d9868c7e9@shipmail.org>
Date: Thu, 31 Aug 2023 17:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <343997f1-d164-84cb-d7ed-3141620a63e4@shipmail.org>
 <030d631d-1624-987f-1344-6e872862effd@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas@shipmail.org>
In-Reply-To: <030d631d-1624-987f-1344-6e872862effd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] Refcounting in drm_exec
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 8/31/23 17:19, Christian König wrote:
> Hi Thomas,
>
> Am 31.08.23 um 17:12 schrieb Thomas Hellström:
>> Hi, Christian, Danilo
>>
>> Looking at the drm_exec code it seems we refcount *all* locked 
>> objects until drm_exec_fini(). Are callers supposed to be able to 
>> *rely* on this?
>
> Yes, that's one of the motivations for this component.


OK, isn't that a pretty big overhead?


>
>> I'm asking because refcounting appears only strictly necessary for 
>> contended- and prelocked objects, and callers would otherwise need to 
>> make sure they don't drop a locked object across the lock? It's going 
>> to be pretty hard to change this in the future if we want for added 
>> efficiency if people start to rely on it.
>>
>> Also seems drm_exec_unlock_all() drops the prelocked object without 
>> unlocking. I'll put together a patch.
>
> That's correct behavior.
>
> The prelocked object is part of the locked objects array as well. So 
> we just need to drop the reference.
>
> This was actually a bug in one of the earlier versions.

Hmm. I just got a warning that drm_exec_unlock_all() freed a locked 
object. Need to dig a bit deeper then.

/Thomas


>
> Regards,
> Christian.
>
>>
>> Thanks,
>>
>> Thomas'
>>
