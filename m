Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42C5CED24D
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 13:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550F610E3BE;
	Mon, 17 Nov 2025 13:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="J7YCQsWd";
	dkim-atps=neutral
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD0B10E113
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Nov 2025 16:12:21 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-bc4b952cc9dso2258495a12.3
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Nov 2025 08:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1763309541; x=1763914341; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t5cd4+npAUuKnvf7yqSeiNwdTs4BeFZNvL4j+IfglEU=;
 b=J7YCQsWdriTDBavzIwU+4xs3R71UrUuvTyvEI7HSrR/rL9VK05BcUieRgLjQJMdTnB
 bEQ7mz06/YvPEvTn2IogpgcGaoyuqFAhzW98pqimz/sp1nFH/UlDWoNjzM/LpobVet/W
 xFmYI4WOkNgaJx4ZdIoWojB4cKQduVg5wKx1UR1fMacNo0zUfzh38huNqfCatW3m3XzO
 a/1YJ9yJY7DRpcEK8xsE+mJXf9C7Yy/PVCHAL5kW+S5InHmkY2gmOiS/nmVKOARLYc30
 qhLcPw1Ph3OiM8XLCeTSP1zE5vlG3SyyyhHoQMmjnlMzQNtfRGzkbkoyFCTVlimTAjvJ
 WEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763309541; x=1763914341;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=t5cd4+npAUuKnvf7yqSeiNwdTs4BeFZNvL4j+IfglEU=;
 b=IJk3Ol5F0b1TizAgYeOV5PzS/F6PF2FGjUqNrr1L+QX/NNeqQtoXl5qx9NFDA8J5E9
 WWSDUnXWWWHR0z1YGELIpQManALsfNvxW4DkQE+PCfmHpIvJ+3cHid9vsOz3rhXCDR5+
 3ft5l62a34kAQyeLywjnVHClcMF0Nvmvb5/QWk+Ahg8v4CzIiu9+abfqODZQ+0ujs70E
 +7fWoXAY1pn6ytd69fuad5HfKPMojTle5NBMfAokgUpHuHJHiIsxNmTnQeHaMDWdljt7
 pgxy06gIspSop+ePmod4n3Hqj7f5Zck8i3mEEidpG9MgUxL8kTMzhIIZN/rHrsQ4XMve
 q3aw==
X-Gm-Message-State: AOJu0YwoedWRqXl7x1oALK9ViyNxoXOuUw9DV+cDMdAeo3KKN3djHXq+
 B8dvmlvz5ZPynU/qKLiM6hwI9UwCwK9Q3DqbwUFn1S7zfME0VcgA6/r3l0+FuaHE2p4YneIfTyf
 KLjST
X-Gm-Gg: ASbGncvP2lB4n1QoVdSBUDQh3aiyAaLy7Y9NKIGABC2GCel6iDTl18/dxSaJsyhMPz4
 M4ZM7NrmHhjlrIhZil3+9xESz1IS7Dn3kGx7Pz7I1RP4YKO2Rcsmb5n2FAAKQmQYFx/JVJgsdxO
 jgKP7g+QKeU4ZSqIKh8r5sAG1jR3CsJ8zRqiZwb+txphL7YdYExeeOhFveuR2kQrCQfOU2t+AEy
 EZncEa53PYWVh/pPQzmoiSt7EF+QZbXXOmheC/cYlpKblx9U6oYIzaROkOhYm9IHHlOvRI7Lr3B
 lluRzIwudobTO2gOqHaqD21xNi2TsUs9Ufh5qzcv51efU7RBJJ0i6p1y/2Zf83pfw0zD+rn6mDa
 B906zzwKrtj4msaFtMNZDFnJBL5rrtnnEMOHnxKeu4zaxkOpN7nkMS6JjRu/j7mRZgLECXQRcO2
 rbRKTkCspfd5+t
X-Google-Smtp-Source: AGHT+IEgRBL5n4O5zcxJxJLjlRSEVpWjai/AT9ZcI0adC+UPrmC/nlwR70Z2rybbM+dwBGXjQzzTBw==
X-Received: by 2002:a05:7022:43a6:b0:11b:1cae:a0fa with SMTP id
 a92af1059eb24-11b40b29828mr5936023c88.0.1763309540940; 
 Sun, 16 Nov 2025 08:12:20 -0800 (PST)
Received: from mozart.vkv.me ([192.184.167.117])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b06088625sm37265033c88.8.2025.11.16.08.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 08:12:20 -0800 (PST)
Date: Sun, 16 Nov 2025 08:12:19 -0800
From: Calvin Owens <calvin@wbinvd.org>
To: intel-xe@lists.freedesktop.org, i915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIExHQ0kuVmVyaWZpY2F0aW9u?=
 =?utf-8?Q?Failed=3A_failure_fo?= =?utf-8?Q?r?= drm/xe: Don't use absolute
 path in generated header comment
Message-ID: <aRn3492nsl0L6mcD@mozart.vkv.me>
References: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
 <176217600352.11629.2483305359054343329@10055242dc62>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176217600352.11629.2483305359054343329@10055242dc62>
X-Mailman-Approved-At: Mon, 17 Nov 2025 13:22:47 +0000
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

On Monday 11/03 at 13:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Don't use absolute path in generated header comment
> URL   : https://patchwork.freedesktop.org/series/156919/
> State : failure
> 
> == Summary ==
> 
> Address 'calvin@wbinvd.org' is not on the allowlist, which prevents CI from being triggered for this patch.
> If you want Intel GFX CI to accept this address, please contact the script maintainers at i915-ci-infra@lists.freedesktop.org.
> Exception occurred during validation, bailing out!

Do I need to get myself added to this allowlist and resend the patch?
